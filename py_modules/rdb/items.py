from __future__ import annotations

from dataclasses import dataclass,field,fields,replace
from _io import BufferedReader

from typing import ClassVar,Any

from ..parsing_funcs import *
from ..writing_funcs import *
from .. import subnodes as sn
from .. import b_funcs as bf

import bpy

def get_db_entry(file: BufferedReader, db_dict: dict[int,ItemDB], method_name: str = 'get_item', entry_id: int = 0x0) -> str | Item | None:
    if not entry_id: return None if method_name == 'get_item' else ''
    if not db_dict: raise Exception(f'Was provided an empty database dict! Please ensure there is at least the universal itemdb in this dict.')
    cursor_pos = file.tell()
    if entry_id and (db := db_dict.get(entry_id & 0xFF000000)):
        entry = getattr(db,method_name)(entry_id,db_dict) #Get the method then call it
        file.seek(cursor_pos) #Jump back to where the item was referenced.
        return entry
    else: 
        # raise Exception(f'Failed to find entry {hex(entry_id)} in {db_dict}') #print(f'Failed to find entry {hex(entry_id)} in {db_dict}')# 
        return None if method_name == 'get_item' else ''

def copy_item_if_should_be_unique(item: Item) -> bool:
    '''
    Used for ensuring that the item instance passed in should be cloned to prevent things like quantum entanglement in containers and so on.
    True = Should be unique.
    '''
    copy = False
    if   item.door and item.door.key: copy = True
    elif item.container:              copy = True
    elif item.weapon:                 copy = True
    elif item.apparel:                copy = True
    else: copy = False
    return item if not copy else item.copy()

@dataclass
class Thing:
    owner: Item | None = None
    name: str = ''
    singular_published: int = 0
    version: int = 0
    unused0: int = 0
    unused1: int = 0
    parent_id: int = 0
    parent: Item | None = None
    def __init__(self, file: BufferedReader, db_dict: dict[int,ItemDB]) -> None:
        self.name = read_name(file)
        self.singular_published,self.version,self.unused0,self.unused1 = read_ubytes(file,4)
        self.parent_id = read_uints(file,1)
        #
        self.parent = get_db_entry(file, db_dict, 'get_item', self.parent_id)
    def get_size(self) -> int:
        return 0x20
    def to_obj(self, rfp, obj: bpy.types.Object) -> None:
        obj.name = self.name
        t = obj.x_item.thing
        t.bool = True
        t.name = self.name
        t.singular_published,t.version,t.unused0,t.unused1 = self.singular_published,self.version,self.unused0,self.unused1
        t.parent_id = self.parent_id
        if self.parent: t.parent = self.parent.to_objs(rfp)[0]
    def write(self, as_orphan: bool = False) -> bytes:
        thingdata = write_name(self.name)
        # if   not self.singular and     self.published: thingdata += write_ubyte(0)
        # elif     self.singular and     self.published: thingdata += write_ubyte(1)
        # elif not self.singular and not self.published: thingdata += write_ubyte(2)
        # elif     self.singular and not self.published: thingdata += write_ubyte(3)
        thingdata += write_ubytes([self.singular_published,self.version,self.unused0,self.unused1])
        thingdata += write_uint(self.parent_id if not as_orphan else 0x0)
        #Add writing the parent as an option.
        return write_uints([0x10000000, len(thingdata) + 8]) + thingdata

@dataclass
class Object:
    owner: Item | None = None
    model_name:  str = ''
    exp:         int = 0
    zoom_smooth: int = 0
    unused0:     int = 0
    unused1:     int = 0
    name_id:     int = 0  #0x80000000 means to inherit the parent's string
    name:        str = '' #If no name entry, you cannot inspect the item.
    desc_id:     int = 0
    desc:        str = '' 
    size:        int = 0
    rarity:      int = 0
    value:       int = 0
    provenance:  int = 0
    purpose:     int = 0
    def __init__(self, file: BufferedReader, db_dict: dict[int,ItemDB]) -> None:
        self.model_name = read_name(file)
        self.exp,self.zoom_smooth,self.unused0,self.unused1 = read_ubytes(file,4)
        #
        self.name_id,self.desc_id = read_uints(file,2)
        self.name = get_db_entry(file, db_dict, 'get_string', self.name_id)
        self.desc = get_db_entry(file, db_dict, 'get_string', self.desc_id)
        #
        self.size,self.rarity = read_ubytes(file,2)
        self.value = read_ushorts(file,1)
        self.provenance,self.purpose = read_uints(file,2)
    def get_size(self) -> int:
        return 0x30
    def to_obj(self, obj: bpy.types.Object) -> None:
        o = obj.x_item.object
        o.bool = True
        o.model_name = self.model_name
        o.exp,o.zoom_smooth,o.unused0,o.unused1 = self.exp,self.zoom_smooth,self.unused0,self.unused1
        o.name = self.name
        o.desc = self.desc
        o.size,o.rarity = self.size,self.rarity
        o.value = self.value
        o.provenance,o.purpose = self.provenance,self.purpose
    def write(self, owner_db: ItemDB, ldb_sig: int = 0x80000000) -> bytes:
        # print(self)
        object_data = write_name(self.model_name) + write_ubyte(self.exp)
        object_data += write_ubytes([self.zoom_smooth,self.unused0,self.unused1])
        object_data += owner_db.write_string(string = self.name)
        object_data += owner_db.write_string(string = self.desc)
        object_data += write_ubytes([self.size,self.rarity]) + write_ushort(self.value) + write_uints([self.provenance,self.purpose])
        return write_uints([0x100000,len(object_data) + 8]) + object_data

@dataclass
class Socket:
    type: int = 0
    usage: int = 0
    def __init__(self, file: BufferedReader) -> None:
        self.type,self.usage = read_ubytes(file,2)
    def to_inst(self, inst) -> None:
        inst.type,inst.usage = self.type,self.usage
    def write(self) -> bytes:
        return write_ubytes((self.type,self.usage))

@dataclass
class SWeapon:
    owner: Item | None = None
    material_seed: int = 0
    quality: int = 0
    wear:    int = 0
    dirt:    int = 0
    variance: int = 0
    unused_stats: bytes = field(default_factory = bytes)
    rank_points: int = 0
    sound:       int = 0
    ability:     int = 0
    sockets: list[Socket] = field(default_factory = list)
    def __init__(self, file: BufferedReader) -> None:
        self.material_seed = read_uints(file,1)
        self.quality,self.wear,self.dirt,self.variance = read_ubytes(file,4)
        self.unused_stats = file.read(22)
        self.rank_points,self.sound = read_ubytes(file,2)
        self.ability = read_uints(file,1)
        self.sockets = [Socket(file) for _ in range(4)]
    def get_size(self) -> int:
        return 44
    def to_obj(self, obj: bpy.types.Object) -> None:
        w = obj.x_item.sweapon
        w.bool = True
        w.material_seed = hex(self.material_seed)
        w.quality,w.wear,w.dirt,w.variance = self.quality,self.wear,self.dirt,self.variance
        w.unused_stats = self.unused_stats.hex()
        w.rank_points,w.sound = self.rank_points,self.sound
        w.ability = self.ability
        b_sockets = w.sockets
        b_sockets.clear()
        for x_socket in self.sockets:
            b_socket = b_sockets.add()
            x_socket.to_inst(b_socket)
    def write(self) -> bytes:
        weapon_data = write_uint(self.material_seed) + write_ubytes([self.quality,self.wear,self.dirt,self.variance])
        #Initially, the unused stats are an empty string. They'd only have a value if the property group had data.
        if self.unused_stats: weapon_data += self.unused_stats
        else:                 weapon_data += write_ubytes(ints = [0]*22)
        weapon_data += write_ubytes([self.rank_points,self.sound]) + write_uint(self.weapon_ability)
        for socket in self.sockets:            weapon_data += socket.write()
        for i in range(4 - len(self.sockets)): weapon_data += write_ushort(0) #Ensuring there's 4 entries.
        assert len(weapon_data) + 8 == 0x2c, f'Wrote an invalid static weapon! Its length is {hex(len(weapon_data) + 8)} instead of 0x68!'
        return write_uints([0x4000,len(weapon_data) + 8]) + weapon_data

@dataclass
class WeaponMat:
    material: int = 0
    unused0:  int = 0
    unused1:  int = 0
    luster:   int = 0
    color:    int = 0
    unused2:  int = 0
    unused3:  int = 0
    theme:    int = 0
    def __init__(self, file: BufferedReader) -> None:
        self.material,self.unused0,self.unused1,self.luster,self.color,self.unused2,self.unused3,self.theme = read_ubytes(file,8)
    def to_inst(self, inst) -> None:
        inst.material,inst.unused0,inst.unused1,inst.luster,inst.color,inst.unused2,inst.unused3,inst.theme = self.material,self.unused0,self.unused1,self.luster,self.color,self.unused2,self.unused3,self.theme
    def write(self) -> bytes:
        return write_ubytes((self.material,self.unused0,self.unused1,self.luster,self.color,self.unused2,self.unused3,self.theme))

@dataclass
class PWeapon:
    owner: Item | None = None
    grip_type:      int = 0
    sword_flags:    int = 0 
    haft_materials: int = 0
    weapon_flags:   int = 0
    factory_seed:   int = 0
    material_seed:  int = 0
    quality:        int = 0
    wear:           int = 0
    dirt:           int = 0
    variance:       int = 0
    materials:      list[WeaponMat] = field(default_factory = list)
    weight:         int = 0
    balance:        int = 0
    impact:         int = 0
    thrust:         int = 0
    eff_near:       int = 0
    eff_mid:        int = 0
    eff_end:        int = 0
    slash:          int = 0
    crush:          int = 0
    pierce:         int = 0
    flip:           int = 0
    f_eff_near:     int = 0
    f_eff_far:      int = 0
    f_slash:        int = 0
    f_crush:        int = 0
    f_pierce:       int = 0
    grade:          int = 0 
    sounds:         int = 0
    rank_points:    int = 0
    statunk7:       int = 0
    sockets:        list[Socket] = field(default_factory = list)
    components:     list[int] = field(default_factory = list)
    def __init__(self, file: BufferedReader) -> None:
        self.grip_type,self.sword_flags,self.haft_materials,self.weapon_flags = read_ubytes(file,4)
        self.factory_seed                                                     = read_uints(file,1)
        self.material_seed                                                    = read_uints(file,1)
        self.quality,self.wear,self.dirt,self.variance                        = read_ubytes(file,4)
        #
        self.materials = [WeaponMat(file) for _ in range(4)]
        #
        self.weight,self.balance,self.impact,self.thrust                      = read_ubytes(file,4)
        self.eff_near,self.eff_mid,self.eff_end,self.slash                    = read_ubytes(file,4)
        self.crush,self.pierce,self.flip,self.f_eff_near                      = read_ubytes(file,4)
        self.f_eff_far,self.flip_slash,self.flip_crush,self.flip_pierce       = read_ubytes(file,4)
        self.grade,self.sound,self.rank_points,self.statunk7                  = read_ubytes(file,4)
        self.ability                                                          = read_uints(file,1)
        #
        self.sockets = [Socket(file) for _ in range(4)]
        #
        self.components = read_ubytes(file,16)
    def get_size(self) -> int:
        return 0x68
    def to_obj(self, obj: bpy.types.Object) -> None:
        w = obj.x_item.pweapon
        w.bool = True
        w.grip_type,w.sword_flags,w.haft_materials,w.weapon_flags = self.grip_type,self.sword_flags,self.haft_materials,self.weapon_flags
        w.factory_seed = hex(self.factory_seed)
        w.material_seed = hex(self.material_seed)
        w.quality,w.wear,w.dirt,w.variance = self.quality,self.wear,self.dirt,self.variance

        b_mats = w.materials
        b_mats.clear()
        for x_mat in self.materials:
            b_mat = b_mats.add()
            x_mat.to_inst(b_mat)

        w.weight,w.balance,w.impact,w.thrust = self.weight,self.balance,self.impact,self.thrust
        w.eff_near,w.eff_mid,w.eff_end,w.slash = self.eff_near,self.eff_mid,self.eff_end,self.slash
        w.crush,w.pierce,w.flip,w.f_eff_near = self.crush,self.pierce,self.flip,self.f_eff_near
        w.f_eff_far,w.flip_slash,w.flip_crush,w.flip_pierce = self.f_eff_far,self.flip_slash,self.flip_crush,self.flip_pierce
        w.grade,w.sound,w.rank_points,w.statunk7 = self.grade,self.sound,self.rank_points,self.statunk7
        w.ability = self.ability

        b_sockets = w.sockets
        b_sockets.clear()
        for x_socket in self.sockets:
            b_socket = b_sockets.add()
            x_socket.to_inst(b_socket)

        w.components = self.components
    def write(self) -> bytes:
        wep_data  = write_ubytes([self.grip_type,self.sword_flags,self.haft_materials,self.weapon_flags])
        wep_data += write_uints([self.factory_seed,self.material_seed])
        wep_data += write_ubytes([self.quality,self.wear,self.dirt,self.variance])
        for wm in self.materials:              wep_data += wm.write()
        for _ in range(4-len(self.materials)): wep_data += pack('<Q',0)
        wep_data += write_ubytes([self.weight,self.balance,self.impact,self.thrust,self.eff_near,self.eff_mid,self.eff_end,
                                  self.slash,self.crush,self.pierce,self.flip,self.f_eff_near,self.f_eff_far,
                                  self.flip_slash,self.flip_crush,self.flip_pierce,
                                  self.grade,self.sound,self.rank_points,self.statunk7])
        wep_data += write_uint(self.ability)
        for socket in self.sockets:          wep_data += socket.write()
        for _ in range(4-len(self.sockets)): wep_data += write_ushort(0)
        wep_data += write_ubytes(self.components)
        assert len(wep_data) + 8 == 0x68, f'Wrote an invalid Proc Weapon! Its length is {hex(len(wep_data) + 8)} instead of 0x68!: \n{wep_data.hex().upper()}'
        return write_uints([0x4000,len(wep_data) + 8]) + wep_data

def parse_weapon(file: BufferedReader, length: int = 44) -> SWeapon | PWeapon:
    if length == 4: return SWeapon(file)
    else:           return PWeapon(file)

@dataclass
class Shield:
    owner: Item | None = None
    unused00:     int = 0
    unused04:     int = 0
    unused08:     int = 0
    weapon_flags: int = 0
    weight:       int = 0
    impact:       int = 0
    encumbrance:  int = 0
    unused1C:     int = 0
    rank_points:  int = 0
    unused:       bytes = field(default_factory = bytes)
    def __init__(self, file: BufferedReader) -> None:
        self.unused00,self.unused04,self.unused08,self.weapon_flags = read_ubytes(file,4)
        self.weight,self.impact,self.encumbrance,self.unused1C = read_ubytes(file,4)
        self.rank_points = read_ubytes(file,1)
        self.unused = file.read(71)
    def get_size(self) -> int:
        return 0x58
    def to_obj(self, obj: bpy.types.Object) -> None:
        s = obj.x_item.shield
        s.bool = True
        s.unused00,s.unused04,s.unused08,s.weapon_flags = self.unused00,self.unused04,self.unused08,self.weapon_flags
        s.weight,s.impact,s.encumbrance,s.unused1C = self.weight,self.impact,self.encumbrance,self.unused1C
        s.rank_points = self.rank_points
        s.unused = self.unused.hex()
    def write(self) -> bytes:
        shield_data = write_ubytes([self.unused00,self.unused04,self.unused08,
                                    self.weapon_flags,self.weight,self.impact,
                                    self.encumbrance,self.unused1C,self.rank_points])
        if self.unused: shield_data += self.unused
        else:           shield_data += write_ubytes(ints = [0]*71)
        return write_uints([0x8000,len(shield_data) + 8]) + shield_data

@dataclass
class Torch: #Forces torch motions
    owner: Item | None = None
    data: bytes = field(default_factory = bytes)
    def __init__(self, file: BufferedReader) -> None:
        self.data = file.read(0x10)
    def get_size(self) -> int:
        return 0x18
    def to_obj(self, obj: bpy.types.Object) -> None:
        obj.x_item.torch.data = self.data.hex()
        obj.x_item.torch.bool = True
    def write(self) -> bytes:
        return write_uints([0x100,len(self.data) + 8]) + self.data


@dataclass
class ApparelMat:
    layer:    int = 0
    part:     int = 0
    element:  int = 0
    design:   int = 0
    material: int = 0
    unused0:  int = 0
    unused1:  int = 0
    trait:    int = 0
    color:    int = 0
    unused2:  int = 0
    unused3:  int = 0
    theme:    int = 0
    def __init__(self, file: BufferedReader) -> None:
        self.layer,self.part,self.element,self.design      = read_ubytes(file,4)
        self.material,self.unused0,self.unused1,self.trait = read_ubytes(file,4)
        self.color,self.unused2,self.unused3,self.theme    = read_ubytes(file,4)
    def to_inst(self, inst) -> None:
        inst.layer,inst.part,inst.element,inst.design = self.layer,self.part,self.element,self.design
        inst.material,inst.unused0,inst.unused1,inst.trait = self.material,self.unused0,self.unused1,self.trait
        inst.color,inst.unused2,inst.unused3,inst.theme = self.color,self.unused2,self.unused3,self.theme
    def write(self) -> bytes:
        return write_ubytes([self.layer,self.part,self.element,self.design,
                             self.material,self.unused0,self.unused1,self.trait,
                             self.color,self.unused2,self.unused3,self.theme])

@dataclass
class Apparel:
    owner: Item | None = None
    model:         str = field(default_factory = str)
    usage:         bytes = b'' #list[int] = field(default_factory = list)
    visibility:    bytes = b'' #list[int] = field(default_factory = list)
    coverage:      bytes = b'' #list[int] = field(default_factory = list)
    impact:        int = 0
    slash:         int = 0
    crush:         int = 0
    pierce:        int = 0
    av_coverage:      int = 0
    encumbrance:   int = 0
    sound:         int = 0
    bulk:          int = 0
    type:          int = 0
    grade:         int = 0
    trait:         int = 0
    rank_points:   int = 0
    material_seed: int = 0
    quality:       int = 0
    wear:          int = 0
    dirt:          int = 0
    variance:      int = 0
    materials:     list[ApparelMat] = field(default_factory = list)
    ability:       int = 0
    sockets:       list[Socket] = field(default_factory = list)
    set_uid:       int = 0
    def __init__(self, file: BufferedReader) -> None:
        self.model      = read_name(file)
        self.usage      = file.read(20*8) #read_ubytes(file,20*8)
        self.visibility = file.read(20*8) #read_ubytes(file,20*8)
        self.coverage   = file.read(20*4) #read_ubytes(file,20*4)
        self.impact,self.slash,self.crush,self.pierce            = read_ubytes(file,4)
        self.av_coverage,self.encumbrance,self.sound,self.bulk   = read_ubytes(file,4)
        self.app_type,self.app_class,self.trait,self.rank_points = read_ubytes(file,4)
        self.material_seed                                       = read_uints(file,1)
        self.quality,self.wear,self.dirt,self.variance           = read_ubytes(file,4)
        self.materials = [ApparelMat(file) for _ in range(8)]
        self.ability = read_uints(file,1)
        self.sockets = [Socket(file) for _ in range(4)]
        self.set_uid = read_uints(file,1)
    def get_size(self) -> int:
        return 0x22C
    def to_obj(self, obj: bpy.types.Object) -> None:
        a = obj.x_item.apparel
        a.bool = True
        a.model = self.model
        a.usage = self.usage.hex()
        a.visibility = self.visibility.hex()
        a.coverage = self.coverage.hex()
        a.impact,a.slash,a.crush,a.pierce = self.impact,self.slash,self.crush,self.pierce
        a.av_coverage,a.encumbrance,a.sound,a.bulk = self.av_coverage,self.encumbrance,self.sound,self.bulk
        a.app_type,a.app_class,a.trait,a.rank_points = self.app_type,self.app_class,self.trait,self.rank_points
        a.material_seed = hex(self.material_seed)
        a.quality,a.wear,a.dirt,a.variance = self.quality,self.wear,self.dirt,self.variance

        b_mats = a.materials
        b_mats.clear()
        for x_mat in self.materials:
            b_mat = b_mats.add()
            x_mat.to_inst(b_mat)

        a.ability = self.ability

        b_sockets = a.sockets
        b_sockets.clear()
        for x_socket in self.sockets:
            b_socket = b_sockets.add()
            x_socket.to_inst(b_socket)

        a.set_uid = self.set_uid
    def write(self) -> bytes:
        app_data = write_name(self.model)
        app_data += write_ubytes(self.usage) + write_ubytes(self.visibility) + write_ubytes(self.coverage)
        app_data += write_ubytes([self.impact,self.slash,self.crush,self.pierce,self.av_coverage,self.encumbrance,
                                    self.sound,self.bulk,self.app_type,self.app_class,self.trait,self.rank_points])
        app_data += write_uint(self.material_seed)
        app_data += write_ubytes([self.quality,self.wear,self.dirt,self.variance])
        for mat in self.materials:               app_data += mat.write()
        for _ in range(8 - len(self.materials)): app_data += write_ubytes([0]*12)
        app_data += write_uint(self.ability)
        for socket in self.sockets:          app_data += socket.write()
        for _ in range(4-len(self.sockets)): app_data += write_ushort(0)
        app_data += write_uint(self.set_uid)
        assert len(app_data) + 8 == 0x22c, f'Wrote an invalid apparel chunk! Its length is {len(app_data) + 8} instead of 0x22c.'
        return write_uints([0x1000,len(app_data) + 8]) + app_data

@dataclass
class StoredItem:
    item_id: int = 0 #Fallback incase there isnt an item. ie, when there's a universal item without a provided universal DB
    item:    Item | None = field(default_factory = None)
    null:    int = 0
    pos_x:   int = 0
    pos_y:   int = 0
    def __init__(self, file: BufferedReader, db_dict: dict[int,ItemDB]) -> None:
        self.item_id          = read_uints(file,1)
        self.item             = get_db_entry(file, db_dict, 'get_item', self.item_id)
        self.null             = read_uints(file,1)
        self.pos_x,self.pos_y = read_sshorts(file,2)
    def to_inst(self, rfp, inst) -> None:
        # inst.item_id = self.item_id
        if self.item: inst.item = self.item.to_objs(rfp)[0]
        inst.pos_x,inst.pos_y = self.pos_x,self.pos_y
    def write(self, owner_db: ItemDB, udb: ItemDB, as_local: bool = False) -> bytes:
        if self.item and (self.item.owner_db != udb or as_local): d = self.item.write(owner_db = owner_db, udb = udb)
        else:                                                     d = write_uint(self.item_id)
        return d + write_uint(self.null) + write_sshorts((self.pos_x,self.pos_y))

@dataclass
class Container:
    owner: Item | None = None
    width:    int = 0
    height:   int = 0
    key_id:   int = 0
    key:      Item | None = field(default_factory = None)
    capacity: int = 0
    max_size: int = 0
    unk1:     int = 0
    unk2:     int = 0
    items:    list[StoredItem] = field(default_factory = list)
    def __init__(self, file: BufferedReader, db_dict: dict[int,ItemDB]) -> None:
        self.width,self.height      = read_ushorts(file,2)
        self.key_id                 = read_uints(file,1)
        self.key = get_db_entry(file, db_dict, 'get_item', self.key_id)
        self.capacity,self.max_size = read_ushorts(file,2)
        self.unk1,self.unk2         = read_uints(file,2)
        self.items = [StoredItem(file, db_dict) for _ in range(read_uints(file,1))]
    def get_size(self) -> int:
        return 0x1C + (4 + (12 * len(self.items)))
    def to_obj(self, rfp, obj: bpy.types.Object) -> None:
        c = obj.x_item.container
        c.bool = True
        c.width,c.height = self.width,self.height
        # c.key_id = self.key_id
        if self.key: c.key = self.key.to_objs(rfp)[0]
        c.capacity,c.max_size = self.capacity,self.max_size
        c.unk1,c.unk2 = self.unk1,self.unk2

        b_items = c.items
        b_items.clear()
        for x_item in self.items:
            b_item = b_items.add()
            x_item.to_inst(rfp, b_item)
    def write(self, owner_db: ItemDB, udb: ItemDB, as_local: bool = False) -> bytes:
        d = write_ushorts((self.width,self.height))
        if key := self.key: d += key.write(owner_db = owner_db, udb = udb, as_local = as_local)
        else:               d += write_uint(self.key_id)
        d += write_ushorts((self.capacity,self.max_size))
        d += write_uints((self.unk1,self.unk2))
        
        contained_items,c_d = 0,b'' #There could be stuff without items in it.
        for s_item in self.items: 
            if s_item.item or (s_item.item_id and as_local):
                contained_items += 1
                c_d += s_item.write(owner_db, udb, as_local)
        d += write_uint(contained_items) + c_d

        return write_uints([0x20000,len(d) + 8]) + d

@dataclass
class DTItem:
    owner: Item | None = None
    item_id:  int = 0
    item:     Item | None = field(default_factory = None)
    chance:   int = 0
    rarity:   int = 0
    min:      int = 0
    max:      int = 0
    flag:     int = 0
    amount:   int = 0
    wear_var: int = 0
    dirt_var: int = 0
    unk1:     int = 0
    unk2:     int = 0
    unk3:     int = 0
    unk4:     int = 0
    def __init__(self, file: BufferedReader, db_dict: dict[int,ItemDB]) -> None:
        self.item_id                                      = read_uints(file,1)
        self.item = get_db_entry(file, db_dict, 'get_item', self.item_id)
        self.chance,self.rarity,self.min,self.max         = read_ubytes(file,4)
        self.flag,self.amount,self.wear_var,self.dirt_var = read_ubytes(file,4)
        self.unk1,self.unk2,self.unk3,self.unk4           = read_ubytes(file,4)
    def to_inst(self, rfp, inst) -> None:
        # inst.item_id = self.item_id
        if self.item: inst.item = self.item.to_objs(rfp)[0]
        inst.chance,inst.rarity,inst.min,inst.max = self.chance,self.rarity,self.min,self.max
        inst.flag,inst.amount,inst.wear_var,inst.dirt_var = self.flag,self.amount,self.wear_var,self.dirt_var
        inst.unk1,inst.unk2,inst.unk3,inst.unk4 = self.unk1,self.unk2,self.unk3,self.unk4
    def write(self, owner_db: ItemDB, udb: ItemDB, as_local: bool = False) -> bytes:
        if self.item: d = self.item.write(owner_db = owner_db, udb = udb, as_local = as_local)
        else:         d = write_uint(self.item_id)
        d += write_ubytes((self.chance,self.rarity,self.min,self.max,
                           self.flag,self.amount,self.wear_var,self.dirt_var,
                           self.unk1,self.unk2,self.unk3,self.unk4))
        return d

@dataclass
class Droptable:
    owner: Item | None = None
    unk1:      int = 0
    specitem1: int = 0 #Special item index in the droptable?
    specitem2: int = 0
    unk2:      int = 0
    unk3:      int = 0
    items:     list[DTItem] = field(default_factory = list)
    def __init__(self, file: BufferedReader, db_dict: dict[int,ItemDB]) -> None:
        self.unk1                     = read_uints(file,1)
        self.specitem1,self.specitem2 = read_ubytes(file,2)
        self.unk2                     = read_ushorts(file,1)
        self.unk3                     = read_uints(file,1)
        self.items = [DTItem(file, db_dict) for _ in range(read_uints(file,1))]
    def get_size(self) -> int:
        return 0x14 + (4 + (0x10 * len(self.items)))
    def to_obj(self, rfp, obj: bpy.types.Object) -> None:
        dt = obj.x_item.droptable
        dt.bool = True
        dt.unk1 = self.unk1
        dt.specitem1,dt.specitem2 = self.specitem1,self.specitem2
        dt.unk2 = self.unk2
        dt.unk3 = self.unk3

        b_dtitems = dt.items
        b_dtitems.clear()
        for x_dtitem in self.items:
            b_dtitem = b_dtitems.add()
            x_dtitem.to_inst(rfp, b_dtitem)
    def write(self, owner_db: ItemDB, udb: ItemDB, as_local: bool) -> bytes:
        d  = write_uint(self.unk1) + write_ubytes([self.specitem1,self.specitem2]) + write_ushort(self.unk2) + write_uint(self.unk3)
        if len(self.items) < 2: raise Exception(f'Droptables require at least two items defined to work! There are currnetly {hex(len(self.items))}')
        d += write_uint(len(self.items))
        for dt_item in self.items: d += dt_item.write(owner_db = owner_db, udb = udb, as_local = as_local)
        return write_uints([0x200,len(d) + 8]) + d

@dataclass
class Map:
    owner: Item | None = None
    unk1: int = 0
    unk2: int = 0
    unk3: int = 0
    unk4: int = 0
    name: str = field(default_factory = str)
    def __init__(self, file: BufferedReader) -> None:
        self.unk1,self.unk2,self.unk3,self.unk4 = read_uints(file,4)
        self.name                               = read_name(file)
    def get_size(self) -> int:
        return 0x28
    def to_obj(self, obj: bpy.types.Object) -> None:
        m = obj.x_item.map
        m.bool = True
        m.unk1,m.unk2,m.unk3,m.unk4 = self.unk1,self.unk2,self.unk3,self.unk4
        m.name = self.name
    def write(self) -> bytes:
        mapdata = write_uints([self.unk1,self.unk2,self.unk3,self.unk4]) + write_name(self.name)
        return write_uints([0x80000B03,len(mapdata) + 8]) + mapdata

zone_function_dict = {
    0:  "None",
    2:  "Golem Alarm",
    16: "Run Script",
    32: "Locale Exit",
    33: "Teleport",
    64: "Locale Entrance" #Locale Exit -> Entrance. The destination.
}
zone_trigger_dict = {
    0 : "None",
    16: "Player",
    17: "Character",
    18: "Narrator"
}

@dataclass
class Zone:
    owner: Item | None = None
    size_x:    int = 0
    size_y:    int = 0
    size_z:    int = 0
    unk1:      int = 0
    function:  int = 0
    trigger:   int = 0
    unk2:      int = 0
    unk3:      int = 0
    unk4:      int = 0
    target_id: int = 0 #Could be a locale or game event or something
    code:      str = ''
    def __init__(self, file: BufferedReader) -> None:
        self.size_x,self.size_z,self.size_y,self.unk1 = read_ushorts(file,4)
        self.function                                 = read_ubytes(file,1) #zone_function_dict.get(read_ubytes(file,1),'Unk')
        self.trigger                                  = read_ubytes(file,1) #zone_trigger_dict.get(read_ubytes(file,1),'Unk')
        self.unk2,self.unk3                           = read_ubytes(file,2)
        self.unk4,self.target_id                      = read_uints(file,2)
        self.code                                     = read_string(file)
    def get_size(self) -> int:
        return 0x1C + (4 + len(self.code))
    def to_obj(self, obj: bpy.types.Object) -> None:
        z = obj.x_item.zone
        z.bool = True
        z.size_x,z.size_z,z.size_y,z.unk1 = self.size_x,self.size_z,self.size_y,self.unk1
        z.function = self.function
        z.trigger = self.trigger
        z.unk2,z.unk3 = self.unk2,self.unk3
        z.unk4,z.target_id = self.unk4,self.target_id
        z.code = self.code
    def write(self) -> bytes:
        zone_data  = write_ushorts((self.size_x,self.size_z,self.size_y,self.unk1))
        zone_data += write_ubytes((self.function,self.trigger))
        zone_data += write_ubytes((self.unk2,self.unk3))
        zone_data += write_uints([self.unk4,self.target_id])
        zone_data += write_string(self.code)
        return write_uints([0x8000AC07,len(zone_data)+8]) + zone_data

op_type_dict = {
    0: 'Misc',      
    1: 'Cursor',
    2: 'Special',   
    3: 'Lever',
    4: 'Button',    
    5: 'Effect',
    6: 'Mechanism',
    7: 'Brazier',
    8: 'Event'
}

op_cursor_dict = {
    0:  'Unlock',
    1:  'Healing',
    10: 'Damage Resistance',
    11: 'Clean',
    12: 'Repair'
}

op_effect_dict = {
    5: 'Fire'
}

op_mech_dict = {
    0: 'One Target',
    1: 'Target Reference', #Items that use it as a key..?
    2: 'Two Targets',
    3: 'Unknown 3',
    4: 'Unknown 4',
    5: 'Pass or Fail' #The Button puzzle in level 1
}

op_button_dict = {
    4: 'Push Value'
}

@dataclass
class Operator:
    #Generic.
    owner: Item | None = None
    version: int = 0x8
    type: int = 0
    flag: int = 0
    val1: int = 0
    val2: int = 0
    val3: int = 0
    val4: int = 0
    val5: int = 0
    val6: int = 0
    target_1_id: int = 0
    target_1:    Item | None = None
    target_2_id: int = 0
    target_2:    Item | None = None
    target_ids: list[int] = field(default_factory = lambda: [0]*8)
    targets:    list[Item | None] = field(default_factory = lambda: [None]*8)
    sound:       str = ''
    code:        str = ''
    def __init__(self, file: BufferedReader, db_dict: dict[int,ItemDB], version: int = 0x9) -> None:
        self.version = version
        self.type,self.flag                                         = read_ubytes(file,2)
        self.val1,self.val2,self.val3,self.val4,self.val5,self.val6 = read_ubytes(file,6)
        if self.version != 0x9:
            self.target_1_id                                            = read_uints(file,1)
            self.target_1 = get_db_entry(file, db_dict, 'get_item', self.target_1_id)
            self.target_2_id                                            = read_uints(file,1)
            self.target_2 = get_db_entry(file, db_dict, 'get_item', self.target_2_id)
            self.target_ids = [self.target_1_id,self.target_2_id,0,0,0,0,0,0]
            self.targets = [self.target_1,self.target_2,None,None,None,None,None,None]
        else:
            self.target_ids = read_uints(file,8)
            self.targets = [get_db_entry(file, db_dict, 'get_item', id) for id in self.target_ids]
            self.target_1_id,self.target_2_id = self.target_ids[:2]
            self.target_1,self.target_2 = self.targets[:2]
        self.sound                                                  = read_name(file)
        self.code = read_string(file) if version == 9 else ''
    def get_size(self) -> int:
        if self.version == 0x9: return 0x44 + len(self.code)
        else: return 0x28
    def to_obj(self, rfp, obj: bpy.types.Object) -> None:
        op = obj.x_item.operator
        op.bool = True
        op.version = self.version
        op.type,op.flag = self.type,self.flag
        op.val1,op.val2,op.val3,op.val4,op.val5,op.val6 = self.val1,self.val2,self.val3,self.val4,self.val5,self.val6

        targets = op.targets #Hardcode 8 targets for v9+
        targets.clear()
        for _ in range(8): targets.add()
        if self.version != 0x9:
            # op.target_1_id = self.target_1_id
            if self.target_1: op.target_1 = self.target_1.to_objs(rfp)[0]
            # op.target_2_id = self.target_2_id
            if self.target_2: op.target_2 = self.target_2.to_objs(rfp)[0]
            # op.target_ids[0],op.target_ids[1] = self.target_1_id,self.target_2_id
            targets[0],targets[1] = op.target_1,op.target_2
        else:
            # op.target_ids = self.target_ids
            for b_target,x_target in zip(targets,self.targets):
                if x_target: b_target.object = x_target.to_objs(rfp)[0]

    def write(self, owner_db: ItemDB, udb: ItemDB) -> bytes:
        d = write_ubytes((self.type,self.flag,
                          self.val1,self.val2,self.val3,self.val4,self.val5,self.val6))
        if self.version != owner_db.idb_version:
            if owner_db.idb_version == 0x8 and self.version == 0x9:
                print(f'Writing v9 operator as v8')
                if t_1 := self.target_1: d += t_1.write(owner_db = owner_db, udb = udb)
                else:                    d += write_uint(self.target_1_id)
                if t_2 := self.target_2: d += t_2.write(owner_db = owner_db, udb = udb)
                else:                    d += write_uint(self.target_2_id)
            elif owner_db.idb_version == 0x9 and self.version == 0x8:
                print(f'Writing v8 operator as v9')
                for id,item in zip(self.target_ids,self.targets):
                    if item: d += item.write(owner_db = owner_db, udb = udb)
                    else:    d += write_uint(id)
        else:
            if self.version != 0x9:
                if t_1 := self.target_1: d += t_1.write(owner_db = owner_db, udb = udb)
                else:                    d += write_uint(self.target_1_id)
                if t_2 := self.target_2: d += t_2.write(owner_db = owner_db, udb = udb)
                else:                    d += write_uint(self.target_2_id)
            else:
                for id,item in zip(self.target_ids,self.targets):
                    if item: d += item.write(owner_db = owner_db, udb = udb)
                    else:    d += write_uint(id)
        d += write_name(self.sound)
        if owner_db.idb_version == 9: d += write_string(self.code)
        return write_uints([0x10000,len(d) + 8]) + d

@dataclass
class Door:
    owner: Item | None = None
    unk1: int = 0
    unk2: int = 0
    unk3: int = 0
    lock_when_closed: bool = False 
    pop_open:         bool = False #Op input
    noninteractable:  bool = False
    full_open:        bool = False #Op inputs
    full_close:       bool = False
    invert_input:     bool = False
    key_id: int = 0
    key:    Item | None = field(default_factory = None)
    unk4:   int = 0
    unk5:   int = 0
    unk6:   int = 0
    def __init__(self, file: BufferedReader, db_dict: dict[int,ItemDB]) -> None:
        flag,self.unk1,self.unk2,self.unk3 = read_ubytes(file,4)
        #Missing a couple bitflags here.
        self.lock_when_closed = bool(flag & 0b00000010)
        self.pop_open         = bool(flag & 0b00000100)
        self.noninteractable  = bool(flag & 0b00001000)
        self.full_open        = bool(flag & 0b00010000)
        self.full_close       = bool(flag & 0b01000000)
        self.invert_input     = bool(flag & 0b10000000)
        self.key_id           = read_uints(file,1)
        self.key = get_db_entry(file, db_dict, 'get_item', self.key_id)
        self.unk4,self.unk5,self.unk6 = read_uints(file,3)
    def get_size(self) -> int:
        return 0x1C
    def to_obj(self, rfp, obj: bpy.types.Object) -> None:
        d = obj.x_item.door
        d.bool = True
        d.unk1,d.unk2,d.unk3 = self.unk1,self.unk2,self.unk3
        d.lock_when_closed = self.lock_when_closed 
        d.pop_open         = self.pop_open         
        d.noninteractable  = self.noninteractable  
        d.full_open        = self.full_open
        d.full_close       = self.full_close
        d.invert_input     = self.invert_input
        # d.key_id           = self.key_id
        if self.key: d.key = self.key.to_objs(rfp)[0]
        d.unk4,d.unk5,d.unk6 = self.unk4,self.unk5,self.unk6
    def write(self, owner_db: ItemDB, udb: ItemDB) -> bytes:
        flag = 0
        if self.lock_when_closed: flag |= 0b00000010
        if self.pop_open:         flag |= 0b00000100
        if self.noninteractable:  flag |= 0b00001000
        if self.full_open:        flag |= 0b00010000
        if self.full_close:       flag |= 0b01000000
        if self.invert_input:     flag |= 0b10000000
        d = write_ubytes([flag,self.unk1,self.unk2,self.unk3])
        if key := self.key: d += key.write(owner_db = owner_db, udb = udb)
        else:               d += write_uint(self.key_id)
        d += write_uints([self.unk4,self.unk5,self.unk6])
        return write_uints([0x40000,len(d)+8]) + d

i_class_type_dict = {
    'thing'    : Thing,
    'object'   : Object,
    'weapon'   : PWeapon,
    'shield'   : Shield,
    'torch'    : Torch,
    'apparel'  : Apparel,
    'container': Container,
    'droptable': Droptable,
    'map'      : Map,
    'zone'     : Zone,
    'operator' : Operator,
    'door'     : Door  
} 

bitmask_class_dict = {
    'thing':     0x10000000,
    'object':    0x100000,
    'weapon':    0x4000,
    'shield':    0x8000,
    'torch':     0x100,
    'apparel':   0x1000,
    'container': 0x20000,
    'droptable': 0x200,
    'map':       0x80000B03,
    'zone':      0x8000AC07,
    'operator':  0x10000,
    'door':      0x40000
}

@dataclass
class Item:
    created_items: ClassVar[int] = 0
    internal_id:   int = 0
    id:            int = 0
    owner_db:      ItemDB | None = None
    thing:     Thing              = None
    object:    Object             = None
    weapon:    SWeapon | PWeapon  = None
    shield:    Shield             = None
    torch:     Torch              = None
    apparel:   Apparel            = None
    container: Container          = None
    droptable: Droptable          = None
    map:       Map                = None
    zone:      Zone               = None
    operator:  Operator           = None
    door:      Door               = None
    @classmethod
    def parse(cls, file: BufferedReader, owner: ItemDB, id: int, length: int, chunks: int, db_dict: dict[int,ItemDB]) -> Item:
        start = file.tell()
        thing,object,weapon,shield,torch,apparel   = None,None,None,None,None,None
        container,droptable,map,zone,operator,door = None,None,None,None,None,None
        found_chunks = 0
        prev_chnk_sig,prev_chnk_start = 0,0
        while file.tell() - start < length:
            chnk_start = file.tell()
            chnk_sig,c_length = read_uints(file,2)
            if   chnk_sig == 0x10000000: thing     = Thing(file, db_dict)
            elif chnk_sig == 0x100000:   object    = Object(file, db_dict)
            elif chnk_sig == 0x4000:     weapon    = parse_weapon(file, c_length)
            elif chnk_sig == 0x8000:     shield    = Shield(file)
            elif chnk_sig == 0x100:      torch     = Torch(file)
            elif chnk_sig == 0x1000:     apparel   = Apparel(file)
            elif chnk_sig == 0x20000:    container = Container(file, db_dict)
            elif chnk_sig == 0x200:      droptable = Droptable(file, db_dict)
            elif chnk_sig == 0x80000B03: map       = Map(file)
            elif chnk_sig == 0x8000AC07: zone      = Zone(file)
            elif chnk_sig == 0x10000:    operator  = Operator(file, db_dict, owner.idb_version)
            elif chnk_sig == 0x40000:    door      = Door(file, db_dict)
            else: raise Exception(f'Found an unknown chunk {hex(chnk_sig)} @ {hex(chnk_start)}. Previous chunk was {hex(prev_chnk_sig)} @ {hex(prev_chnk_start)}')
            if file.tell() - chnk_start != c_length: raise Exception(f'Improperly read {hex(chnk_sig)} @ {hex(chnk_start)}. Read {hex(file.tell() - chnk_start)} bytes instead of {hex(c_length)}')
            prev_chnk_sig,prev_chnk_start = chnk_sig,chnk_start
            found_chunks |= chnk_sig
        # if found_chunks != chunks: 
        #     file.seek(start) #raise Exception
        #     print(f'Was unable to find the correct chunks for item ({hex(id)}). Was supposed to read ({hex(chunks)}), found ({hex(found_chunks)}) for {thing.name}.\n\tItem is ({hex(length)}) bytes long and start was @ {hex(start)} in {file.name}\n\tData is:\n\t\t{file.read(length).hex().upper()}')
        return Item(id = id,
                    owner_db = owner,
                    thing = thing, 
                    object = object, 
                    weapon = weapon, 
                    shield = shield, 
                    torch = torch, 
                    apparel = apparel, 
                    container = container, 
                    droptable = droptable, 
                    map = map, 
                    zone = zone, 
                    operator = operator, 
                    door = door)
    def __post_init__(self) -> None:
        self.internal_id = Item.created_items
        Item.created_items += 1
    def to_objs(self, rfp, col: bpy.types.Collection | None = None) -> bpy.types.Object:
        '''
        Creates the objects and links them to the provided collection.
        Will copy the objects if already in the collection if the collection is provided. 
        If no collection is provided, it will provide the original regardless of any pre-existing links.
        '''
        #Return the 0th instance first if it isnt in the collection... and then copy it if it's already in there
        if self in rfp.built_items:
            if col: 
                objs = rfp.built_items[self]
                if objs[0].name not in col.objects:
                    for obj in objs: col.objects.link(obj)
                    return objs
                copies = bf.copy_objects(objs, col)
                copies[0].x_item.instance_of = objs[0]
                return copies
            else: return rfp.built_items[self]
        if self.object and (model_name := self.object.model_name): 
            if model_name[0] == '@': objs = [bf.create_empty(name = self.thing.name, col = col)]
            else:                    objs = rfp.get_world_model(self.object.model_name, col)
        else: objs = [bf.create_empty(name = self.thing.name, col = col)]
        rfp.built_items[self] = objs #Important to prevent infinite recursions and lets us pose things in the 3d viewport
        obj = objs[0]
        if self.thing:     self.thing.to_obj(rfp, obj)
        if self.object:    self.object.to_obj(obj)
        if self.weapon:    self.weapon.to_obj(obj)
        if self.shield:    self.shield.to_obj(obj)
        if self.torch:     self.torch.to_obj(obj)
        if self.apparel:   self.apparel.to_obj(obj)
        if self.container: self.container.to_obj(rfp, obj)
        if self.droptable: self.droptable.to_obj(rfp, obj)
        if self.map:       self.map.to_obj(obj)
        if self.zone:      self.zone.to_obj(obj)
        if self.operator:  self.operator.to_obj(rfp, obj)
        if self.door:      self.door.to_obj(rfp, obj)
        return objs
    def copy(self) -> Item:
        # print(f'Copying item {self.thing.name}')
        return replace(self)
    def __hash__(self):
        return self.internal_id
    def __repr__(self):
        return f"Item(name={self.thing.name}, chunks={hex(self.get_chunks())}, parent_id={hex(self.thing.parent_id)}, db_name={self.owner_db.name})"
        #Only show the attributes that have a class; are truthy.
        # return f"{self.__class__.__qualname__}({', '.join([f'{f.name}={getattr(self, f.name)}' for f in fields(self) if getattr(self, f.name)])})"
    def get_size(self) -> int:
        size = 0
        for varname,cls in vars(self).items():
            if varname == 'internal_id': continue 
            if cls: size += cls.get_size()
        return size
    def get_chunks(self) -> None:
        flag = 0
        if self.thing:      flag |= 0x10000000
        if self.object:     flag |= 0x100000
        if self.torch:      flag |= 0x100
        if self.weapon:     flag |= 0x4000
        if self.shield:     flag |= 0x8000
        if self.apparel:    flag |= 0x1000
        if self.container:  flag |= 0x20000
        if self.droptable:  flag |= 0x200
        if self.map:        flag |= 0x80000B03
        if self.zone:       flag |= 0x8000AC07
        if self.operator:   flag |= 0x10000
        if self.door:       flag |= 0x40000
        return flag
    def create_child_of(self) -> Item:
        copy = self.copy
        copy.thing.parent = self
        return copy
    def write(self, owner_db: ItemDB, udb: ItemDB, return_id: bool = False, as_local: bool = False) -> bytes | int:
        
        # if self.torch: return write_uint(0) if not return_id else 0
        if self.owner_db == udb and not as_local: return write_uint(self.id) if not return_id else self.id 
        if self in owner_db.r_items: return write_uint(owner_db.r_items[self])  if not return_id else owner_db.r_items[self]
        owner_db.r_items[self] = len(owner_db.r_items) + 1 | owner_db.signature
        
        # print(f'writing item {self} as {hex(owner_db.r_items[self])} with chunks {hex(self.get_chunks())}')
        d = b''
        # print(f'Writing item {self}, from {self.owner_db.name}')
        if self.thing:      d += self.thing.write(as_orphan = as_local)
        if self.object:     d += self.object.write(owner_db, udb)
        if self.torch:      d += self.torch.write()
        if self.weapon:     d += self.weapon.write()
        if self.shield:     d += self.shield.write()
        if self.apparel:    d += self.apparel.write()
        if self.container:  d += self.container.write(owner_db, udb)
        if self.droptable:  d += self.droptable.write(owner_db, udb)
        if self.map:        d += self.map.write()
        if self.zone:       d += self.zone.write()
        if self.operator:   d += self.operator.write(owner_db, udb)
        if self.door:       d += self.door.write(owner_db, udb)
        owner_db.w_items[self] = d
        return write_uint(owner_db.r_items[self]) if not return_id else ldb.r_items[self]

@dataclass
class PlacedItem:
    item_id:  int    = 0 #Fallback for universal stuff or if it can't find an item.
    item: Item | None = field(default_factory = None)
    flag_1:   int    = 0
    flag_2:   int    = 0
    tmatrix:  Matrix = field(default_factory = Matrix)
    null:     bytes    = b''
    subnodes: list[sn.SubNodeV2 | sn.OldSubnodes | sn.SoftBodySubNode] = field(default_factory = list)
    @classmethod
    def parse(cls, file: BufferedReader, db_dict: dict[int,ItemDB]) -> PlacedItem:
        signature,length = read_uints(file,2)
        assert signature == 0xDB01, f'Found an invalid placed item ({hex(signature)}) @ {hex(file.tell()-8)} in {file.name}' 
        start = file.tell()
        item_id = read_uints(file,1)
        return PlacedItem(item     = get_db_entry(file, db_dict, 'get_item', item_id),
                          item_id  = item_id,
                          flag_1   = read_uints(file,1),
                          flag_2   = read_uints(file,1),
                          tmatrix  = read_x_tmatrix(file),
                          null     = file.read(8),
                          subnodes = sn.read_subnodes(file,start,length))
    def copy(self, transform: Matrix | None = None) -> PlacedItem:
        if transform: tmatrix = transform @ self.tmatrix
        else:         tmatrix = self.tmatrix.copy()
        return PlacedItem(item     = self.item,
                          item_id  = self.item_id,
                          flag_1   = self.flag_1,
                          flag_2   = self.flag_2,
                          tmatrix  = tmatrix,
                          null     = self.null,
                          subnodes = [subnode.copy(transform) for subnode in self.subnodes])
    def write(self, owner_db: ItemDB, udb: ItemDB, as_local: bool, transform: Matrix | None = None) -> bytes:
        if transform: world_matrix = transform @ self.tmatrix
        else:         world_matrix = self.tmatrix
        if self.item and (self.item.owner_db != udb or as_local): d = self.item.write(owner_db = owner_db, udb = udb, as_local = as_local)
        else:                                       d = write_uint(self.item_id)
        d += write_uints((self.flag_1,self.flag_2)) + write_tmatrix(world_matrix) + write_uints((0,0))
        for subnode in self.subnodes: d += subnode.write(transform = transform)
        return write_uints((0xDB01, len(d))) + d

def _get_expected_type_from_dclass(cls, attr_name) -> str | None:
    if not hasattr(cls, attr_name): raise Exception(f'Class {cls} has no field: {attr_name}')
    for f in fields(cls):
        if f.name == attr_name: 
            return f.type

@dataclass
class ItemDB:
    file:    BufferedReader | None = None
    signature: int = 0x80000000
    name: str = ''
    i_file: BufferedReader | None = None
    idb_version:      int                              = field(default_factory = int)
    idb_lookup_table: dict[int,tuple[int,int,int,int]] = field(default_factory = dict)
    idb_data_start:   int                              = field(default_factory = int)
    items:            dict[int,Item]                   = field(default_factory = dict)
    r_items:          dict[Item,int]                   = field(default_factory = dict) #Reverse dict.
    w_items:          dict[Item,bytes]                 = field(default_factory = dict) #For holding item data.
    #
    s_file: BufferedReader | None = None
    sdb_version:      int                              = field(default_factory = int)
    sdb_lookup_table: dict[int,tuple[int,int,int,int]] = field(default_factory = dict)
    sdb_data_start:   int                              = field(default_factory = int)
    strings:          dict[int,str]                    = field(default_factory = dict)
    r_strings:        dict[str,int]                    = field(default_factory = dict)
    #
    placed_items:     list[PlacedItem]                 = field(default_factory = list)
    @classmethod
    def parse_database(cls, file: BufferedReader, signature: int, length: int, db_dict: dict[int,ItemDB], name: str = '') -> ItemDB:
        file.seek(file.tell() - 4)
        db = ItemDB(file = file, signature = signature, name = name)
        db.parse_local_db(length = length, db_dict = db_dict)
        assert db.idb_lookup_table, f'Somehow read an empty item lookup table for database {name}. Started @ {hex(start)} in {file.name}'
        return db
    def parse_itemdb(self, signature_override: bool = False, version: int = 0x8, file_path: str = '') -> None:
        self.idb_version = version & 0xFF
        if file_path: self.i_file = open(file_path,'rb')
        file = self.file if not self.i_file else self.i_file
        if not signature_override: self.idb_version = read_uints(file,1) & 0xFF
        table_length = read_uints(file,1)
        start = file.tell()
        # print(f'Reading item database lookuptable @ {hex(file.tell())} in {file.name}')
        self.idb_lookup_table         = {entry[0]:entry for entry in [read_uints(file,4) for _ in range(table_length//0x10)][:-1]} #Get rid of the bug entry at the end.
        self.idb_data_start           = file.tell()
    def parse_strdb(self, file_path: str = '') -> None:
        if file_path: self.s_file = open(file_path, 'rb')
        file = self.file if self.file else self.s_file
        self.sdb_version,table_length = read_uints(file,2)
        self.sdb_version &= 0xFF
        self.sdb_lookup_table         = {i:entry for i,entry in enumerate([read_uints(file,4) for _ in range(table_length//0x10)][:-1],1)} #Uses the position in the lookuptable instead of the id in the entry... for some reason.
        self.sdb_data_start           = file.tell()
    def parse_placed_items(self, db_dict: dict[int,ItemDB]) -> None:
        file = self.file
        self.placed_items = [PlacedItem.parse(file,db_dict) for _ in range(read_uints(file,1))]
    def parse_local_db(self, length, db_dict: dict[int,ItemDB]) -> None:
        file = self.file
        start = file.tell()
        while file.tell() - start < length:
            chnk_sig,db_size = read_uints(file,2)
            db_start = file.tell()
            if   chnk_sig == 0xDBDB: self.parse_itemdb() 
            elif chnk_sig == 0xDBCD: self.parse_strdb()
            elif chnk_sig == 0xDBCE: self.parse_placed_items(db_dict)
            file.seek(db_start + db_size) #Jump to the next ItemDB.
    def get_item(self, id: int, db_dict: dict[int,ItemDB]) -> Item | None:
        # print(f'Getting item {hex(id)}')
        id &= 0xFFFFFF #0xFFFFFF, Cut off the db-signature
        if id not in self.idb_lookup_table: return None
        elif id not in self.items:
            db_dict[self.signature] = self
            file = self.file if self.file else self.i_file
            start = file.tell()
            item = Item(owner_db = self)
            self.items[id] = item
            _,chunks,offset,length = self.idb_lookup_table[id]
            file.seek(self.idb_data_start + offset)
            item.__dict__.update(Item.parse(file, self, id, length, chunks, db_dict).__dict__)
            file.seek(start)
        return self.items[id]
    def get_string(self, id: int, *args, **kwargs) -> str:
        id &= 0xFFFFFF #0xFFFFFF
        if id not in self.sdb_lookup_table: return ''
        elif id not in self.strings:
            file = self.file if self.file else self.s_file
            _,_,offset,length = self.sdb_lookup_table[id]
            file.seek(self.sdb_data_start + offset)
            self.strings[id] = read_string(file, length)
        return self.strings[id]
    def get_items_by_classes(self, cls_names: list[str], items_to_check: list[Item] = [], partial_match: bool = False, return_id: bool = False) -> list[Item | int]:
        matches = []
        cls_names = [string.lower() for string in cls_names]
        if items_to_check: 
            item_to_id_dict = {item:id for id,item in self.items.items() if item in items_to_check}
            for item in items_to_check:
                for cls_name in cls_names:
                    if not getattr(item,cls_name) and not partial_match:
                        break
                    elif getattr(item,cls_name): #If it matches any case, keep it when partial_match is enabled.
                        matches.append(item if not return_id else item_to_id_dict[item])
                        break
                else: #If it completely iterates through it, there's a complete match.
                    matches.append(item if not return_id else item_to_id_dict[item])
        else:
            chunk_masks = [bitmask_class_dict[cls_name] for cls_name in cls_names]
            for id,chunks,offset,size in self.idb_lookup_table.values():
                for chunk_mask in chunk_masks:
                    if not chunks & chunk_mask and not partial_match:
                        break
                    elif chunks & chunk_mask:
                        matches.append(self.get_item(id) if not return_id else id)
                        break
                else:
                    matches.append(self.get_item(id) if not return_id else id)
        return matches
    def get_items_by_cls_and_attr_names_using_target_vals(self, targets: list[tuple[str,str,Any]], items_to_check: list[Item] = [], partial_match: bool = False, fuzzy_match: bool = True, return_id: bool = False) -> list[Item | int]:
        '''
        Figure out a better name for this method.
        
        targets: list of tuple: class name, attribute name, target value. If there is not target value, it will check if it has the class
        items_to_check: list of items. If it has entries, it will look in there instead of the entire ItemDB.
        partial_match: Enables partial matches: if one target matches, add it to the result. Otherwise, it will append items that completely match.
        fuzzy_match: if the target attribute can have a fuzzy match, checking if the target value is in it, it will check if it's in it
        return_id: return the ID in the ItemDB instead of the item.
        '''
        initial_matches = self.get_items_by_classes([cls_name for cls_name,_,__ in targets], items_to_check, partial_match, False) #Get the items that match superficially and parse them.
        item_to_id_dict = {item:id for id,item in self.items.items() if item in initial_matches}
        matches = []
        for item in initial_matches:
            #Every break is a False match. If there are no breaks, it's a full match and will be kept.
            #If it's set to partial match and if there's any matches, keep it and break the loop since it doesnt matter if ALL criteria should be met.
            for cls_name,attr_name,target_val in targets:
                cls = getattr(item,cls_name)
                if not target_val: #If there isnt a target value, check if it has the class. If it does, count it as a "match"
                    if partial_match and cls:
                        matches.append(item if not return_id else item_to_id_dict[item])
                        break
                    elif not cls:
                        break
                    else: #Dont bother with the rest. This is where it counts as a "match"
                        continue
                val_to_compare = getattr(cls,attr_name)
                if partial_match:
                    if fuzzy_match and isinstance(target_val,str) and target_val in val_to_compare:
                        matches.append(item if not return_id else item_to_id_dict[item])
                        break
                    elif val_to_compare == target_val:
                        matches.append(item if not return_id else item_to_id_dict[item])
                        break
                elif fuzzy_match and isinstance(target_val,str) and target_val not in val_to_compare:
                    # print(f'Target value {target_val} is a string and is not in {val_to_compare}')
                    break
                elif val_to_compare != target_val and not fuzzy_match:
                    break
            else:
                matches.append(item if not return_id else item_to_id_dict[item])
        return matches
    def read_all_items(self, udb: ItemDB) -> None:
        db_dict = {0x0            : udb,
                   self.signature : self}
        for id in self.idb_lookup_table.keys():
            if id not in self.items: 
                self.get_item(id, db_dict)
    def get_body_size(self) -> int:
        self.read_all_items()
        size = 0
        for item in self.items.values(): size += item.get_size()
        return size
    def append_to_db(self, item: Item | int, owner_db: ItemDB, matching_cls: str = 'thing', matching_attr: str = 'name', matching_index: int = 0, return_appended_id: bool = False) -> int | None:
        if isinstance(item, int): item = self.get_item(id) #Swap from the ID to the item instance.
        val_to_compare = getattr(getattr(item,matching_cls),matching_attr)
        dest_matches: list[Item | int] = owner_db.get_items_by_cls_and_attr_names_using_target_val(matching_cls, matching_attr, val_to_compare, return_id = return_appended_id)
        if dest_matches:
            appended_id = dest_matches[matching_index]
            if return_appended_id: return appended_id
        else:
            biggest_id = 0
            for id in owner_db.idb_lookup_table.keys(): 
                if id > biggest_id: biggest_id = id 
            appended_id = biggest_id + 1
            owner_db.idb_lookup_table[appended_id] = (appended_id,item.get_chunks(),owner_db.get_body_size(),item.get_size())
            owner_db.items[appended_id] = item
            if return_appended_id: return appended_id
    ###
    ### WRITING
    ###
    def write_string(self, string: str, return_id: bool = False) -> bytes | int:
        if not string: return write_uint(0x80000000) if not return_id else 0x80000000 
        if string in self.r_strings: return write_uint(self.r_strings[string]) if not return_id else self.r_strings[string]
        self.r_strings[string] = (len(self.r_strings) + 1) | self.signature
        return write_uint(self.r_strings[string]) if not return_id else self.r_strings[string]
    def write_string_db(self) -> bytes:
        if not self.r_strings: return b''
        lt_d,b_d = b'',b''
        for string,id in sorted(self.r_strings.items(), key = lambda pair: pair[1]):
            string = string.replace(r'\n',f'\n').replace(r'\r',f'\r')
            string_encoded_data = string.encode("ansi")
            lt_d += write_uints([0,1,len(b_d),len(string_encoded_data)])
            b_d  += string_encoded_data
        lt_d += write_uints([0,0,0,0]) #Bug entry!
        d = write_uints([0xAFBF0C00 | self.sdb_version, len(lt_d)]) + lt_d + b_d
        print(f'Wrote {hex(len(self.r_strings))} strings to database with version {hex(0xAFBF0C00 | self.sdb_version)}')
        return write_uints([0xDBCD,len(d)]) + d
    def write_placed_items(self, udb: ItemDB, as_local: bool) -> bytes:
        if not self.placed_items: return b''
        d = b''
        written_items = 0
        for pitem in self.placed_items:
            if not pitem.item: continue
            d += pitem.write(owner_db = self, udb = udb, as_local = as_local)
            written_items += 1
        print(f'Wrote {hex(written_items)} placed items...')
        return write_uints((0xDBCE, len(d) + 4, written_items)) + d
    def write_item_db(self) -> bytes:
        if not self.r_items: return b''
        lt_d,b_d = b'',b''
        items_written = 0
        for item,id in sorted(self.r_items.items(), key = lambda pair: pair[1]): #Ids need to be incremental.
            data = self.w_items[item]
            lt_d += write_uints([self.r_items[item] & 0xFFFFFF, item.get_chunks(), len(b_d), len(data)])
            b_d += data
            items_written += 1
        lt_d += write_uints([0,0,0,0]) #Bug entry!
        print(f'Wrote {hex(items_written)} items to the database with version {hex(0xDBAC0D00 | self.idb_version)}')
        d = write_uints([0xDBAC0D00 | self.idb_version, len(lt_d)]) + lt_d + b_d
        return write_uints([0xDBDB,len(d)]) + d
    def write(self, udb: ItemDB, as_local: bool, combine_databases: bool = True, write_placed_items: bool = True, write_parent_class: bool = True) -> bytes | tuple[bytes,bytes,bytes]:
        # if udb: udb.read_all_items()
        p_i_d = self.write_placed_items(udb = udb, as_local = as_local) if write_placed_items else b''
        i_d   = self.write_item_db()
        s_d   = self.write_string_db() if self.r_strings else b''
        if combine_databases:
            d = b''
            if i_d:   d += i_d
            if s_d:   d += s_d
            if p_i_d and write_placed_items: d += p_i_d
            if d: return write_uints([0xDBC0,len(d)]) + d if write_parent_class else d
            else: return b''
        else: return i_d,s_d,p_i_d
    @classmethod
    def combine_database_data(cls, i_d: bytes = b'', s_d: bytes = b'', p_i_d: bytes = b'') -> bytes:
        d = b''
        if i_d:   d += i_d
        if s_d:   d += s_d
        if p_i_d: d += p_i_d
        if d: return write_uints([0xDBC0,len(d)]) + d
        else: return b''
    def __repr__(self) -> str:
        return f'ItemDB(name={self.name},{f' file={self.file.name},' if self.file else ''}{f' i_file={self.i_file.name}, ' if self.i_file else ''}idb_version={hex(self.idb_version)}, idb_entries_n={hex(len(self.idb_lookup_table))}, {f' s_file={self.s_file.name}, ' if self.s_file else ''}sdb_version={hex(self.sdb_version)}, sdb_entries_n={hex(len(self.sdb_lookup_table))}, placed_items_n={hex(len(self.placed_items))})'


if __name__ == '__main__':
    import os
    # file_path = r'C:\Program Files (x86)\Steam\steamapps\common\Exanima\Resource\arenahub.rfc'
    file_path = r'C:\Users\jango\Desktop\Exanima Testing\proc_test\procgen_1.rfc'
    file_size = os.path.getsize(file_path)
    with open(file_path, 'rb') as file:
        ldb = ItemDB(file = file)
        signature = read_uints(file,1)
        start = file.tell()
        if signature & 0xFFFFFF00 == 0xDBAC0D00: 
            print(f'Parsing item ItemDB...')
            ldb.parse_itemdb(signature_override = True, version = signature)
        elif signature == 0x3D23AFCF: #RFC
            while file_size - file.tell():
                chunk_sig,chunk_length = read_uints(file,2)
                chunk_start = file.tell()
                if chunk_sig == 0xDBC0: ldb.parse_local_db(chunk_length)
                file.seek(chunk_start + chunk_length)
            
            # t_db = ItemDB()
            # test_item = ldb.get_item(1)
            # appended_id = ldb.append_to_db(test_item, owner_db = t_db, return_appended_id = True)
            # print(t_db.write(combine_ItemDBs = True).hex().upper())