from __future__ import annotations

from ..parsing_funcs import *
from ..writing_funcs import *

from dataclasses import dataclass,field

import os

@dataclass
class Locale:
    id: int = 0x1
    file_name: str = ''
    unk1:      int = 0x0
    parent:    Locale | None = None
    rest_unks: tuple[int,int,int,int,int] = (0,0,0,0,0)
    @classmethod
    def parse(cls, file: BufferedReader, localedb: LocaleDB, id: int = 0x1) -> Locale:
        return Locale(id = id,
                      file_name = read_name(file),
                      unk1 = read_uints(file,1),
                      parent = localedb.get_locale(read_uints(file,1)),
                      rest_unks = read_uints(file,5))
    def write(self, localedb: LocaleDB) -> bytes:
        d =  write_name(self.file_name)
        d += write_uints((self.unk1,localedb.r_locales[self.parent] if self.parent else 0, *self.rest_unks))
        return d
    def __hash__(self) -> int:
        return self.id
    
@dataclass
class LocaleDB:
    file: BufferedReader | None = None
    version:      int = 0xDBAE0D01
    lookup_table: dict[int,tuple[int,int,int,int]] = field(default_factory = dict)
    data_start:   int = 0x0
    locales:      dict[int,Locale] = field(default_factory = dict)
    r_locales:    dict[Locale,int] = field(default_factory = dict)
    name_to_id_dict: dict[str,int] = field(default_factory = dict)
    name_to_locale_dict: dict[str,Locale] = field(default_factory = dict)
    @classmethod
    def parse(cls, file: BufferedReader, signature: int = 0xDBAE0D01) -> LocaleDB:
        return LocaleDB(file = file,
                        version = signature,
                        lookup_table = {entry[0]:entry for entry in [read_uints(file,4) for _ in range(read_uints(file,1)//0x10)][:-1]}, #Cut off the bug entry
                        data_start = file.tell())
    def get_locale(self, id: int) -> Locale | None:
        if   id not in self.lookup_table: return None
        elif id     in self.locales:      return self.locales[id]
        else:
            file = self.file
            start = file.tell()
            locale = Locale(id = id) 
            self.locales[id] = locale #Prevents infinite recursions. Need to update this later.
            _,__,offset,size = self.lookup_table[id]
            file.seek(self.data_start + offset)
            locale.__dict__.update(Locale.parse(file, self, id).__dict__)
            self.r_locales[locale] = id
            self.name_to_id_dict[locale.file_name.lower()] = id
            self.name_to_locale_dict[locale.file_name.lower()] = locale
            file.seek(start)
            return locale
    def parse_all_locales(self) -> None:
        for id in self.lookup_table: self.get_locale(id)
    def get_locale_by_name(self, file_name: str, return_id = False) -> Locale | int | None:
        name = file_name.replace('.rfc','').lower()
        self.parse_all_locales()
        return self.name_to_id_dict.get(name,0) if return_id else self.name_to_locale_dict.get(name)
    def create_locale(self, file_name: str, return_id: bool = False) -> int | Locale:
        found_locale = self.get_locale_by_name(file_name = file_name)
        if found_locale: return found_locale if not return_id else self.r_locales[found_locale]
        new_id = max(self.lookup_table.keys()) + 1
        new_locale = Locale(id = new_id, file_name = file_name, parent = self.get_locale(1))
        self.lookup_table[new_id] = (new_id,0,0x2c,0)
        self.locales[new_id] = new_locale
        self.r_locales[new_locale] = new_id
        self.name_to_id_dict[file_name] = new_id
        return new_id if return_id else new_locale
    def write(self) -> bytes:
        lt_d = b'' #lookup table data
        b_d  = b'' #body data
        locales = [self.get_locale(id) for id in self.lookup_table.keys()]
        #It's important to keep the context the same.
        for locale in sorted(locales, key = lambda locale: locale.id):
            locale_data = locale.write(self)
            lt_d += write_uints((locale.id,0,len(b_d),len(locale_data)))
            b_d += locale_data
        lt_d += write_uints((0,0,0,0))
        lt_d = write_uint(len(lt_d)) + lt_d
        print(f'Wrote {hex(len(locales))} locales to database {hex(self.version)}')
        return write_uint(self.version) + lt_d + b_d
    def write_file(self, out_dir: str) -> None:
        file = open(os.path.join(out_dir,'locales.rdb'), 'wb')
        file.write(self.write())
        file.close()