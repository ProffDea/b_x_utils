from __future__ import annotations

from ..parsing_funcs import *
from ..writing_funcs import *

import os
from typing import Any

from dataclasses import dataclass,field,replace

g_flags = {
    'rgf_usesex':     0x1,
    'rgf_usemorph':   0x2,
    'rgf_useapparel': 0x4,
    'rgf_underwear':  0x8,
    'rgf_usehair':    0x10,
    'rgf_usebeard':   0x20,
    'rgf_procskin':   0x80,
    'rgf_decomp':     0x100,
    'rgf_edgefade':   0x1000
}
t_flags = {
    'rtf_bleeding':  0x1,
    'rtf_living':    0x2,
    'rtf_learns':    0x4,
    'rtf_korecover': 0x8,
    'rtf_mechanic':  0x10,
    'rtf_resilient': 0x20,
    'rtf_etheral':   0x100,
    'rtf_floating':  0x200
}
b_flags = {
    'rtf_aggresive':   0x1,
    'rtf_savage':      0x2, 
    'rtf_smashattack': 0x4,
    'rtf_grabattack':  0x8
}
w_flags = {
    'rwf_none':  0x0,
    'rwf_held':  0x1,
    'rwf_claws': 0x100,
    'rwf_large': 0x10000,
    'rwf_giant': 0x20000
}
# @dataclass
# class 

def write_flags(flag_dict, o):
    u32 = 0
    for name,bitflag in flag_dict.items():
        if getattr(o,name): u32 |= bitflag
    return u32

@dataclass
class Locomotion:
    velocity: float = 0.0
    accel: float = 0.0
    decel: float = 0.0
    speed: float = 0.0
    boost: float = 0.0
    @classmethod
    def parse(cls, file: BufferedReader) -> Locomotion:
        return Locomotion(*read_floats(file,5))

@dataclass
class Race:
    id: int = 0x0
    #From Madoc. Thanks, boss.
    name: str = 'New'
    
    parent: Race | None = None

    model_name:  str = 'Human'
    model_scale: tuple[float,float] = (0.0,0.0) #from 1?

    morph_name: str = 'Default'
    anim_set:   str = 'Default'

    # weapon_flag: int = 0

    base_speed: float = 1.0
    step_speed: float = 1.0

    char_size:   float = 1.0
    char_scale:  float = 1.0
    scale_ratio: float = 1.0
    char_mass:   float = 1.0

    balance:    float = 1.0
    rigidity:   float = 0.5
    steadiness: float = 1.0
    dampen:     float = 1.0

    atck_range: float = 1.0 # Unarmed attack range
    atck_swing: float = 1.0 # How far body swings with attacks
    atck_sync:  float = 0.0 # Step-attack synchronisation value
    atck_recvr: float = 1.0 # Recovery time from combat actions
    
    locomotion: list[tuple[int,int,int,int,int]] = field(default_factory = lambda: [(0.0,0.0,0.0,0.0,0.0) for _ in range(4)])

    base_health: float = 1.0

    blood_color: tuple[int,int,int,int] = (128,0,0,0) #4B

    mind_type:  int = 1
    mind_part:  int = 1 #Bone to place mind?
    mind_pos:   tuple[float,float,float] = (0.0,0.0,0.0)
    mind_scale: tuple[float,float,float] = (1.0,1.0,1.0)
    mind_ang:   float = 0.0 #?

    vision:     float = 1.0
    mind_sense: float = 0.0
    hearing:    float = 1.0

    resist_impact: int = 0 #Byte
    resist_slash:  int = 0
    resist_crush:  int = 0
    resist_pierce: int = 0

    resist_shock: int = 0
    resist_fire:  int = 0
    resist_res0:  int = 0 #?
    resist_res1:  int = 0 #?

    reserved: tuple[int,int,int,int] = (0,0,0,0) #Unused stuff. Pending format change.

    foley_sound:  str = ''
    step_sound:   str = '' #'StpSft'
    impact_sound: str = '' #'FlsCol'
    wound_sound:  str = '' #'WndFls'
    voice_set:    str = '' #'VH{S}'

    undead_voice: str = '' #'VH{S}DA'

    foley_gain:  float = 1.0
    foley_pitch: float = 1.0

    step_gain:  float = 1.0
    step_pitch: float = 1.0

    impact_gain:  float = 1.0
    impact_pitch: float = 1.0

    wound_gain:  float = 1.0
    wound_pitch: float = 1.0

    voice_gain:  float = 1.0
    voice_pitch: float = 1.0

    dead_gain:  float = 1.0
    dead_pitch: float = 1.0

    grunt_freq: int = 4

    body_parts: int = 0 #??
    body_vals:  list[tuple[int,int,int,int]] = field(default_factory = lambda: [(0,0,0,0) for _ in range(20)]) #20 entries long.
    body_covr:  list[tuple[int,int,int,int]] = field(default_factory = lambda: [(0,0,0,0) for _ in range(20)])

    weak_points: int = 0 #Unused

    #RGF
    rgf_usesex:     bool = False
    rgf_usemorph:   bool = False #Physique morphing.
    rgf_useapparel: bool = False
    rgf_underwear:  bool = False
    rgf_usehair:    bool = False
    rgf_usebeard:   bool = False
    rgf_procskin:   bool = False
    rgf_decomp:     bool = False
    rgf_edgefade:   bool = False #applies fading to model edges (spirit form)
    #RTF - Trait flags
    rtf_bleeding:  bool = False
    rtf_living:    bool = False
    rtf_learns:    bool = False
    rtf_korecover: bool = False
    rtf_mechanic:  bool = False #Paralyzed when shocked
    rtf_resilient: bool = False # Resistant to stuns
    rtf_etheral:   bool = False
    rtf_floating:  bool = False
    #RBF - Behabvior flags
    rtf_aggresive:   bool = False #Does not parry and fights aggressively
    rtf_savage:      bool = False # disregards defence
    rtf_smashattack: bool = False
    rtf_grabattack:  bool = False #Replaces thrusts
    #RWF - Weapon type flags
    rwf_none:  bool = False #Cannot use weapons
    rwf_held:  bool = False #Normal weapons
    rwf_claws: bool = False
    rwf_large: bool = False #Large weapons (Golems)
    rwf_giant: bool = False #Giant weapons (Ogres)
    @classmethod
    def parse(cls, file: BufferedReader, id: int, racedb: RaceDB) -> Race:
        start = file.tell()
        r = Race(id = id)
        r.name = read_name(file)
        parent_id,build_flag,trait_flag,behave_flag = read_uints(file,4)
        r.parent = racedb.get_race(parent_id) if parent_id else None
        r.model_name,r.model_scale = read_name(file),read_floats(file,2)
        r.morph_name,r.anim_set    = read_name(file),read_name(file)
        # 0x58 to this point.
        weapon_flag = read_uints(file,1)
        r.base_speed,r.step_speed = read_floats(file,2)
        r.char_size,r.char_scale,r.scale_ratio,r.char_mass = read_floats(file,4)
        r.balance,r.rigidity,r.steadiness,r.dampen         = read_floats(file,4)
        r.atck_range,r.atck_swing,r.atck_sync,r.atck_recvr = read_floats(file,4)
        # 0x88 to this point.
        # r.locomotion = [Locomotion.parse(file) for _ in range(4)]
        r.locomotion = [read_floats(file,5) for _ in range(4)]
        # 0xD8 to this point.
        r.base_health = read_floats(file,1)
        r.blood_color = read_ubytes(file,4)
        r.mind_type,r.mind_part = read_uints(file,2)
        r.mind_pos,r.mind_scale = read_floats(file,3),read_floats(file,3)
        r.mind_ang = read_floats(file,1)
        r.vision,r.mind_sense,r.hearing = read_floats(file,3)
        r.resist_impact,r.resist_slash,r.resist_crush,r.resist_pierce = read_ubytes(file,4)
        r.resist_shock,r.resist_fire,r.resist_res0,r.resist_res1 = read_ubytes(file,4)
        r.reserved = read_uints(file,4)
        r.foley_sound,r.step_sound,r.impact_sound,r.wound_sound,r.voice_set,r.undead_voice = [read_name(file) for _ in range(6)]
        r.foley_gain,r.foley_pitch   = read_floats(file,2)
        r.step_gain,r.step_pitch     = read_floats(file,2)
        r.impact_gain,r.impact_pitch = read_floats(file,2)
        r.wound_gain,r.wound_pitch   = read_floats(file,2)
        r.voice_gain,r.voice_pitch   = read_floats(file,2)
        r.dead_gain,r.dead_pitch     = read_floats(file,2)
        r.grunt_freq = read_uints(file,1)
        r.body_parts = read_uints(file,1)
        r.body_vals = [read_ubytes(file,4) for _ in range(20)]
        r.body_covr = [read_ubytes(file,4) for _ in range(20)]
        r.weak_points = read_uints(file,1)
        #DONE READING
        for attr_name,val in {name:bool(build_flag & bitflag)  for name,bitflag in g_flags.items()}.items(): setattr(r,attr_name,val)
        for attr_name,val in {name:bool(trait_flag & bitflag)  for name,bitflag in t_flags.items()}.items(): setattr(r,attr_name,val)
        for attr_name,val in {name:bool(behave_flag & bitflag) for name,bitflag in b_flags.items()}.items(): setattr(r,attr_name,val)
        for attr_name,val in {name:bool(weapon_flag & bitflag) for name,bitflag in w_flags.items()}.items(): setattr(r,attr_name,val)
        # print(f'Ended race parsing @ {hex(file.tell())}. Started @ {hex(start)} and read a length of {hex(file.tell() - start)}')
        return r
    # def __repr__(self) -> str:
    #     return f'Race(id={hex(self.id)}, name={self.name}, model_name={self.model_name})'
    def write(self) -> bytes:
        d  = write_name(self.name)
        d += write_uints((self.parent.id if self.parent else 0, write_flags(g_flags,self), write_flags(t_flags,self), write_flags(b_flags,self)))
        d += write_name(self.model_name) + write_floats(self.model_scale)
        d += write_name(self.morph_name) + write_name(self.anim_set)
        d += write_uint(write_flags(w_flags,self))
        d += write_floats((self.base_speed,self.step_speed))
        d += write_floats((self.char_size,self.char_scale,self.scale_ratio,self.char_mass,self.balance,self.rigidity,self.steadiness,self.dampen))
        d += write_floats((self.atck_range,self.atck_swing,self.atck_sync,self.atck_recvr))
        for loc in self.locomotion: d += write_floats(loc)
        d += write_float(self.base_health)
        d += write_ubytes(self.blood_color)
        d += write_uints((self.mind_type,self.mind_part))
        d += write_floats(self.mind_pos) + write_floats(self.mind_scale) + write_float(self.mind_ang)
        d += write_floats((self.vision,self.mind_sense,self.hearing))
        d += write_ubytes((self.resist_impact,self.resist_slash,self.resist_crush,self.resist_pierce,self.resist_shock,self.resist_fire,self.resist_res0,self.resist_res1))
        d += write_uints(self.reserved)
        d += write_name(self.foley_sound) + write_name(self.step_sound) + write_name(self.impact_sound) + write_name(self.wound_sound) + write_name(self.voice_set) + write_name(self.undead_voice)
        d += write_floats(( self.foley_gain,self.foley_pitch,self.step_gain,self.step_pitch,self.impact_gain,self.impact_pitch,self.wound_gain,self.wound_pitch,self.voice_gain,self.voice_pitch,self.dead_gain,self.dead_pitch))
        d += write_uints((self.grunt_freq,self.body_parts))
        for part in self.body_vals: d += write_ubytes(part)
        for part in self.body_covr: d += write_ubytes(part)
        d += write_uint(self.weak_points)
        return d

def get_races(exe_dir: str) -> list[str]:
    file = open(exe_dir,'rb')
    read_file = file.read()
    #The race name closest to the start of the list. Only one occurance of 'skel'.
    #I would use 'human', but it's referenced multiple times.
    races_start = read_file.find(b'skel') - 0x14
    file.seek(races_start)
    race_slots,race_slots_n = [],20
    for _ in range(race_slots_n):
        race_name, unk = read_name(file), file.read(4)
        race_slots.append(race_name)
    file.close()
    return race_slots

@dataclass
class RaceDB:
    file: BufferedReader = field(default_factory = None)
    version:      int = 0
    lookup_table: dict[int,tuple[int,int,int,int]] = field(default_factory = dict)
    data_start:   int = 0
    races:        dict[int,Race] = field(default_factory = dict)
    @classmethod
    def parse(cls, file: BufferedReader, version: int, data_size: int = 0) -> RaceDB:
        lookup_table = {entry[0]:entry for entry in [read_uints(file,4) for _ in range(read_uints(file,1)//0x10)][:-1]}
        data_start = file.tell()
        if not data_size: data_size = os.path.getsize(file.name) 
        return RaceDB(file = file,
                      version = version,
                      lookup_table = lookup_table,
                      data_start = data_start,
                      races = {})
    def get_race(self, id: int, lite_mode: bool = False) -> Race | bytes | None:
        file = self.file
        if id not in self.lookup_table and id not in self.races: 
            print(f'Failed to get race ID {hex(id)}, returning None')
            return None #self.get_race(0x1)
        elif id in self.races:                                   
            return self.races[id]
        else:
            start = file.tell()
            race = Race(id = id)
            self.races[id] = race
            _,__,offset,size = self.lookup_table[id]
            file.seek(self.data_start + offset)
            race.__dict__.update(Race.parse(file, id, self).__dict__)
            self.races[id] = race
            file.seek(start)
            return race
    def get_races_by_attributes(self, attrs: list[tuple[str,Any]], fuzzy_match: bool = False) -> list[Race | None]:
        '''
        Get races by the attributes provided
        attrs: list[tuple[attribute_name:str,attribute_value:Any]]
        fuzzy_match: bool, used for things that can be fuzzy matched: strings
        '''
        matches = []
        for attr_name,val in attrs:
            if fuzzy_match and isinstance(val,str): val = val.lower()
            print(f'Searching for attribute {attr_name} with value {repr(val)}')
            for id in self.lookup_table:
                race = self.get_race(id)
                if fuzzy_match and isinstance(val,str) and val in getattr(race,attr_name).lower():
                    matches.append(race)
                elif val == getattr(race,attr_name):
                    matches.append(race)
        return matches if matches else [None]
    def create_new_race(self, name: str = '', ignore_existing: bool = False) -> Race | None:
        r = self.get_races_by_attributes(attrs = [('name',name)], fuzzy_match = True)[0]
        if r and not ignore_existing: return r
        next_id = max(self.lookup_table.keys()) + 1
        self.lookup_table[next_id] = (next_id,0,0,0)
        r = Race(id = next_id, name = name)
        self.races[next_id] = r
        return r
    def copy_race(self, race: Race | None = None, name: str = '', id: int = 0x0) -> Race:
        if not race:
            if not name: race = self.get_race(id)
            elif name:   race = self.get_races_by_attributes(attrs = [('name',name)], fuzzy_match = True)[0]
        print(f'Copying race {race.name}')
        r_c = replace(race)
        next_id = max(self.lookup_table.keys()) + 1
        r_c.id = next_id
        self.lookup_table[next_id] = (next_id,0,0,0)
        self.races[next_id] = r_c
        return r_c
    def write_all(self) -> bytes:
        lt_d,b_d = b'',b'' #Lookuptable data, body data
        races = [self.get_race(id) for id in self.lookup_table.keys()]
        for r in sorted(races, key = lambda race: race.id):
            r_d = r.write()
            lt_d += write_uints((r.id,0,len(b_d),len(r_d)))
            b_d += r_d
        lt_d += write_uints((0,0,0,0)) #Bug entry!
        d = write_uints((0xDBCB0D00,len(lt_d))) + lt_d + b_d
        return d
    def write_to_file(self, file_dir: str) -> None:
        import os
        file = open(os.path.join(file_dir,'races.rdb'), 'wb')
        file.write(self.write_all())
        file.close()

def parse_race_db(file: BufferedReader, signature: int) -> RaceDB:
    version = signature & 0xFF
    return RaceDB.parse(file,version)

def parse_race_db_file(file_path: str) -> RaceDB:
    file = open(file_path,'+rb')
    signature = read_uints(file,1)
    race_db = None
    if signature == 0xDBCB0D00:
        race_db = parse_race_db(file, signature)
    return race_db

if __name__ == '__main__':
    cwd = os.getcwd()
    race_db_path = os.path.join(cwd,'races.rdb')
    race_db = parse_race_db_file(race_db_path)