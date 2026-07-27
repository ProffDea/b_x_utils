from __future__ import annotations
from struct import unpack
from dataclasses import dataclass,field
from _io import BufferedReader
import numpy as np

from mathutils import Matrix,Vector,Euler
import os,bpy

if __name__ != '__main__': from . import x_dbs as dbs
# import x_dbs as dbs

np_ubyte,np_ushort,np_uint  = np.dtype('<u1'),np.dtype('<u2'),np.dtype('<u4')
np_float  = np.dtype('<f')

def read_uints(file: BufferedReader, amount: int = 1) -> int | np.ndarray:
    if amount == 1: return np.frombuffer(file.read(4), dtype = np_uint)[0]
    return np.frombuffer(file.read(4*amount),dtype = np_uint)

def read_ushorts(file: BufferedReader, amount: int = 1) -> int | np.ndarray:
    if amount == 1: return np.frombuffer(file.read(2), dtype = np_ushort)[0]
    return np.frombuffer(file.read(2*amount),dtype = np_ushort)

def read_ubytes(file: BufferedReader, amount: int = 1) -> int | np.ndarray:
    if amount == 1: return np.frombuffer(file.read(1), dtype = np_ubyte)[0]
    return np.frombuffer(file.read(amount),dtype = np_ubyte)

def read_floats(file: BufferedReader, amount: int = 1) -> float | np.ndarray:
    if amount == 1: return np.frombuffer(file.read(4), dtype = np_float)[0]
    return np.frombuffer(file.read(4*amount),dtype = np_float)

def read_vector(file: BufferedReader, dims: int = 3) -> Vector:
    return Vector(read_floats(file,dims))

def read_euler(file: BufferedReader, dims: int = 3) -> Euler:
    return Euler(read_floats(file,dims))

def read_name(file: BufferedReader) -> str:
    return file.read(16).rstrip(b"\0").decode("ascii",errors='ignore')

def read_string(file: BufferedReader) -> str:
    return file.read(read_uints(file,1)).decode("ascii",errors='ignore')

def get_nibbles(hexstr: str) -> list[int]:
    return [int(i,16) for i in hexstr]

def xmtom(m) -> Matrix: # Exanima transformation matrix as a 4x4 matrix. Thanks, Inuk.
    return Matrix(((
        (m[0], m[6], m[3], m[9]),
        (m[2], m[8], m[5], m[11]),
        (m[1], m[7], m[4], m[10]),
        (0, 0, 0, 1))))

def read_x_tmatrix(file: BufferedReader) -> Matrix:
    return xmtom(read_floats(file,12))

# @dataclass(slots = True)
# class TileSlot:
#     index:   int = field(default_factory = int)
#     variant: int = field(default_factory = int)

wall_conversion_dict = {
    1:2, #Left to Right
    2:1  #Right to Left 
}

corner_conversion_dict = {
    1:2, #Left to Right
    2:1  #Right to Left
}
@dataclass(slots = True)
class Tile:
    wallset_id:  int =            field(default_factory = int)
    floorset_id: int =            field(default_factory = int)
    floor_variant: int =          field(default_factory = int)
    parts: list[tuple[int,int]] = field(default_factory = list)
    special_orientation: int =    field(default_factory = int)
    special_group:       int =    field(default_factory = int)
    special_modifier:    int =    field(default_factory = int)
    def rotate(self, turns: int) -> None:
        #
        # ADD ROTATING SPECIALS
        #
        if turns % 4 == 0: return
        turns, parts = turns % 4, self.parts
        #5 1 6
        #0   2
        #4 3 7
        parts[5] = parts[5][0] & (~0b1000), parts[5][1] #Get rid of the bitflag
        if   turns == 3:
            #4 0 5
            #3   1
            #7 2 6
            parts = [parts[3],parts[0],parts[1],parts[2],parts[7],parts[4],parts[5],parts[6]] #90 deg
        elif turns == 2:
            #7 3 4
            #2   0
            #6 1 5
            parts = [parts[2],parts[3],parts[0],parts[1],parts[6],parts[7],parts[4],parts[5]] #180 deg
        elif turns == 1:
            #6 2 7
            #1   3
            #5 0 4
            parts = [parts[1],parts[2],parts[3],parts[0],parts[5],parts[6],parts[7],parts[4]] #270 deg
        parts[5] = parts[5][0] | 0b1000, parts[5][1] #Add back the bitflag
        self.parts = parts
    def mirror_y(self) -> None:
        #Add support for specials
        parts = self.parts
        is_real = False
        if parts[5][0] & 0b1000:
            is_real = True
            parts[5] = parts[5][0] & (~0b1000), parts[5][1] #Get rid of the bitflag
        parts[5] = parts[5][0] & (~0b1000), parts[5][1] #Get rid of the bitflag
        #5 1 6    6 1 5
        #0   2 -> 2   0
        #4 3 7    7 3 4
        # parts = [parts[2],parts[1],parts[0],parts[3],parts[7],parts[6],parts[5],parts[4]]
        parts = [(wall_conversion_dict.get(parts[2][0],parts[2][0]),parts[2][1]),
                 (wall_conversion_dict.get(parts[1][0],parts[1][0]),parts[1][0]),
                 (wall_conversion_dict.get(parts[0][0],parts[0][0]),parts[0][0]), #Some of these wont need to be converted due to the mirroring axis
                 (wall_conversion_dict.get(parts[3][0],parts[3][0]),parts[3][0]),
                 (corner_conversion_dict.get(parts[7][0],parts[7][0]),parts[7][1]),
                 (corner_conversion_dict.get(parts[6][0],parts[6][0]),parts[6][1]),
                 (corner_conversion_dict.get(parts[5][0],parts[5][0]),parts[5][1]),
                 (corner_conversion_dict.get(parts[4][0],parts[4][0]),parts[4][1])]
        if is_real:
            parts[5] = parts[5][0] | 0b1000, parts[5][1] #Add back the bitflag
        self.parts = parts
    def mirror_x(self) -> None:
        #Add support for specials
        parts = self.parts
        is_real = False
        if parts[5][0] & 0b1000:
            is_real = True
            parts[5] = parts[5][0] & (~0b1000), parts[5][1] #Get rid of the bitflag
        #5 1 6    4 3 7
        #0   2 -> 0   2
        #4 3 7    5 1 6
        # parts = [parts[0],parts[3],parts[2],parts[1],parts[5],parts[4],parts[7],parts[6]]
        parts = [(wall_conversion_dict.get(parts[0][0],parts[0][0]),parts[0][1]),
                 (wall_conversion_dict.get(parts[3][0],parts[3][0]),parts[3][1]),
                 (wall_conversion_dict.get(parts[2][0],parts[2][0]),parts[2][1]), #Some of these parts shouldnt be swapped depending on the parts being swapped.
                 (wall_conversion_dict.get(parts[1][0],parts[1][0]),parts[1][1]),
                 (corner_conversion_dict.get(parts[5][0],parts[5][0]),parts[5][1]),
                 (corner_conversion_dict.get(parts[4][0],parts[4][0]),parts[4][1]),
                 (corner_conversion_dict.get(parts[7][0],parts[7][0]),parts[7][1]),
                 (corner_conversion_dict.get(parts[6][0],parts[6][0]),parts[6][1])]
        if is_real:
            parts[5] = parts[5][0] | 0b1000, parts[5][1] #Add back the bitflag
        self.parts = parts

@dataclass(slots = True)
class TileChunk:
    wallsets:  list[str]  = field(default_factory = list)
    floorsets: list[str]  = field(default_factory = list)
    scale:     float      = field(default_factory = float)
    tiles_arr: np.ndarray = field(default_factory = lambda: np.zeros(shape=(0,), dtype=int))
    @classmethod
    def parse(cls, file: BufferedReader) -> TileChunk:
        length = read_uints(file,1)
        # print(f'Started reading tilechunk @ {hex(file.tell())}')
        wallsets =  {i:read_name(file).lower() for i in range(read_uints(file,1))}
        floorsets = {i:read_name(file).lower() for i in range(read_uints(file,1))}
        # print((wallsets,floorsets))
        dim_x,dim_y,null,scale = read_uints(file,4)
        tiles_n = dim_x*dim_y
        comps,vars,sets = [file.read(4).hex().upper() for _ in range(tiles_n)],[file.read(4).hex().upper() for _ in range(tiles_n)],[file.read(4).hex().upper() for _ in range(tiles_n)]
        tiles_list = []
        for i,(comp,var,set) in enumerate(zip(comps,vars,sets)):
            tile = Tile()
            tile.parts = list(zip(get_nibbles(comp),get_nibbles(var)))
            tile.floorset_id,tile.wallset_id,unk1,tile.floor_variant,tile.special_orientation,tile.special_group,unk2,tile.special_modifier = get_nibbles(set)
            #Get the names of the sets instead of the indices.
            # tile.floorset,tile.wallset = floorsets.get(floorset,floorsets[0]),wallsets.get(wallset,wallsets[0])
            tiles_list.append(tile)
        # tiles_arr = np.asarray(tiles_list).reshape((dim_x,dim_y))
        tiles_arr = np.asarray(tiles_list).reshape((dim_y,dim_x))
        # print(f'\tFinished reading tilechunk @ {hex(file.tell())}')
        return TileChunk(wallsets = list(wallsets.values()), floorsets = list(floorsets.values()), 
                         scale = scale, tiles_arr = tiles_arr)
    def mirror_x(self) -> None:
        print(f'Mirroring the X axis of the tilemap...')
        self.tiles_arr = np.flip(self.tiles_arr,0)
        print(self.tiles_arr)
        for tile in self.tiles_arr.flatten(): tile.mirror_x()
        print(self.tiles_arr)
    def mirror_y(self) -> None:
        print(f'Mirroring the Y axis of the tilemap...')
        tiles_arr = self.tiles_arr
        tiles_arr = np.flip(tiles_arr,1)
        for tile in tiles_arr.flatten(): tile.mirror_y()
        self.tiles_arr = tiles_arr

@dataclass(slots = True)
class Material:
    name: str         = field(default_factory = str)
    emission: Vector  = field(default_factory = Vector) #RGBA. Emission color for the material.
    diffuse:  Vector  = field(default_factory = Vector) #RGBA. Multiplies color values by this amount. 
    specular: Vector  = field(default_factory = Vector) #RGBA. Shine color? My best guess.
    unk2_vec: Vector  = field(default_factory = Vector) #RGBA. Ambient color.
    unk: str          = field(default_factory = str) #0x94 bytes long. A ton of parameters and I have no idea what they do.
    diffuse_map:  str = field(default_factory = str) 
    normal_map:   str = field(default_factory = str) 
    specular_map: str = field(default_factory = str) 
    emission_map: str = field(default_factory = str) 
    h_map:        str = field(default_factory = str)  #Height?
    r_map:        str = field(default_factory = str)  #Rougness?
    g_map:        str = field(default_factory = str)  #Gloss?
    hex:          str = field(default_factory = str)
    @classmethod
    def parse(cls, file: BufferedReader) -> Material:
        length = read_uints(file,1)
        start = file.tell()
        hex = file.read(length).hex()
        file.seek(start)
        name = read_name(file)
        emission,diffuse =  read_vector(file,4),read_vector(file,4)
        specular,unk2_vec = read_vector(file,4),read_vector(file,4)
        unk = file.read(0x94).hex().upper()
        diffuse_map,normal_map,specular_map,emission_map,h_map,r_map,g_map = '','','','','','',''
        while file.tell() - start < length:
            if unpack('<L',file.read(4))[0] == 0x30:
                texflag, = unpack('<L',file.read(4))
                imagename = read_name(file).lower()
                if imagename:
                    if   '.rfi' in imagename: image_type = imagename.replace('.rfi','')[-1]
                    elif '.dds' in imagename: image_type = imagename.replace('.dds','')[-1]
                    else: image_type = imagename[-1]
                    if   image_type == 'd': diffuse_map  = imagename
                    elif image_type == 'n': normal_map   = imagename
                    elif image_type == 's': specular_map = imagename
                    elif image_type == 'e': emission_map = imagename
                    elif image_type == 'h': h_map        = imagename
                    elif image_type == 'r': r_map        = imagename
                    elif image_type == 'g': g_map        = imagename
        file.seek(start + length)
        return Material(name = name, emission = emission, diffuse = diffuse, specular = specular, unk2_vec = unk2_vec,
                        unk = unk,
                        diffuse_map = diffuse_map, normal_map = normal_map, specular_map = specular_map, emission_map = emission_map,
                        h_map = h_map, r_map = r_map, g_map = g_map,
                        hex = hex)

def parse_materials(file: BufferedReader) -> list[Material]:
    length,mats_n = read_uints(file,2)
    mats = []
    for _ in range(mats_n):
        signature = read_uints(file,1)
        if signature != 0xBA01: raise ValueError(f'Found an invalid/unknown material ({hex(signature)}) @ {hex(file.tell()-4)}')
        mats.append(Material().parse(file))
    return mats

@dataclass(slots = True)
class NodeHeader:
    type:     int =    field(default_factory=int)
    start:    int =    field(default_factory=int)
    node_length: int =    field(default_factory=int)
    name:        str =    field(default_factory=str)
    flags:       int =    field(default_factory=int)
    objflag:     int =    field(default_factory=int)
    suppress:    int =    field(default_factory=int)    #Indicates which node it's a copy of, or if it's a "suppressed" version of a node.
    parent:      int =    field(default_factory=int)
    tmatrix:     Matrix = field(default_factory=Matrix)
    bbox_scale:  Vector = field(default_factory=Vector)
    bbox_pos:    Vector = field(default_factory=Vector)
    float_a:     int =    field(default_factory=int)    #Something...
    objint:      int =    field(default_factory=int)
    @classmethod
    def parse(cls, file: BufferedReader, rfc_sig: int, type: int, length: int) -> NodeHeader:
        start = file.tell() - 8
        name = read_name(file)
        flags,objflag,suppress,parent = read_uints(file,4)
        tmatrix = read_x_tmatrix(file)
        bbox_scale = read_vector(file) 
        bbox_pos   = read_vector(file)
        if rfc_sig == 0x3D23AFCF: float_a,objint = unpack('<f L', file.read(8)) #0x74 bytes long
        else: objint,float_a = read_uints(file,1),0 #0x70 Bytes long;
        return NodeHeader(start = start, type = type, node_length = length,
                          name = name, flags = flags, objflag = objflag, suppress = suppress, parent = parent,
                          tmatrix = tmatrix,
                          bbox_scale = bbox_scale, bbox_pos = bbox_pos,
                          float_a = float_a, objint = objint)

@dataclass(slots = True)
class XFace:
    # verts: list[Vector]
    verts:    list[int]    = field(default_factory = list) #Vertex indices. For reusing created verts.
    uvs:      list[Vector] = field(default_factory = list)
    # material: str          = field(default_factory = str)
    material_index: int    = field(default_factory = int)
    f_int:    int          = field(default_factory = int)
    f_flags:  int          = field(default_factory = int)

def parse_faces(file: BufferedReader, cmpverts: int, verts: list[Vector], uverts: list[Vector], edgemap: list[int], uvmap: list[int], materials: list[tuple[tuple[int,int,int],str]]) -> list[XFace]:
    length,null,faces_n = read_uints(file,3)
    faces_n += 1
    reading_func = read_ushorts if cmpverts < 0xFFFF else read_uints
    decoded_faces,mat_dict = [],{}
    for i,((ignored,start,stop),matname) in enumerate(materials): 
        for j in range(start,stop+1): mat_dict[j] = i
    for _ in range(faces_n):
        map_verts = reading_func(file,3)
        decoded_faces.append(XFace(verts          = [edgemap[index]  for index in map_verts],
                                   uvs            = [uverts[uvmap[index]]   for index in map_verts],
                                   material_index = mat_dict[map_verts[0]]))
    for _ in range(len(materials)): reminder = file.read(8) #Idk why this exists other than to restate the material ranges for each face.
    return decoded_faces
    # if cmpverts < 0xFFFF: faces = [read_ushorts(file,3) for i in range(faces_n)]
    # else:                 faces = [read_uints(file,3)   for i in range(faces_n)]
    # mat_dict = {}
    # for (ignored,start,stop),matname in materials: 
    #     for i in range(start,stop+1): mat_dict[i] = matname
    # decoded_faces = []
    # for indices in faces:
    #     decoded_faces.append(XFace(verts    = [verts[edgemap[index]]  for index in indices], 
    #                                uvs      = [uverts[uvmap[index]]   for index in indices], 
    #                                material = mat_dict[indices[0]]))
    # for _ in range(len(materials)): reminder = file.read(8) #Idk why this exists other than to restate the material ranges for each face.
    # return decoded_faces

def parse_faceints(file: BufferedReader, faces: list[XFace]) -> None:
    length = read_uints(file,1)
    for face in faces: face.f_int = read_ubytes(file,1)

def parse_faceflags(file: BufferedReader, faces: list[XFace]) -> None:
    length = read_uints(file,1)
    for face in faces: face.f_flags = read_uints(file,1)

@dataclass(slots = True)
class XCollision:
    active:   bool         = field(default = False)
    size:     float        = field(default_factory = float)
    points:   list[Vector] = field(default_factory = list)
    hex_data: str          = field(default_factory = str)
    @classmethod
    def parse(cls, file: BufferedReader, chunktag: int) -> XCollision:
        length = read_uints(file,1)
        start = file.tell()
        file.seek(start - 8)
        hex_data = file.read(length + 8).hex().upper()
        file.seek(start)
        if chunktag == 0x3D0CEC04: 
            null = file.read(4)
            voxels_n,size = read_uints(file,2)
        else: size,voxels_n = read_uints(file,2)
        points = [read_vector(file).xzy for _ in range(voxels_n)]
        return XCollision(active = True, size = size, points = points, hex_data = hex_data)

@dataclass(slots = True)
class PhysicsConstraint:
    flag:    int            = field(default_factory = int)
    vec_a:   Vector         = field(default_factory = Vector)
    vec_b:   Vector         = field(default_factory = Vector)
    floats:  list[float]    = field(default_factory = list)
    # float_a: float          = field(default_factory = float)
    # float_b: float          = field(default_factory = float)
    # float_c: float          = field(default_factory = float)
    vec_c:   Vector | None  = field(default_factory = bool)
    @classmethod
    def parse(cls, file: BufferedReader) -> PhysicsConstraint:
        flag = read_uints(file,1)
        vec_a,vec_b = read_vector(file,3),read_vector(file,3)
        # float_a,float_b,float_c = read_floats(file,3)
        floats = read_floats(file,3)
        if flag & 4 != 0: vec_c = read_vector(file,3)
        else: vec_c = None
        return PhysicsConstraint(flag = flag, vec_a = vec_a, vec_b = vec_b, floats = floats, vec_c = vec_c)
def parse_physconstraints(file: BufferedReader):
    length,constraints_n = unpack('<2L',file.read(8))
    return [PhysicsConstraint.parse(file) for _ in range(constraints_n)]

def calculate_centroid(positions: list[Vector]) -> Vector:
    total = Vector((0,0,0))
    for pos in positions: total += pos
    return total / len(positions)

def calculate_inertia_tensor(masses_and_points: list[tuple[Vector,float]]) -> Matrix:
    total_mass = sum(mass for pos, mass in masses_and_points)
    center_of_mass = Vector(sum(mass * pos for pos, mass in masses_and_points) / total_mass)
    Ixx,Iyy,Izz = 0,0,0 #Moments  of inertia
    Ixy,Iyz,Ixz = 0,0,0 #Products of inertia
    for pos,mass in masses_and_points:
        r_x,r_y,r_z = pos - center_of_mass #Position relative to centroid
        Ixx += mass * (r_y**2 + r_z**2)
        Iyy += mass * (r_x**2 + r_z**2)
        Izz += mass * (r_x**2 + r_y**2)
        Ixy -= mass * r_x * r_y
        Iyz -= mass * r_y * r_z
        Ixz -= mass * r_x * r_z
    return Matrix(([Ixx,Ixy,Ixz],
                   [Ixy,Iyy,Iyz],
                   [Ixz,Iyz,Izz]))

@dataclass(slots = True)
class XPhysics:
    active:         bool                    = field(default = False)
    unk_int:        int                     = field(default_factory = int)
    density:        float                   = field(default_factory = float)
    inertia_points_and_masses: list[tuple[Vector,float]] = field(default_factory = list)
    inertia_tensor: Matrix                  = field(default_factory = Matrix)
    unk_vec:        Vector                  = field(default_factory = Vector)
    unk:            str                     = field(default_factory = str)
    spheres:        list[Vector]            = field(default_factory = list)
    constraints:    list[PhysicsConstraint] = field(default_factory = list)
    hex_data:       str                     = field(default_factory = str)
    @classmethod
    def parse(cls, file: BufferedReader) -> XPhysics:
        tetra_length = read_uints(file,1)
        start = file.tell()
        file.seek(start - 8) #Store the original stuff because why not
        hex_data = file.read(tetra_length + 8).hex().upper()
        file.seek(start)
        unk_int,density = read_uints(file,2)
        inertia_points_and_masses = list(zip([read_vector(file,3).xzy for _ in range(4)],read_floats(file,4)))
        inertia_tensor = calculate_inertia_tensor(masses_and_points = inertia_points_and_masses)
        unk = file.read(0x14).hex().upper()
        spheres,constraints = [],[]
        while file.tell()-start < tetra_length:
            tflag = read_uints(file,1)
            if tflag == 0xCD00: #Collision spheres
                length,null,spheres_n = read_uints(file,3)
                            #Position,              Size
                spheres = [(read_vector(file,3).xzy,read_floats(file,1)) for i in range(spheres_n)]
            elif tflag == 0xDDB0: #Constraints
                constraints = parse_physconstraints(file)
        return XPhysics(active = True, unk_int = unk_int, density = density, 
                        inertia_points_and_masses = inertia_points_and_masses, inertia_tensor = inertia_tensor, 
                        unk = unk, 
                        spheres = spheres, 
                        constraints = constraints,
                        hex_data = hex_data)

@dataclass(slots = True)
class XSoftBody:
    active: bool = field(default = False)
    data:   str  = field(default_factory = str)
    @classmethod
    def parse(cls, file: BufferedReader) -> XSoftBody:
        length = read_uints(file,1)
        data = file.read(length).hex().upper()
        return XSoftBody(active = True, data = data)

@dataclass(slots = True)
class MeshUnkChunk1:
    active: bool       = field(default = False)
    int1: int          = field(default_factory = int)
    int2: int          = field(default_factory = int)
    int3: int          = field(default_factory = int)
    unks: list[Vector] = field(default_factory = list)
    @classmethod
    def parse(cls, file: BufferedReader) -> MeshUnkChunk1:
        length, start = read_uints(file,1),file.tell()
        int1,int2,int3,unks_n = read_uints(file,4)
        unks = [read_vector(file,4) for _ in range(unks_n+1)]
        return MeshUnkChunk1(int1 = int1, int2 = int2, int3 = int3, unks = unks)

@dataclass(slots = True)
class XMesh:
    type: str = field(default = 'MESH')
    # verts:        list[Vector]
    # uverts:       list[Vector]        | None
    # vert_colors:  list[list[float]]   | None
    # bone_weights: list[list[float]]   | None
    # materials:    list[(int,int,str)]
    # edgemap:      list[int]           | None
    # uvmap:        list[int]           | None
    # unkmap:       list[int]           | None
    geomflag:       int           = field(default_factory = int)
    materials:      list[str]     = field(default_factory = list)
    verts:          list[Vector]  = field(default_factory = list)
    faces:          list[XFace]   = field(default_factory = list)
    collision:      XCollision    = field(default_factory = bool)
    physics:        XPhysics      = field(default_factory = bool)
    softbody:       XSoftBody     = field(default_factory = bool)
    unkchunk1:      MeshUnkChunk1 = field(default_factory = bool)
    @classmethod
    def parse(cls, file: BufferedReader, header: NodeHeader) -> XMesh:
        # print(f'Reading mesh @ {hex(file.tell)}')
        geomflag, vgroups = read_uints(file,2)
        vgroups += 1
        verts,uverts,vert_colors,bone_weights = None,None,None,None
        prev_vtype,prev_vstart = 0,0
        for _ in range(vgroups):
            vflag,vtype,verts_n = read_uints(file,3)
            verts_n += 1
            vstart = file.tell()
            # print(f'Found vertex type {hex(vtype)}')
            if vtype & 0xFF0000 == 0xF30000:   verts =  [read_vector(file,3).xzy for __ in range(verts_n)]
            elif vtype & 0xFF0000 == 0xF20000: uverts = [read_vector(file,2)     for __ in range(verts_n)]
            #These last two options were taken from Inuk's drinkyrfc.
            elif vtype & 0xFF0000 == 0xB40000: vert_colors =  [unpack(f'<{verts_n}L', file.read(4*verts_n))]
            elif vtype & 0xFF0000 == 0xA40000: bone_weights = [unpack('<4L4f', file.read(4*4 + 4*4)) for __ in range(verts_n)]
            else: raise Exception(f'Found an unknown vertex type ({hex(vtype)}) @ {hex(file.tell()-8)}. Previous vert type was ({hex(prev_vtype)}) @ {hex(prev_vstart)}')
            prev_vtype,prev_vstart = vtype,vstart
        vrtmapstag,vrtmapslength = read_uints(file,2)
        assert vrtmapstag == 0x3DC0, f'Invalid facechunk flag @ {hex(file.tell()-8)}'
        null,cmpverts,materials_n = read_uints(file,3) #cmpverts = combined vert
        cmpverts += 1; materials_n += 1 #Stores one more than what's defined for some reason.
        materials = [(read_uints(file,3),read_name(file)) for _ in range(materials_n)]
        vrtmaps_n = read_uints(file,1)
        vrtmaps_n += 1
        edgemap,uvmap,unkmap = None,None,None
        for _ in range(vrtmaps_n):
            vm_start = file.tell()
            vmflag = read_uints(file,1)
            if cmpverts < 0xFFFF: vmdata = unpack(f'<{cmpverts}H', file.read(2*cmpverts))
            else: vmdata = unpack(f'<{cmpverts}L', file.read(4*cmpverts))
            if vmflag == 0x10001 or vmflag == 0x01:   edgemap = vmdata
            elif vmflag == 0x10010 or vmflag == 0x10: uvmap = vmdata
            elif vmflag == 0x2:                       unkmap = vmdata #idk
            else: raise ValueError(f'Found an unknown vertex map flag ({hex(vmflag)}) @ {hex(vm_start)}')
        faces,physics,collision,softbody,unkchunk1 = [],None,None,None,None
        while file.tell() - header.start < header.node_length:
            chunktag = read_uints(file,1)
            # print(f'Found chunktag ({hex(chunktag)})')
            if   chunktag == 0x3DC1:                  faces = parse_faces(file,cmpverts,verts,uverts,edgemap,uvmap,materials)
            #These typically come after the face chunk... It's fine to do this here even though it should be done in the "parse_faces" function
            elif chunktag & 0xFF0F == 0x3D02:         parse_faceints(file,faces)
            elif chunktag & 0xFF0F == 0x3D03:         parse_faceflags(file,faces) #Could be 0x3DC3
            #At the very end
            elif chunktag & 0xFFFFFF00 == 0x3DD0B000: physics   = XPhysics.parse(file)
            elif chunktag & 0xFFFFFF00 == 0x3D0CEC00: collision = XCollision.parse(file,chunktag)
            elif chunktag & 0xFFFFFF00 == 0x3DD0C000: softbody  = XSoftBody.parse(file)
            elif chunktag == 0x3AC1:                  unkchunk1 = MeshUnkChunk1.parse(file)
            else: raise ValueError(f'Found an unknown mesh chunk ({hex(chunktag)}) @ {hex(file.tell())}')
            # print(f'\tStopped reading chunk @ {hex(file.tell())}')
        #Only need to store the names of the materials since the faces have the material indices on them.
        return XMesh(geomflag = geomflag, materials = [mat[1] for mat in materials], verts = verts, faces = faces, collision = collision, physics = physics, softbody = softbody, unkchunk1 = unkchunk1)

@dataclass(slots = True)
class XLight:
    type: str = field(default = 'LIGHT')
    light_type: str = field(default_factory = str)
    flag:       int    = field(default_factory = int)
    color:      Vector = field(default_factory = Vector)
    alpha:      float  = field(default_factory = float)
    brightness: float  = field(default_factory = float)
    distance:   float  = field(default_factory = float)
    radius:     float  = field(default_factory = float) #?
    soften:     float  = field(default_factory = float)
    spotcut:    float  = field(default_factory = float)
    spotsoft:   float  = field(default_factory = float)
    unk:        str    = field(default_factory = str)
    @classmethod
    def parse(cls, file: BufferedReader, header: NodeHeader) -> XLight:
        light_type = 'POINT'
        if header.suppress == 0:
            flag = read_uints(file,1)
            color = read_vector(file,3)
            ignored = file.read(4)
            alpha,brightness,distance,radius,soften = read_floats(file,5)
            if header.objflag == 0x140200: #0x140200
                light_type = 'SPOT'
                spotcut,spotsoft = read_floats(file,2)
            else: spotcut,spotsoft = 0,0
            #Animation stuff
            if flag & 0x30000 != 0: unk = file.read(header.node_length-152).hex().upper()
            else: unk = ''
            return XLight(light_type = light_type, flag = flag, color = color, alpha = alpha, brightness = brightness, distance = distance, radius = radius, soften = soften, spotcut = spotcut, spotsoft = spotsoft, unk = unk)
        else: return XLight()

@dataclass(slots = True)
class XEffect:
    type: str = field(default = 'EFFECT')
    effect_type: int = field(default_factory = int)
    intensity:   int = field(default_factory = int)
    @classmethod
    def parse(cls, file: BufferedReader, header: NodeHeader) -> XEffect:
        if header.flags == 0x0 or header.flags == 0x10009: effect_type,type_length,intensity = unpack('<2L f', file.read(12))
        else: effect_type,intensity = None,None
        return XEffect(effect_type = effect_type, intensity = intensity)

@dataclass(slots = True)
class XVoxelLight:
    type:     str    = field(default = 'VOXEL_LIGHT')
    color:    Vector = field(default_factory = Vector)
    alpha:    float  = field(default_factory = float)
    distance: float  = field(default_factory = float)
    @classmethod
    def parse(cls, file: BufferedReader, header: NodeHeader) -> XVoxelLight:
        ignored = file.read(4)
        color = read_vector(file,3)
        ignored = file.read(4)
        alpha,distance = read_floats(file,2)
        ignored = file.read(4)
        return XVoxelLight(color = color, alpha = alpha, distance = distance)

node_dict = {
    0x3D03 : XMesh,
    0x3D06 : XLight,
    0x3D01 : XEffect,
    0x3D0C : XVoxelLight,
}

@dataclass(slots = True)
class Node:
    rfc_name: str                                           = field(default_factory = str)
    header:   NodeHeader                                    = field(default_factory = NodeHeader)
    data:     XMesh | XLight | XEffect | XVoxelLight | None = field(default_factory = bool)
    @classmethod
    def parse(cls, file: BufferedReader, rfc_sig: int, rfc_name: str) -> Node:
        type,length = read_uints(file,2)
        header = NodeHeader.parse(file = file, rfc_sig = rfc_sig, type = type, length = length)
        if not header.suppress: data = node_dict[type].parse(file = file, header = header)
        else:                   data = None
        return Node(rfc_name = rfc_name, header = header, data = data)

def parse_nodes(file: BufferedReader, rfc_sig: int, rfc_name: str) -> list[Node]:
    length,nodes_n = read_uints(file,2)
    return [Node.parse(file,rfc_sig,rfc_name) for _ in range(nodes_n)]

# @dataclass(slots = True)
# class SubNode:
#     type:    int    = field(default_factory = int)
#     int_1:   int    = field(default_factory = int)
#     name:    str    = field(default_factory = str)
#     int_2:   int    = field(default_factory = int)
#     tmatrix: Matrix = field(default_factory = Matrix)
#     int_3:   int    = field(default_factory = int)
#     flag:    int    = field(default_factory = int)
#     @classmethod
#     def parse(cls, file: BufferedReader, type: int) -> SubNode:
#         int_1,int_2,int_3,flag = None,None,None,None
#         if type == 0x3DE0EC00:
#             int_1,name = read_uints(file,1), read_name(file)
#             int_2,tmatrix,int_3 = read_uints(file,1), read_x_tmatrix(file), read_uints(file,1)
#         elif type == 0x3DE0ECAC:
#             name,flag,tmatrix = read_name(file), read_uints(file,1), read_x_tmatrix(file)
#         return SubNode(type = type,
#                     int_1 = int_1,
#                     name = name,
#                     int_2 = int_2,
#                     tmatrix = tmatrix,
#                     int_3 = int_3,
#                     flag = flag)
# def parse_subnodechildren(file: BufferedReader, type: int) -> list[SubNode]:
#     length, = read_uints(file,1)
#     start = file.tell()
#     ini_int, = read_uints(file,1)
#     childamount = (length - 8)//76
#     children = [SubNode.parse(file,type) for _ in range(childamount)]
#     end_int, = unpack('<L',file.read(4))
#     return children

@dataclass(slots = True)
class SubNode:
    type: int
    int_1: int | None
    name: str
    int_2: int | None
    tmatrix: Matrix
    int_3: int | None
    flag: int  | None
def parse_subnode(file: BufferedReader, type: int) -> SubNode:
    type = type
    int_1,int_2,int_3,flag = None,None,None,None
    if type == 0x3DE0EC00:
        int_1, = unpack('<L',file.read(4)); name = file.read(16).rstrip(b"\0").decode("ascii",errors='ignore').lower()
        int_2, = unpack('<L',file.read(4)); tmatrix = xmtom(unpack('<12f', file.read(4*12))); int_3, = unpack('<L',file.read(4))
    elif type == 0x3DE0ECAC:
        name = file.read(16).rstrip(b"\0").decode("ascii",errors='ignore').lower()
        flag = unpack('<L',file.read(4))
        tmatrix = xmtom(unpack('<12f', file.read(4*12)))
    return SubNode(type = type,
                   int_1 = int_1,
                   name = name,
                   int_2 = int_2,
                   tmatrix = tmatrix,
                   int_3 = int_3,
                   flag = flag)
def parse_subnodechildren(file: BufferedReader, type: int) -> list[SubNode]:
    length, = unpack('<L',file.read(4)); start = file.tell()
    ini_int, = unpack('<L',file.read(4))
    childamount = (length - 8)//76
    children = [parse_subnode(file,type) for _ in range(childamount)]
    end_int, = unpack('<L',file.read(4))
    return children

@dataclass(slots = True)
class SubNodeV2:
    name:     str
    flag:     int 
    tmatrix:  Matrix
    children: list[SubNodeV2]
    @classmethod
    def parse(cls, file: BufferedReader, recursion: int = 0) -> SubNodeV2:
        # When this function is originally called, the signature is already read. 
        # Need to read the signature on recursive classes.
        if recursion:
            signature,length = read_uints(file,2)
            if signature != 0x3DE0ECAC: raise Exception(f'Signature ({hex(signature)}) is not a SubNodeV2 @ {hex(file.tell()-8)}')
        else:
            length = read_uints(file,1)
        start  = file.tell()
        name, flag, tmatrix  = read_name(file), read_uints(file,1), read_x_tmatrix(file)
        children = []
        while file.tell() - start < length:
            children.append(SubNodeV2.parse(file = file, recursion = recursion + 1))
        return SubNodeV2(name = name,
                         flag = flag,
                         tmatrix = tmatrix,
                         children = children)

@dataclass(slots = True)
class SoftBodySubNode:
    name: str
    flag: int
    #Positions to move the corresponding vertex to. Or its the displacement, not sure yet.
    #Something like this: vert[i].co = vert_cos[i]
    vert_coords: list[Vector] 
    @classmethod
    def parse(cls, file: BufferedReader, type: int) -> SoftBodySubNode:
        length = read_uints(file,1)
        name = read_name(file)
        flag,verts_n = read_uints(file,2)
        vert_coords = [read_vector(file,3).xzy for _ in range(verts_n)]
        return SoftBodySubNode(name = name, flag = flag, vert_coords = vert_coords)

def read_subnodes(file: BufferedReader, start: int, length: int) -> list[SubNodeV2 | SubNode | SoftBodySubNode]:
    subnodes = []
    #Will immediately end if beyond the size of the placed item, dont need logic to prevent this from running.
    while file.tell() - start < length:
        subnode_sig = read_uints(file,1)
        if subnode_sig == 0x3DE0EC00: #Old format, implies all subnodes are in a single chunk
            subnodes = parse_subnodechildren(file,subnode_sig)
            break
        elif subnode_sig == 0x3DE0ECAC:
            subnodes.append(SubNodeV2.parse(file))
        elif subnode_sig == 0x3DE0ECDB:
            subnodes.append(SoftBodySubNode.parse(file,subnode_sig))
    return subnodes

@dataclass(slots = True)
class Prop:
    flag: int       = field(default_factory = int)
    model_name: str = field(default_factory = str)
    tmatrix: Matrix = field(default_factory = Matrix)
    subnodes: list[SubNodeV2 | SubNode | SoftBodySubNode] = field(default_factory = list)
    @classmethod
    def parse(cls, file: BufferedReader) -> Prop:
        signature,length = read_uints(file,2)
        assert signature == 0x3DE10100, f'Found an invalid prop ({hex(signature)}) @ {hex(file.tell())}' 
        start = file.tell()
        # print(f'Reading prop @ ({hex(start)}) with length ({hex(length)})')
        # flag = read_uints(file,1)
        # model_name = read_name(file)
        # tmatrix = read_x_tmatrix(file)
        # null = file.read(8)
        # subnodes = read_subnodes(file,start,length)
        return Prop(flag = read_uints(file,1), 
                    model_name = read_name(file), 
                    tmatrix = read_x_tmatrix(file), 
                    subnodes = read_subnodes(file,start,length))

def parse_props(file: BufferedReader) -> list[Prop]:
    length,props_n = read_uints(file,2)
    return [Prop.parse(file) for _ in range(props_n)]

@dataclass(slots = True)
class PlacedItem:
    item_id:  int    = field(default_factory = int)
    item_db:  int    = field(default_factory = int)
    flag_1:   int    = field(default_factory = int)
    flag_2:   int    = field(default_factory = int)
    tmatrix:  Matrix = field(default_factory = Matrix)
    null:     str    = field(default_factory = str)
    subnodes: list[SubNodeV2 | SubNode | SoftBodySubNode] = field(default_factory = list)
    @classmethod
    def parse(cls, file: BufferedReader) -> PlacedItem:
        signature,length = read_uints(file,2)
        assert signature == 0xDB01, f'Found an invalid placed item ({hex(signature)}) @ {hex(file.tell()-8)}' 
        start = file.tell()
        # item_id,flag_1,flag_2 = read_uints(file,3)
        # tmatrix = read_x_tmatrix(file)
        # null = file.read(8)
        # subnodes = read_subnodes(file)
        return PlacedItem(*read_ushorts(file,2),
                          *read_uints(file,2),
                          read_x_tmatrix(file),
                          file.read(8),
                          read_subnodes(file,start,length))
        # return PlacedItem(item_id = item_id, flag_1 = flag_1, flag_2 = flag_2,
        #                   tmatrix = tmatrix,
        #                   subnodes = subnodes)

@dataclass(slots = True)
class PlacedChar:
    char_id: int       = field(default_factory = int)
    char_db: int       = field(default_factory = int) 
    pos: Vector        = field(default_factory = Vector)
    rot: float         = field(default_factory = float)
    state: int         = field(default_factory = int)
    pose: list[Matrix] = field(default_factory = list)
    @classmethod
    def parse(cls, file: BufferedReader, length: int) -> PlacedChar:
        # print(f'Parsing charloc @ {hex(file.tell())}')
        start = file.tell()
        char_id,char_db = read_ushorts(file,2)
        pos = read_vector(file,3).xzy
        rot, state = unpack('<f L',file.read(8))
        pose = None
        while file.tell() - start < length:
            chunk, = unpack('<L',file.read(4))
            if chunk == 0xCAC0E100:
                c_length, = unpack('<L',file.read(4))
                bones_n = c_length // 0x30
                pose = [read_x_tmatrix(file) for _ in range(bones_n)]
            elif chunk == 0xCAC0EA00: #Unknown
                c_length, = unpack('<L',file.read(4))
                data = file.read(c_length)
            elif chunk == 0: break
            else: raise Exception(f'Found unknown loc chunk ({hex(chunk)})')
        return PlacedChar(char_id = char_id, char_db = char_db, pos = pos, rot = rot, state = state, pose = pose)

@dataclass(slots = True)
class Database:
    file: BufferedReader
    itemdb:   dbs.ItemDB   | None  = field(default = None)
    stringdb: dbs.StringDB | None  = field(default = None)
    chardb:   dbs.CharDB   | None  = field(default = None)
    placed_items: list[PlacedItem] = field(default_factory = list)
    placed_chars: list[PlacedChar] = field(default_factory = list)
    def get_itemdb(self, file: BufferedReader) -> None:
        # print(f'\t\tGetting item db...')
        self.itemdb = dbs.ItemDB.parse(file)
    def get_stringdb(self, file: BufferedReader) -> None:
        # print(f'\t\tGetting string db...')
        self.stringdb = dbs.StringDB.parse(file)
    def parse_placed_items(self, file: BufferedReader) -> None:
        # print(f'\t\tGetting placed items...')
        p_items_n = read_uints(file,1)
        self.placed_items = [PlacedItem.parse(file) for _ in range(p_items_n)]
    def get_chardb(self,file: BufferedReader) -> None:
        # print(f'\t\tGetting char db...')
        self.chardb = dbs.CharDB.parse(file)
    def populate_item_stuffs(self, file: BufferedReader) -> None:
        size = read_uints(file,1)
        start = file.tell()
        while file.tell() - start < size:
            db_sig,sub_length = read_uints(file,2)
            sub_start = file.tell()
            # print(f'\tFound db sig ({hex(db_sig)}) @ {hex(file.tell()-8)}')
            if   db_sig == 0xDBDB: self.get_itemdb(file)
            elif db_sig == 0xDBCD: self.get_stringdb(file)
            elif db_sig == 0xDBCE: self.parse_placed_items(file)
            else: raise ValueError(f'Found an unknown item database signature ({hex(db_sig)}) @ {hex(file.tell()-4)}')
            #It doesnt fully parse the databases... except for the placed items, so it needs to jump to where the next database should be.
            #Should only store things that have been or will be used. Dont parse the entire thing, only parse when looking up items and if they're not known.
            file.seek(sub_start + sub_length)
    def populate_char_stuffs(self, file: BufferedReader) -> None:
        size,chars_n = read_uints(file,2)
        start = file.tell() - 4
        while file.tell() - start < size:
            db_sig,sub_length = read_uints(file,2)
            sub_start = file.tell()
            # print(f'\tFound db sig ({hex(db_sig)}) @ {hex(file.tell()-8)}')
            if   db_sig == 0xCECDDB00: self.get_chardb(file)
            elif db_sig == 0xCAC0CA00: self.placed_chars.append(PlacedChar.parse(file,sub_length))
            else: raise ValueError(f'Found an unknown character database signature ({hex(db_sig)}) @ {hex(file.tell()-4)}')
            #This script doesnt fully parse the character db (unless you tell it to) and it will stop at the end of the lookup table.
            #Jump to the next chunk's expected position. 
            file.seek(sub_start + sub_length)

@dataclass(slots = True)
class EnvMap:
    #A lot of unknown stuff.
    data: str = field(default_factory=str)
    @classmethod
    def parse(cls, file: BufferedReader) -> EnvMap:
        return EnvMap(data = file.read(read_uints(file,1)).hex().upper())

@dataclass(slots = True)
class RFC:
    name:              str                   = field(default_factory = str)
    tilechunk:         TileChunk             = field(default = None)
    materials:         list[Material]        = field(default_factory = list)
    nodes:             list[Node]            = field(default_factory = list)
    props:             list[Prop]            = field(default_factory = list)
    database:          Database              = field(default = None)
    envmap:            EnvMap                = field(default = None)
    @classmethod
    def parse(cls, file: BufferedReader, signature: int, size: int, name: str) -> RFC:
        start = file.tell()
        size -= 4 #Size includes rfc signature. Discard that amount since it's already been read.
        tilechunk,materials,nodes,props,envmap = None,[],[],[],None
        database = Database(file = file)
        while file.tell() - start < size:
            chunk_signature = read_uints(file,1)
            # print(f'Found RFC chunk with signature ({hex(chunk_signature)}) @ {hex(file.tell()-4)}')
            if   chunk_signature == 0x3DED:     tilechunk   = TileChunk.parse(file)
            elif chunk_signature == 0xBA00:     materials = parse_materials(file)
            elif chunk_signature == 0x3D000000: nodes     = parse_nodes(file = file, rfc_sig = signature, rfc_name = name)
            elif chunk_signature == 0x3DE10000: props     = parse_props(file)
            elif chunk_signature == 0xDBC0:     database.populate_item_stuffs(file) #populate_item_stuffs(database,file)
            elif chunk_signature == 0xCAC00001: database.populate_char_stuffs(file) #populate_char_stuffs(database,file)
            elif chunk_signature == 0xEC00DC00: envmap    = EnvMap.parse(file)
            else: raise ValueError(f'Found an unknown rfc chunk ({hex(chunk_signature)}) @ {hex(file.tell()-4)}')
        return RFC(name = name, tilechunk = tilechunk, materials = materials, nodes = nodes, props = props, database = database, envmap = envmap)

@dataclass(slots = True)
class RPK:
    file:        BufferedReader = field(default = None)
    name:        str            = field(default = str)
    version:     int            = field(default = int)
    lookup_dict: dict[str,tuple[int,int,int,int]] = field(default_factory = dict)
    data_start:  int                              = field(default_factory = int)
    @classmethod
    def parse(cls, file_path: str = '', file: BufferedReader = None, signature: int = 0xAFBF0C01, size: int = 0, name: str = '') -> RPK:
        if file_path and file: raise Exception(f'Parsing an RPK requires either a filepath ({file_path}) or a file ({file})! Not both!')
        if file_path: 
            file = open(file_path,'rb')
            signature,length = read_uints(file,2)
        else: length = read_uints(file,1)
        if signature & 0xFFFFFF00 != 0xAFBF0C00: raise Exception(f'The file {file_path} or signature {hex(signature)} is not a RPK!')
        return RPK(file = file,
                   name = name,
                   version = signature & 0x000000FF,
                   lookup_dict = {read_name(file):read_uints(file,4) for _ in range(length//0x20)},
                   data_start = file.tell())
    def parse_entry(self, entry_name: str, exception_toggle: bool = True) -> RFC | None:
        entry_name = entry_name.lower()
        entry = self.lookup_dict.get(entry_name)
        if   not entry.any() and exception_toggle:     raise Exception(f'RPK {self.file.name} does not contain entry ({entry_name})')
        elif entry.any()     and not exception_toggle: return None
        else: 
            offset,size,null,id = entry
            file = self.file
            file.seek(offset + self.data_start)
            #parse_file is defined later because the classes need initialized for the dict it uses.
            return parse_file(file = file, size = size, name = entry_name)

@dataclass(slots = True)
class RML:
    file:        BufferedReader
    name:        str
    version:     int
    lookup_dict: dict[str,tuple[int,int,int,int]] = field(default_factory = dict)
    data_start:  int                              = field(default_factory = int)
    @classmethod
    def parse(cls, file_path: str = '', file: BufferedReader = None, signature: int = 0xAFBF0C01, size: int = 0, name: str = '') -> RPK:
        if file_path and file: raise Exception(f'Parsing an RPK requires either a filepath ({file_path}) or a file ({file})! Not both!')
        if file_path: 
            file = open(file_path,'rb')
            signature,length = read_uints(file,2)
        else: length = read_uints(file,1)
        if signature & 0xFFFFFF00 != 0xAFBF0C00: raise Exception(f'The file {file_path} or signature {hex(signature)} is not a RML!')
        return RPK(file = file,
                   name = name,
                   version = signature & 0x000000FF,
                   lookup_dict = {read_name(file):read_uints(file,4) for _ in range(length//0x20)},
                   data_start = file.tell())
    def parse_mat_entry(self, mat_name: str, exception_toggle: bool = True) -> Material:
        entry = self.lookup_dict.get(mat_name)
        if   not entry.any() and exception_toggle:     raise Exception(f'RML {self.file.name} does not contain entry ({mat_name})')
        elif not entry.any() and not exception_toggle: return None
        
def get_rpk(rfp_dir: str, name: str) -> RPK:
    return RPK.parse(file_path = os.path.join(rfp_dir,name + '.rpk'), name = name)

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

@dataclass(slots = True)
class RFP: #Project
    dir:          str       = field(default_factory = str)
    name:         str       = field(default_factory = str)
    flags:        int       = field(default_factory = int)
    string:       str       = field(default_factory = str) #idk what this is
    resource:     RPK       = field(default_factory = RPK)
    objlib_rpks:  list[RPK] = field(default_factory = list)
    texture_rpks: list[RPK] = field(default_factory = list)
    rml_paths:    list[str] = field(default_factory = list)
    rmls:         list[RPK] = field(default_factory = list)
    objects:      RPK       = field(default = None) #World models for items
    database:     Database  = field(default = None)
    factories:    RPK       = field(default = None) #Procedural weapon instructions
    components:   RPK       = field(default = None) #Factory components
    races:        list[str] = field(default = list) 
    characters:   RPK       = field(default = None) #Apparel models
    @classmethod
    def parse(cls, file_path: str) -> RFP:
        dir = os.path.dirname(file_path)
        print(f'RFP Directory is {dir}')
        file = open(file_path, 'rb')
        signature,flags = read_uints(file,2)
        assert signature == 0xAFDFBD10, f'Provided file {dir} is not a RFP'
        return RFP(dir          =  dir,
                   name         =  read_name(file),
                   string       =  read_string(file),
                   resource     =  get_rpk(rfp_dir = dir, name = read_string(file)),
                   objlib_rpks  = [get_rpk(rfp_dir = dir, name = read_string(file)) for _ in range(read_uints(file,1))],
                   texture_rpks = [get_rpk(rfp_dir = dir, name = read_string(file)) for _ in range(read_uints(file,1))],
                   rml_paths    = [read_string(file).lower() for _ in range(read_uints(file,1))])
    def get_rpk_by_name(self, name: str) -> RPK:
        if name == 'resource': return self.resource
        else:
            for rpk in self.objlib_rpks:
                if rpk.name == name: 
                    return rpk
            else:
                for rpk in self.texture_rpks:
                    if rpk.name == name:
                        return rpk
                else: raise Exception(f'Unable to find rpk ({name}) in rfp {self.name}')
    def get_universal_db(self) -> Database:
        resource = self.resource
        objdb_entry,objstrings_entry = resource.lookup_dict.get('objdb.rdb'),resource.lookup_dict.get('objstrings.rdb')
        file = resource.file
        uni_db = Database(file = file)
        if objdb_entry.any():
            offset,size,null,id = objdb_entry
            file.seek(resource.data_start + offset)
            uni_db.itemdb = dbs.ItemDB.parse(file)
        if objstrings_entry.any():
            offset,size,null,id = objstrings_entry
            file.seek(resource.data_start + offset)
            uni_db.stringdb = dbs.StringDB.parse(file)
        return uni_db
    def __post_init__(self) -> None:
        resource = self.resource
        for rml_path in self.rml_paths:
            rpk_name,rml_name = rml_path.split('\\')
            rpk = self.get_rpk_by_name(rpk_name)
            self.rmls.append(rpk.parse_entry(rml_name))
        self.objects    = RPK.parse(file_path = os.path.join(self.dir,'objects.rpk'))
        self.database   = self.get_universal_db()
        self.factories  = RPK.parse(file_path = os.path.join(self.dir,'factories.rpk'))
        self.components = RPK.parse(file_path = os.path.join(self.dir,'components.rpk'))
        self.races      = get_races(exe_dir = os.path.join(self.dir,'exanima.exe'))
        self.characters = RPK.parse(file_path = os.path.join(self.dir,'characters.rpk'))

@dataclass(slots = True)
class FactoryMaterial:
    name:    str                    = field(default_factory = str)
    options: tuple[int,int,int,int] = field(default_factory = list)
    mat_int: int                    = field(default_factory = int)
    spacer:  int                    = field(default_factory = int)
    @classmethod
    def parse(cls, file: BufferedReader) -> FactoryMaterial:
        return FactoryMaterial(name    = read_name(file),
                               options = [read_ubytes(file,4) for _ in range(8)],
                               mat_int = read_uints(file,1),
                               spacer  = read_uints(file,1))

@dataclass(slots = True)
class FactoryDeformStats:
    settings:    tuple[int,int,int,int]
    variability: float
    start:       float
    stop:        float
    @classmethod
    def parse(cls, file: BufferedReader) -> FactoryDeformStats:
        return FactoryDeformStats(read_ubytes(file,4),
                                  *read_floats(file,3))

@dataclass(slots = True)
class FactoryComponent:
    name: str
    material_ids: tuple[int,int,int,int]
    unk1: int
    unk2: int
    unk3: int
    stats: tuple[int,int,int,int,int,int,int,int]
    @classmethod
    def parse(cls, file: BufferedReader) -> FactoryComponent:
        return FactoryComponent(read_name(file),
                                read_ubytes(file,4),
                                *read_uints(file,3),
                                read_ubytes(file,8))

@dataclass(slots = True)
class FactorySection:
    flags: int
    name:  str
    # location:  Vector
    # rotation:  Vector
    # scale:     Vector
    tmatrix: Matrix
    uv_offset: Vector
    uv_scale:  Vector
    uv_rotation: float
    taper_stats:  FactoryDeformStats | None
    length_stats: FactoryDeformStats | None
    curve_stats:  FactoryDeformStats | None
    chance: int
    parent: int
    f_type: int
    components: list[FactoryComponent]
    unk: str
    @classmethod
    def parse(cls, file: BufferedReader, signature: int) -> FactorySection:
        flags = read_uints(file,1)
        name  = read_name(file)
        tmatrix   = Matrix.LocRotScale(read_vector(file,3).xzy,
                                       read_euler(file,3), 
                                       read_vector(file,3).xzy)
        uv_offset   = read_vector(file,2)
        uv_scale    = read_vector(file,2)
        uv_rotation = read_floats(file,1)
        if signature == 0xAFCE0F00: 
            taper_stats,length_stats,curve_stats = FactoryDeformStats.parse(file), FactoryDeformStats.parse(file), FactoryDeformStats.parse(file)
            unk = ''
        else:
            taper_stats,length_stats,curve_stats = None,None,None
            unk = file.read(0x54).hex().upper()
        chance,parent,f_type,null = read_ubytes(file,4)
        components = [FactoryComponent.parse(file) for _ in range(read_uints(file,1))]
        return FactorySection(flags = flags,
                              name = name,
                              tmatrix = tmatrix,
                              uv_offset = uv_offset, uv_scale = uv_scale, uv_rotation = uv_rotation,
                              taper_stats = taper_stats, length_stats = length_stats, curve_stats = curve_stats,
                              chance = chance, parent = parent, f_type = f_type,
                              components = components,
                              unk = unk)

@dataclass(slots = True)
class Factory:
    name:      str
    unk:       str
    unkints:   list[int]
    stuff:     list[int]
    materials: list[FactoryMaterial]
    sections:  list[FactorySection]
    modifiers: list[str]
    @classmethod
    def parse(cls, file_path: str = '', file: BufferedReader = None, signature: int = 0xAFBF0C01, size: int = 0, name: str = '') -> Factory:
        if file_path and file: raise Exception(f'Parsing an RPK requires either a filepath ({file_path}) or a file ({file})! Not both!')
        if file_path: 
            file = open(file_path,'rb')
            signature = read_uints(file,1)
        return Factory(name      = name,
                       unk       = file.read(0x18).hex().upper(),
                       unkints   = read_uints(file,2),
                       stuff     = [read_uints(file,2) for _ in range(read_uints(file,1))],
                       materials = [FactoryMaterial.parse(file) for _ in range(read_uints(file,1))],
                       sections  = [FactorySection.parse(file,signature)  for _ in range(read_uints(file,1))],
                       modifiers = [read_name(file) for _ in range(read_uints(file,1))])

signature_dict = {
    0x3D21AFCF: RFC,
    0x3D23AFCF: RFC,
    0xAFDFBD10: RPK,
    0xAFBF0C01: RML,
    0xAFCE0F00: Factory,
    0xAFCE0F01: Factory
}

def parse_file(file_path: str = '', file: BufferedReader = None, size: int = 0, name: str = '') -> RFC:
    #Need to be able to parse loose files or entries in an rpk.
    if file_path and file: raise Exception('Expected either a file path or a buffered reader, not both!')
    if file_path: #Loose file
        file = open(file_path, 'rb')
        signature = read_uints(file,1)
        return signature_dict[signature].parse(file = file, signature = signature, size = os.path.getsize(file_path), name = name)
    elif not size: raise Exception('Cannot use a file size of zero!') #If it's not a loose file, make sure the size isnt zero so there is something to parse.
    elif file and size: #RPK Entry
        signature = read_uints(file,1)
        return signature_dict[signature].parse(file = file, signature = signature, size = size, name = name) #RPK Entry.
    else: raise Exception(f'For some reason the parse file function wasnt able to parse anything! {file_path}, {file}, {hex(size)}')

if __name__ == '__main__':
    os.system('cls')
    file_path = r'C:\Program Files (x86)\Steam\steamapps\common\Exanima\Objects\door uw01b.rfc'
    rfc = parse_file(file_path = file_path)
    for node in rfc.nodes:
        print(node)