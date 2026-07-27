from __future__ import annotations
from typing import ClassVar,Any

from dataclasses import dataclass,field,fields,replace
from _io import BufferedReader

from ..parsing_funcs import *
from ..writing_funcs import *
from .items import Item,ItemDB,get_db_entry
from .charroles import RoleInstance,RoleDB,OldRoleInstance,Role
from .races import Race

from typing import TYPE_CHECKING
if TYPE_CHECKING:
    from ..rfp import RFP

#Class CharItemFlag(Enum):

@dataclass
class CharItem:
    item_id: int = 0
    item: Item | None = None
    flag: int = 0 #CharItemFlag
    @classmethod
    def parse(cls, file: BufferedReader, db_dict: dict[int,ItemDB]) -> CharItem:
        item_id = read_uints(file,1)
        return CharItem(item_id = item_id,
                        item = get_db_entry(file, db_dict, 'get_item', item_id),
                        flag = read_uints(file,1))
    def clear(self) -> None:
        self.item_id,self.item = 0,None
    def write(self, owner_idb: ItemDB, uidb: ItemDB, as_local: bool) -> bytes:
        if self.item: d = self.item.write(owner_db = owner_idb, udb = uidb, as_local = as_local)
        else:         d = write_uint(self.item_id)
        return d + write_uint(self.flag)
    def __repr__(self):
        return f'CharItem(item_id={hex(self.item_id)}, item={self.item}, flag={hex(self.flag)})'

from enum import Enum

class CloseCombatSkills(Enum):
    remise     = 1
    feint      = 2
    fend       = 3
    riposte    = 4
    draw       = 5
    impel      = 6
    brace      = 7
    dual_Wield = 8

class ArmorSkills(Enum):
    miA1       = 1 #Maneuvering in armor
    miA2       = 2
    miA3       = 3
    deflection = 4
    security   = 5
    unused1    = 6
    unused2    = 7
    unused3    = 8

class ShieldSkills(Enum):
    counter   = 1
    synchrony = 2
    ward      = 3
    persist   = 4
    endure    = 5
    mobility  = 6
    unused1   = 7
    unused2   = 8

class InsightSkills(Enum):
    inversion    = 1
    expansion    = 2
    convergence  = 3
    union        = 4
    coherence    = 5
    iteration    = 6
    revelation   = 7
    amalgamation = 8

class ConcentrationSkills(Enum):
    sustain      = 1
    continuity_1 = 2
    continuity_2 = 3
    continuity_3 = 4
    abstraction  = 5
    clarity      = 6
    resolve      = 7
    volition     = 8

class SkillCategory(Enum):
    closecombat  = 0
    # Ranged        = 1 #Unimplemented
    armor         = 2
    shield        = 3
    insight       = 4
    concentration = 5

SKILL_ENUM_MAP = {
    SkillCategory.closecombat:   CloseCombatSkills,
    SkillCategory.armor:         ArmorSkills,
    SkillCategory.shield:        ShieldSkills,
    SkillCategory.insight:       InsightSkills,
    SkillCategory.concentration: ConcentrationSkills,
}

SKILL_NAME_DICT = {
    'closecombat':   SkillCategory.closecombat,
    'armor':         SkillCategory.armor,
    'shield':        SkillCategory.shield,
    'insight':       SkillCategory.insight,
    'concentration': SkillCategory.concentration
}

@dataclass
class Skill:
    category: SkillCategory = SkillCategory.closecombat
    xp: int = 0 #H. Every 5000 xp enables an ability.
    abilities: list[CloseCombatSkills | ArmorSkills | ShieldSkills | InsightSkills | ConcentrationSkills] = field(default_factory = list)
    @classmethod
    def parse(cls, file: BufferedReader) -> Skill:
        category_id,xp = read_ushorts(file,2)
        category = SkillCategory(category_id)
        abilities_n = read_ubytes(file,1)
        skill_cls = SKILL_ENUM_MAP[category]
        return Skill(category = category,
                     xp = xp,
                     abilities = [skill_cls(read_ubytes(file,1)) for _ in range(abilities_n)])
    def write(self) -> bytes:
        return write_ushorts((self.category.value,self.xp)) + write_ubyte(len(self.abilities)) + write_ubytes([a.value for a in self.abilities])

@dataclass
class InventoryItem:
    charitem: CharItem = field(default_factory = CharItem)
    loc: tuple[int,int] = (0,0)
    @classmethod
    def parse(cls, file: BufferedReader, db_dict: dict[int,ItemDB]) -> InventoryItem:
        return InventoryItem(charitem = CharItem.parse(file, db_dict),
                             loc = read_sshorts(file,2))
    def write(self, owner_idb: ItemDB, uidb: ItemDB, as_local: bool) -> bytes:
        return self.charitem.write(owner_idb = owner_idb, uidb = uidb, as_local = as_local) + write_sshorts(self.loc)

@dataclass
class Relation:
    char_id: int = 0
    char: Character | None = None
    type: int = 0
    reputation: float = 0.0
    unk: bytes = b''
    @classmethod
    def parse(cls, file: BufferedReader, chardb_dict: dict[int,CharDB], itemdb_dict: dict[int,ItemDB], char_id: int) -> Relation:
        length = read_uints(file,1)
        cdb = chardb_dict.get(char_id)
        return Relation(char_id = char_id,
                        char = cdb.get_char(char_id, chardb_dict, itemdb_dict) if cdb else None,
                        type = read_uints(file,1),
                        reputation = read_floats(file,1),
                        unk = file.read(length - 8))
    def write(self, owner_cdb: CharDB, owner_idb: ItemDB, uidb: ItemDB, as_local: bool) -> tuple[int,bytes]:
        char_id = self.char.write(owner_cdb = owner_cdb, owner_idb = owner_idb, uidb = uidb, return_id = True, as_local = as_local) if self.char else self.char_id
        d = write_uint(self.type) + write_float(self.reputation) + self.unk
        return char_id, write_uint(len(d)) + d

# @dataclass
# class Personality:
#     #From structs.txt: https://drive.google.com/file/d/1VJ7dUHDCnVe6PmH-_X2KvswGjZ7s6D1E/view?usp=sharing
#     trustfulness: int = 0x64
#     bravery:      int = 0x64 #Resistance to running away
#     benach:       int = 0x64 #Benevolence/Achievement (also phrased as similar to altruism/narcissism)
#     neuroticism:  int = 0x64 #Craziness
#     #In game, values appear to range from [-100,155]
#     @classmethod
#     def parse(cls, file: BufferedReader) -> Personality:
#         return Personality(*read_ubytes(file,4))
#     def write(self) -> bytes:
#         return write_ubytes((self.trustfulness,
#                              self.bravery,
#                              self.benach,
#                              self.neuroticism))

def read_relations(file: BufferedReader, chardb_dict: dict[int,CharDB], itemdb_dict: dict[int,ItemDB]) -> list[Relation]:
    relations_n = read_uints(file,1)
    if not relations_n: return []
    rel_table = [read_uints(file,2) for _ in range(relations_n)] #Stores a mini database, a lookuptable and then the relation data.
    data_size = read_uints(file,1)
    start = file.tell()
    relations = []
    for id,offset in rel_table:
        file.seek(start + offset)
        relations.append(Relation.parse(file, chardb_dict, itemdb_dict, id))
    file.seek(start + data_size) #Jump to the end of the data
    return relations

def write_relations(relations: list[Relation], owner_cdb: CharDB, owner_idb: ItemDB, uidb: ItemDB, as_local: bool) -> bytes:
    d = write_uint(len(relations))
    if not relations: return d
    t_d,b_d = b'',b'' #Table, body data
    for rel in relations:
        char_id, rel_d = rel.write(owner_cdb, owner_idb, uidb, as_local)
        t_d += write_uints((char_id,len(b_d)))
        b_d += rel_d
    return d + t_d + write_uint(len(b_d)) + b_d

@dataclass
class LocaleRelation:
    locale_id: int = 0
    unk:       int = 0
    relations: list[Relation] = field(default_factory = list)
    @classmethod
    def parse(cls, file: BufferedReader, lcdb: CharDB) -> LocaleRelation:
        locale_id, unk = read_uints(file,2)
        return LocaleRelation(locale_id = locale_id,
                              unk       = unk,
                              relations = read_relations(file, lcdb, locale_id))
    def write(self, lcdb: CharDB, uidb: int, as_local: bool) -> bytes:
        return write_uints((self.locale_id, self.unk)) + write_relations(self.relations,lcdb,uidb,as_local)

class ConditionType(Enum):
    Salve  = 0xCECC0001
    Elixir = 0xCECC0002

@dataclass
class Condition:
    type: ConditionType = ConditionType.Salve
    remainder: int | float = 0
    @classmethod
    def parse(cls, file: BufferedReader) -> Condition:
        type = ConditionType(read_uints(file,1))
        if type == ConditionType.Elixir: remainder = read_uints(file,1)
        else: remainder = read_floats(file,1)
        return Condition(type      = type,
                         remainder = remainder)
    def write(self) -> bytes:
        d = write_uint(self.type.value)
        if self.type == ConditionType.Elixir: return d + write_uint(self.remainder)
        else:                                 return d + write_float(self.remainder)

@dataclass
class Loadout:
    a:          int = 0 #Tier?
    hand_r:     CharItem = field(default_factory = CharItem) #2L
    hand_l:     CharItem = field(default_factory = CharItem) #2L
    alt_hand_r: CharItem = field(default_factory = CharItem) #2L
    alt_hand_l: CharItem = field(default_factory = CharItem) #2L
    apparel:    list[CharItem] = field(default_factory = list) #2L*[L]
    @classmethod
    def parse(cls, file: BufferedReader, db_dict: dict[int,ItemDB]) -> Loadout:
        return Loadout(a          = read_uints(file,1),
                       hand_r     = CharItem.parse(file, db_dict),
                       hand_l     = CharItem.parse(file, db_dict),
                       alt_hand_r = CharItem.parse(file, db_dict),
                       alt_hand_l = CharItem.parse(file, db_dict),
                       apparel    = [CharItem.parse(file, db_dict) for _ in range(read_uints(file,1))])
    def write(self, owner_idb: ItemDB, uidb: ItemDB, as_local: bool) -> bytes:
        d = write_uint(self.a)
        d += self.hand_r.write(owner_idb,uidb,as_local) + self.hand_l.write(owner_idb,uidb,as_local) + self.alt_hand_r.write(owner_idb,uidb,as_local) + self.alt_hand_l.write(owner_idb,uidb,as_local)
        # Apparel
        apparel_n, a_d = 0, b'' #Make sure there's actually items to write instead of writing "nothing"
        for a_i in self.apparel:
            if a_i.item:
                a_d += a_i.write(owner_idb, uidb, as_local)
                apparel_n += 1
        d += write_uint(apparel_n) + a_d
        #
        return d

@dataclass
class Loadouts:
    loadouts: list[Loadout] = field(default_factory = list)
    @classmethod
    def parse(cls, file: BufferedReader, db_dict: dict[int,ItemDB]) -> Loadouts:
        length = read_uints(file,1)
        return Loadouts(loadouts = [Loadout.parse(file, db_dict) for _ in range(read_uints(file,1))])
    def write(self, owner_idb: ItemDB, uidb: ItemDB, as_local: bool) -> bytes:
        d = write_uint(len(self.loadouts))
        for loadout in self.loadouts: d += loadout.write(owner_idb = owner_idb, uidb = uidb, as_local = as_local)
        return write_uints((0xCDEC00,len(d))) + d

from ..pwr import PowerNode
from struct import unpack

@dataclass
class KeyboundSpell:
    spell_id: int = 0x0
    spell: PowerNode | None = None
    is_active: bool = False
    @classmethod
    def parse(cls, file: BufferedReader, rfp: RFP) -> KeyboundSpell:
        # Read and split up the four-byte UID into its components.
        b = file.read(4)
        # Six values stored in four bytes... Wow!
        power_index = b[0]
        domain_index = b[1]
        is_active = (b[2] >> 4) & 0x0F
        # concentration_index = b[2] & 0x0F
        # insight_index = (b[3] >> 4) & 0x0F
        # icon_flag_index = b[3] & 0x0F
        pwr_tree = rfp.pwrs.get(domain_index)
        return KeyboundSpell(spell_id = unpack('<I',b)[0],
                             spell = pwr_tree.power_dict.get(power_index) if pwr_tree else None,
                             is_active = bool(is_active))
    def write(self) -> bytes:
        if spell := self.spell:
            d = bytes([spell.power_index,
                       spell.domain_index,
                       ((self.is_active & 0x0F) << 4) | (spell.concentration_index & 0x0F),
                       ((spell.insight_index & 0x0F) << 4) | (spell.icon_flag_index & 0x0F)])
        else: d = write_uint(self.spell_id)
        return d

@dataclass
class KnownSpell:
    spell_id: int = 0x0
    spell: PowerNode | None = None
    xp: int = 0
    empowered: bool = False
    no_prereqs: bool = False #?? - Observed on AI that can cast spells without knowing any of the spell's supporting spells
    @classmethod
    def parse(cls, file: BufferedReader, rfp: RFP) -> KnownSpell:
                # Read and split up the four-byte UID into its components.
        b = file.read(4)
        # Six values stored in four bytes... Wow!
        power_index = b[0]
        domain_index = b[1]
        is_active = (b[2] >> 4) & 0x0F
        concentration_index = b[2] & 0x0F
        insight_index = (b[3] >> 4) & 0x0F
        icon_flag_index = b[3] & 0x0F
        xp = read_uints(file,1)
        pwr_tree = rfp.pwrs.get(domain_index)
        return KnownSpell(spell_id = unpack('<I',b)[0],
                          spell = pwr_tree.power_dict.get(power_index) if pwr_tree else None,
                          xp = (xp & (~0x00004000)) & (~0x00010000),
                          empowered = bool(xp & 0x00004000),
                          no_prereqs = bool(xp & 0x00010000))
    def write(self, *args, **kwargs) -> bytes:
        if spell := self.spell:
            d = bytes([spell.power_index,
                       spell.domain_index,
                       ((0 & 0x0F) << 4) | (spell.concentration_index & 0x0F),
                       ((spell.insight_index & 0x0F) << 4) | (spell.icon_flag_index & 0x0F)])
        else: d = write_uint(self.spell_id)
        xp = self.xp
        if self.empowered:  xp |= 0x00004000
        if self.no_prereqs: xp |= 0x00010000
        return d + write_uint(xp)

@dataclass
class Thaumaturgy:
    version: int = 0x1
    potential: float | int = 0.0
    keybound_spells: list[KeyboundSpell] = field(default_factory = lambda: [KeyboundSpell() for _ in range(10)]) #10 of these. for each number on the keyboard, 0-9
    spells: list[KnownSpell] = field(default_factory = list)
    @classmethod
    def parse(cls, file: BufferedReader, rfp: RFP, version: int = 0x1) -> Thaumaturgy:
        length = read_uints(file,1)
        return Thaumaturgy(version         = version,
                           potential = read_floats(file,1) if version == 0x1 else read_uints(file,1),
                           keybound_spells = [KeyboundSpell.parse(file, rfp) for _ in range(10)],
                           spells          = [KnownSpell.parse(file, rfp) for _ in range(read_uints(file,1))])
    def write(self, *args, **kwargs) -> bytes:
        d = write_float(self.potential) if self.version == 0x1 else write_uint(self.potential)
        for kb_spell in self.keybound_spells: d += kb_spell.write()
        d += write_uint(len(self.spells))
        for k_spell in self.spells: d += k_spell.write()
        return write_uints((0x00CDEC00 | self.version, len(d))) + d

@dataclass
class Character:
    created_chars: ClassVar[int] = 0 #May need this later.
    internal_id: int = 0
    id: int = 0x0 #ID in the owner's database.
    owner: CharDB | None = None
    version: int = 0
    name:    str = '' #16s
    surname: str = '' #16s
    muscle: float = 0.0 #f
    fat:    float = 0.0 #f
    height: float = 0.0 #f
    age:    float = 0.0 #f
    skin_x: int = 0 #H
    skin_y: int = 0 #H
    hair_style: int = 0 #L
    hair_x:        int = 0 #B
    hair_y:        int = 0 #B
    hair_suppress: int = 0 #B 
    hair_null:     int = 0 #B
    face_style0: int = 0 #H
    face_style1: int = 0 #H
    voice: str = '' #16s
    voice_pitch: float = 0.0 #f
    gender:     int = 0 #B
    race:       Race | int = 0 #int = 0 #B
    hair_flags: int = 0 #B
    loadout:    int = 0 #B
    last_locale: int = 0 #L
    hand_r: CharItem = field(default_factory = lambda: CharItem()) #2L
    hand_l: CharItem = field(default_factory = lambda: CharItem()) #2L
    alt_hand_r: CharItem = field(default_factory = lambda: CharItem()) #2L
    alt_hand_l: CharItem = field(default_factory = lambda: CharItem()) #2L
    apparel: list[CharItem] = field(default_factory = list) #2L*[L]
    zombification: float = 0.0 #f
    stamina: int = 0 #H
    health:  int = 0 #H
    focus_stamina: int = 0 #H
    focus_health:  int = 0 #H
    combat_skill: int = 0 #L f?
    undead_voice: int = 0 #L
    trustfulness: int = 0 #B
    bravery:      int = 0 #B
    ben_ach:      int = 0 #B
    neuroticism:  int = 0 #B
    rng_seed: int = 0 #L
    raw_xp:   int = 0 #L
    null:     int = 0 #L
    skills:    list[Skill] = field(default_factory = list)
    inventory: list[InventoryItem] = field(default_factory = list)
    old_roles: list[OldRoleInstance] = field(default_factory = list) #v6 version
    roles:     list[RoleInstance] = field(default_factory = list)    #v7+ version
    global_relations: list[Relation] = field(default_factory = list)
    locale_relations: list[LocaleRelation] = field(default_factory = list)
    conditions: list[Condition] = field(default_factory = list)
    #The following may or may not exist:
    # chunks: list[Loadout | Thaumaturgy] = field(default_factory = list)
    loadouts: Loadouts | None = None
    thaumaturgy: Thaumaturgy | None = None
    @classmethod
    def parse(cls, file: BufferedReader, owner_cdb: CharDB, id: int, chardb_dict: dict[int,CharDB], itemdb_dict: dict[int,ItemDB]) -> Character:
        rfp = owner_cdb.rfp
        if not rfp: raise Exception(f'For some reason a chardb wasnt holding a rfp!')
        roledb,racedb = rfp.roledb,rfp.racedb
        signature,size = read_uints(file,2)
        start = file.tell()
        if signature & 0xFFFFFF00 != 0xCDAC00: raise Exception(f'Jumped to an incorrect character chunk ({hex(signature)}) for char ({hex(id)}) in {hex(file.tell())}')
        version = signature & 0xFF
        name,surname = read_name(file),read_name(file)
        # print(f'Reading character {name}')
        muscle,fat,height,age = read_floats(file,4)
        #0x30
        skin_x,skin_y = read_ushorts(file,2)
        hair_style = read_uints(file,1)
        hair_x,hair_y,hair_suppres,hair_null = read_ubytes(file,4)
        face_style0,face_style1 = read_ushorts(file,2)
        #0x40
        voice,voice_pitch = read_name(file),read_floats(file,1)
        gender,race_id,hair_flags,loadout = read_ubytes(file,4)
        last_locale = read_uints(file,1)
        #0x5C
        hand_r,hand_l         = CharItem.parse(file, itemdb_dict),CharItem.parse(file, itemdb_dict) #0x8 bytes per item.
        alt_hand_r,alt_hand_l = CharItem.parse(file, itemdb_dict),CharItem.parse(file, itemdb_dict)
        #0x7C to this point from the start. This is where dynamic arrays start shifting offsets a round.
        apparel = [CharItem.parse(file, itemdb_dict) for _ in range(read_uints(file,1))] #0x8 bytes per item.
        zombification = read_floats(file,1)
        stamina,health = read_ushorts(file,2) #Usually looks like FFFFFFFF
        focus_stamina,focus_health = read_ushorts(file,2) #Usually looks like FFFFFFFF
        #
        combat_skill,undead_voice = read_floats(file,1),read_uints(file,1)
        trustfulness,bravery,ben_ach,neuroticism = read_ubytes(file,4)
        rng_seed,raw_xp,null = read_uints(file,3)
        skills = [Skill.parse(file) for _ in range(read_uints(file,1))]
        inventory = [InventoryItem.parse(file, itemdb_dict) for _ in range(read_uints(file,1))] #0xC bytes per item
        old_roles,roles = [],[]
        if version == 7: #as of v0.9.3
            roles_n,data_length = read_uints(file,2)
            for _ in range(roles_n):
                role = roledb.get_role(read_uints(file,1))
                if role: roles.append(role.parse_instance(file))
        elif version == 6: #Old format
            # raise Exception(f'Reading old character roles @ {hex(file.tell())} in {file.name}')
            old_roles = [OldRoleInstance.parse(file) for _ in range(read_uints(file,1))]
        if version == 5: #v5 weird arrays. Old relations?
            for _ in range(read_uints(file,1)): file.read(0x10)
            for _ in range(read_uints(file,1)): file.read(0x10)
        global_relations,locale_relations = [],[]
        if version >= 6:
            global_relations = read_relations(file, owner_cdb, 0)
            locale_relations = [LocaleRelation.parse(file, chardb_dict) for _ in range(read_uints(file,1))]
        conditions = [Condition.parse(file) for _ in range(read_uints(file,1))] if version > 5 else []
        loadouts,thaumaturgy = [],None
        while file.tell() - start < size:
            chunk_id = read_uints(file,1)
            if   chunk_id == 0: break #No chunks!
            elif chunk_id == 0xCDEC00:                loadouts = Loadouts.parse(file = file, db_dict = itemdb_dict)
            elif chunk_id & 0xFFFFFF00 == 0x00CDEC00: thaumaturgy = Thaumaturgy.parse(file, rfp, version = chunk_id & 0xFF)
        return Character(id = id, owner = owner_cdb,
                         version = version,
                         name = name, surname = surname,
                         muscle = muscle, fat = fat, height = height, age = age,
                         skin_x = skin_x, skin_y = skin_y,
                         hair_style = hair_style,
                         hair_x = hair_x, hair_y = hair_y, hair_suppress = hair_suppres, hair_null = hair_null,
                         face_style0 = face_style0, face_style1 = face_style1,
                         voice = voice, voice_pitch = voice_pitch,
                         gender = gender, 
                         race = racedb.get_race(race_id+1), #rfp.old_race_names[race_id], 
                         hair_flags = hair_flags, loadout = loadout,
                         last_locale = last_locale,
                         hand_r = hand_r, hand_l = hand_l,
                         alt_hand_r = alt_hand_r, alt_hand_l = alt_hand_l,
                         apparel = apparel,
                         zombification = zombification,
                         stamina = stamina, health = health,
                         focus_stamina = focus_stamina, focus_health = focus_health,
                         combat_skill = combat_skill, undead_voice = undead_voice,
                         trustfulness = trustfulness, bravery = bravery, ben_ach = ben_ach, neuroticism = neuroticism,
                         rng_seed = rng_seed, raw_xp = raw_xp, null = null,
                         skills = skills,
                         inventory = inventory,
                         old_roles = old_roles, roles = roles,
                         global_relations = global_relations, locale_relations = locale_relations,
                         conditions = conditions,
                         loadouts = loadouts,
                         thaumaturgy = thaumaturgy)
    def __post_init__(self) -> None:
        self.internal_id = Character.created_chars
        Character.created_chars += 1
    def __hash__(self):
        return self.internal_id
    def __repr__(self) -> str:
        t_l_rels = 0
        for l_rel in self.locale_relations:
            t_l_rels += len(l_rel.relations)
        return f'Character(version={hex(self.version)}, name={self.name}, race_model={self.race.model_name if isinstance(self.race,Race) else self.race}, apparel_n={hex(len(self.apparel))}, inventory_n={hex(len(self.inventory))}, role_names={[role_inst.role.name for role_inst in self.roles]}, personality={(self.trustfulness,self.bravery,self.ben_ach,self.neuroticism)}, thaumaturgy_b={bool(self.thaumaturgy)}, owner_name={self.owner.name})'
    def copy(self) -> Character:
        return replace(self)
    def clear_equipment(self) -> None:
        '''
        Convenience method. Empties out hands and the apparel list for the character.
        '''
        self.hand_r.clear()
        self.hand_l.clear()
        self.alt_hand_r.clear()
        self.alt_hand_r.clear()
        self.apparel = []
    def clear_inventory(self) -> None:
        '''
        Convenience method. Empties out the character's inventory.
        '''
        self.inventory = []
    def add_role(self, rfp: RFP | None = None, role_id: int = 0x0, role_name: str = '', role: Role | None = None):
        if not role: 
            if role_id:     role = rfp.roledb.get_role(role_id)
            elif role_name: role = rfp.roledb.get_roles_by_attributes(attrs = [('name',role_name)], fuzzy_match = True)[0]
            if not role: raise Exception(f'Was unable to find role using ID {hex(role_id)} or name: {role_name}')
        self.roles.append(role.to_instance())
    def update_v6_to_v7(self, rfp: RFP, old_roledb: RoleDB) -> None:
        if self.version != 6: 
            print(f'Character is not version 6')
            return
        new_roledb = rfp.roledb
        if isinstance(self.race,str) and rfp.racedb: self.race = rfp.racedb.get_races_by_attributes(attrs = ['model_name',self.name], fuzzy_match = True)
        self.roles = []
        for o_role_inst in self.old_roles:
            o_role = old_roledb.get_role(o_role_inst.role_id)
            if not o_role: continue
            n_role = new_roledb.get_roles_by_attributes(attrs = [('name',o_role.name)], fuzzy_match = True)[0]
            if not n_role: 
                print(f'Failed to find a matching role for old role {o_role}')
                continue
            n_role_inst = n_role.to_instance()
            self.roles.append(n_role_inst)
        self.version = 7
    def add_thaum(self) -> Thaumaturgy:
        if self.thaumaturgy: return self.thaumaturgy
        self.thaumaturgy = Thaumaturgy()
        return self.thaumaturgy
    def add_skill(self, category_name: str, ability_name: str = '', ability_id: int | None = None) -> None:
        category_name = category_name.lower()
        found_skill = None
        for skill in self.skills:
            if skill.category.name.lower() == category_name:
                found_skill = skill
        else:
            found_skill = Skill(category = SkillCategory(SKILL_NAME_DICT[category_name]))
            self.skills.append(skill)
        skill_cls = SKILL_ENUM_MAP[found_skill.category]
        if ability_id is not None: ability = skill_cls(ability_id)
        else: ability = skill_cls[ability_name]
        found_skill.abilities.append(ability )
        found_skill.xp += 5000
    def write(self, owner_cdb: CharDB, owner_idb: ItemDB, uidb: ItemDB, return_id: bool = False, return_data: bool = False, as_local: bool = False) -> bytes | int | bytes:
        '''
        Writes the character and their contents to the provided databases.
        Returns either:
            the ID of the written character as bytes
            the ID of the written character as an integer
            the data of the character
        Only writes version 7 characters.
        '''
        if self.version != 7: raise Exception(f'Cannot write character {self} because it is version {hex(self.version)}')
        # if not self.id: self.id = len(owner_db.chars) + 1
        if return_id and return_data: raise Exception(f'Cannot return both the ID and data of character {self}')
        if self in owner_cdb.r_chars: 
            if not return_id and not return_data: return write_uint(owner_cdb.r_chars[self])
            elif return_id: return owner_cdb.r_chars[self]
            elif return_data: return owner_cdb.w_chars[self]
        # print(f'Writing char {self.name} to cdb {owner_cdb.name} storing items in {owner_idb.name}')
        owner_cdb.r_chars[self] = len(owner_cdb.r_chars) + 1 | owner_cdb.signature
        # print(f'\tWriting char {self.name} as {hex(owner_cdb.r_chars[self])},{owner_cdb.r_chars[self] & 0xFFFFFF}')
        d = write_name(self.name) + write_name(self.surname)
        d += write_floats((self.muscle,self.fat,self.height,self.age)) + write_ushorts((self.skin_x,self.skin_y)) + write_uint(self.hair_style)
        d += write_ubytes((self.hair_x,self.hair_y,self.hair_suppress,self.hair_null)) + write_ushorts((self.face_style0,self.face_style1))
        d += write_name(self.voice) + write_float(self.voice_pitch) + write_ubytes((self.gender, self.race.id - 1 if isinstance(self.race,Race) else self.race, self.hair_flags, self.loadout)) + write_uint(self.last_locale)
        d += self.hand_r.write(owner_idb, uidb, as_local) + self.hand_l.write(owner_idb, uidb, as_local) + self.alt_hand_r.write(owner_idb, uidb, as_local) + self.alt_hand_l.write(owner_idb, uidb, as_local)
        # Apparel
        apparel_n, a_d = 0, b'' #Make sure there's actually items to write instead of writing "nothing"
        for a_i in self.apparel:
            if a_i.item:
                a_d += a_i.write(owner_idb, uidb, as_local)
                apparel_n += 1
        d += write_uint(apparel_n) + a_d
        #
        d += write_float(self.zombification) + write_ushorts((self.stamina,self.health,self.focus_stamina,self.focus_health))
        d += write_float(self.combat_skill) + write_uint(self.undead_voice) + write_ubytes((self.trustfulness,self.bravery,self.ben_ach,self.neuroticism))
        d += write_uints((self.rng_seed,self.raw_xp,self.null))
        # Skills
        d += write_uint(len(self.skills))
        for skill in self.skills: d += skill.write()
        # Inventory
        inventory_n, i_d = 0, b''
        for i_i in self.inventory:
            c_i = i_i.charitem
            if c_i.item:
                i_d += i_i.write(owner_idb, uidb, as_local)
                inventory_n += 1
        d += write_uint(inventory_n) + i_d
        # Roles
        r_d = b''
        for role_inst in self.roles: 
            if not isinstance(role_inst,RoleInstance): raise Exception(f'Tried to write {role_inst} as a role instance!')
            r_d += role_inst.write()
        d += write_uints((len(self.roles),len(r_d))) + r_d
        # Relations
        d += write_relations(self.global_relations, owner_cdb, owner_idb, uidb, as_local)
        d += write_uint(len(self.locale_relations))
        for l_r in self.locale_relations: d += l_r.write(owner_cdb,uidb,as_local)
        # Conditions - salve; elixir
        d += write_uint(len(self.conditions))
        for cond in self.conditions: d += cond.write()
        # Chunks
        if self.loadouts:    d += self.loadouts.write(owner_idb,uidb,as_local)
        if self.thaumaturgy: d += self.thaumaturgy.write()
        #
        owner_cdb.w_chars[self] = write_uints((0xCDAC00 | self.version, len(d))) + d
        if not return_id and not return_data: return write_uint(owner_cdb.r_chars[self])
        elif return_id: return owner_cdb.r_chars[self]
        elif return_data: return owner_cdb.w_chars[self]

@dataclass
class PlacedChar:
    char_id: int = 0x0
    char:    Character | None = None
    pos:     Vector = field(default_factory = Vector)
    rot:     float = 0.0
    state:   int = 0x0
    pose_sig: int = 0xCAC0E100
    pose:    list[Matrix] | None = None,
    pose_unks: tuple[int,int] = (0,0)
    unk: bytes = b''
    @classmethod
    def parse(cls, file: BufferedReader, chardb_dict: dict[int,CharDB], itemdb_dict: dict[int,ItemDB], length: int) -> PlacedChar:
        start = file.tell()
        char_id = read_uints(file,1)
        # print(f'Searching for character {char_id & 0xFFFFFF}')
        chardb = chardb_dict.get(char_id & 0xFF000000)
        char = chardb.get_char(id = char_id, chardb_dict = chardb_dict, itemdb_dict = itemdb_dict) if chardb else None
        pos = read_3dfvec(file)
        rot = read_floats(file,1)
        state = read_uints(file,1)
        pose,pose_sig,pose_unks,unk = None,0x0,(0,0),b''
        while file.tell() - start < length:
            chunk = read_uints(file,1)
            if   chunk == 0xCAC0E100: pose,pose_sig,pose_unks = [read_x_tmatrix(file) for _ in range(read_uints(file,1)//0x30)],chunk,(0,0)
            elif chunk == 0xCAC0EB00: pose,pose_sig,pose_unks = [read_x_tmatrix(file) for _ in range(read_uints(file,1)//0x30)],chunk,read_uints(file,2)
            elif chunk == 0xCAC0EA00: unk = file.read(read_uints(file,1))
            elif chunk == 0x0: break
            else: raise Exception(f'Found unknown loc chunk ({hex(chunk)}) @ {hex(file.tell())} in {file.name}. Started @ {hex}')
        return PlacedChar(char_id = char_id,
                          char = char,
                          pos = pos,
                          rot = rot,
                          state = state,
                          pose = pose,
                          pose_sig = pose_sig,
                          pose_unks = pose_unks,
                          unk = unk)
    def __repr__(self) -> str:
        return f'PlacedChar({f'char={self.char.__repr__()}' if self.char else f'char_id={hex(self.char_id)}'}, pos={self.pos}, rot={self.rot}, state={hex(self.state)}, has_pose={bool(self.pose)})'
    def write(self, owner_cdb: CharDB, owner_idb: ItemDB, uidb: ItemDB, as_local: bool = False) -> bytes:
        # print(f'Writing placed character {self}')
        d = self.char.write(owner_cdb = owner_cdb, owner_idb = owner_idb, uidb = uidb, as_local = as_local) if self.char else write_uint(self.char_id)
        d += write_3dfvec(self.pos) + write_float(self.rot) + write_uint(self.state)
        if not self.pose and not self.unk: d += write_uint(0x0)
        else:
            if self.pose:
                p_d = b''
                for m in self.pose: p_d += write_tmatrix(m)
                d += write_uints((self.pose_sig,len(p_d))) + p_d
            if self.unk:
                d += write_uints((0xCAC0EA00,len(self.unk))) + self.unk
        return write_uints((0xCAC0CA00,len(d))) + d

@dataclass
class CharDB:
    file: BufferedReader = None
    locale_id:    int = 0 #Locale ID the database is bound to.
    name:         str = ''
    version:      int = 1
    signature:    int = 0x80000000
    lookup_table: dict[int,tuple[int,int,int,int]] = field(default_factory = dict)
    data_start:   int = 0
    chars:        dict[int,Character]   = field(default_factory = dict)
    placed_chars: list[PlacedChar]      = field(default_factory = list)
    r_chars:      dict[Character,int]   = field(default_factory = dict) #Convenience for getting the ID of the character passed in.
    w_chars:      dict[Character,bytes] = field(default_factory = dict) #Holds the data for characters
    #For convenience.
    # itemdb:       ItemDB | None = None
    db_dict:      dict[int,ItemDB] = field(default_factory = dict)
    rfp:          RFP | None = None
    @classmethod
    def parse_database(cls, file: BufferedReader, signature: int, version: int, db_dict: dict[int,ItemDB], rfp: RFP, name: str = '') -> CharDB:
        db = CharDB(file = file, name = name, signature = signature, version = version, db_dict = db_dict, rfp = rfp)
        length = read_uints(file,1)
        db.parse_chardb()
        return db
    def parse_chardb(self) -> None:
        file = self.file
        # print(f'Reading lookuptable @ {hex(file.tell())}')
        self.version = read_uints(file,1) & 0xFF
        self.lookup_table = {entry[0]:entry for entry in [read_uints(file,4) for _ in range(read_uints(file,1)//0x10)][:-1]}
        self.data_start = file.tell()
    def parse_local_db(self, length: int, version: int, chardb_dict: dict[int,CharDB], itemdb_dict: dict[int,ItemDB]) -> None:
        file = self.file
        start = file.tell()
        chars_n = read_uints(file,1)
        chardb_dict[self.signature] = self
        while file.tell() - start < length:
            db_chunk,db_length = read_uints(file,2)
            db_start = file.tell()
            if   db_chunk == 0xCECDDB00 or db_chunk == 0xDBACCD00: self.parse_chardb()
            elif db_chunk == 0xCAC0CA00: self.placed_chars.append(PlacedChar.parse(file = file, chardb_dict = chardb_dict, itemdb_dict = itemdb_dict, length = db_length))
            else: raise Exception(f'Found an unknown chardb chunk {hex(db_chunk)} @ {hex(db_start)} in {file.name}')
            file.seek(db_start + db_length)
        self.version = version & 0xFF
    def get_char(self, id: int, chardb_dict: dict[int,CharDB], itemdb_dict: dict[int,ItemDB]) -> Character | None:
        id &= 0xFFFFFF #Cut off the db-signature
        if id not in self.lookup_table: return None
        elif id not in self.chars:
            file = self.file
            start = file.tell()
            char = Character()
            self.chars[id] = char #Temp storage, prevents infinite recursions. This value should never be returned.
            _,__,offset,length = self.lookup_table[id]
            file.seek(self.data_start + offset)
            char.__dict__.update(Character.parse(file = file, id = id, owner_cdb = self, chardb_dict = chardb_dict, itemdb_dict = itemdb_dict).__dict__)
            file.seek(start) #Jump back to where it was being called.
        return self.chars[id]
    def read_all_chars(self) -> list[Character]:
        return [pchar.char for pchar in self.placed_chars]
    def get_chars_by_attributes(self, attrs: list[tuple[str,Any]], fuzzy_match: bool = False, return_pchars: bool = False) -> list[Character | PlacedChar]:
        '''
        Searches through all placed characters and finds matches in the attrs argument
        attrs: list[tuple[attribute_name:str,attribute_value:Any]]
        fuzzy_match: bool, used for things that can be fuzzy matched: strings
        '''
        matches = []
        for attr_name,val in attrs:
            if isinstance(val,str) and fuzzy_match: val = val.lower()
            for pchar in self.placed_chars:
                char = pchar.char
                if not char: continue
                if fuzzy_match and isinstance(val,str) and val in getattr(char,attr_name).lower():
                    matches.append(char if not return_pchars else pchar)
                elif val == getattr(char,attr_name):
                    matches.append(char if not return_pchars else pchar)
        return matches
    def add_pchar(self, char: Character) -> PlacedChar:
        if not char: raise Exception(f'Please provide a character so they can be placed in the world!')
        pchar = PlacedChar(char = char)
        self.placed_chars.append(pchar)
        return pchar
    def duplicate_pchar(self, pchar: PlacedChar) -> PlacedChar:
        if not pchar: raise Exception(f'Please provide a placed character to duplicate!')
        c_pchar = replace(pchar, char = pchar.char.copy())
        self.placed_chars.append(c_pchar)
        return c_pchar
    def __repr__(self) -> str:
        return f'CharDB(version={hex(self.version)}, locale_id={hex(self.locale_id)}, chars_n={hex(len(self.lookup_table))}, placed_chars_n={hex(len(self.placed_chars))})'
    def write(self, as_local: bool, owner_idb: ItemDB, write_parent_class: bool = True) -> bytes:
        uidb = self.rfp.itemdb
        lt_d,b_d = b'',b'' #lookuptable, body data
        pchar_n, pc_d = 0, b'' #Placed character data
        for pchar in self.placed_chars: #Write only characters that are placed into the world
            if not pchar.char: continue
            pc_d += pchar.write(owner_cdb = self, owner_idb = owner_idb, uidb = uidb, as_local = as_local)
            pchar_n += 1
        for char,id in sorted(self.r_chars.items(), key = lambda pair: pair[1]):
            char_data = self.w_chars[char] 
            lt_d += write_uints((id & 0xFFFFFF,0,len(b_d),len(char_data)))
            b_d += char_data
        lt_d += write_uints((0,0,0,0)) #Bug entry!
        lt_d = write_uints((0xDBACCD00,len(lt_d))) + lt_d
        db_d = lt_d + b_d #database data
        db_d = write_uints((0xCECDDB00,len(db_d))) + db_d
        db_d += pc_d
        # print(f'Wrote {hex(len(self.placed_chars))} placed characters to database with version {hex(self.version)}')
        if write_parent_class: 
            db_d = write_uint(pchar_n) + db_d
            return write_uints((0xCAC00000 | self.version,len(db_d))) + db_d
        else: return db_d