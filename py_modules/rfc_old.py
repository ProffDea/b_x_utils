from __future__ import annotations
import bpy,bmesh,os
from struct import unpack

from dataclasses import dataclass,field

import numpy as np

from _io import BufferedReader

from .. import parse_x as xp
from .. import image_funcs_new as i_fn
from .. import b_funcs as bf
from .. import xtb

from . import item_db as idb
from . import char_db as cdb

from typing import TYPE_CHECKING
if TYPE_CHECKING:
    from pbx import pbRFP

from mathutils import Vector, Matrix

library_path = os.path.join(os.path.expanduser("~"), "Documents", 'Exanima Assets.blend')

np_ubyte,np_ushort,np_uint  = np.dtype('<u1'),np.dtype('<u2'),np.dtype('<u4')

np_float  = np.dtype('<f')

def read_uints(file: BufferedReader, amount: int = 1) -> int | np.ndarray:
    if amount == 1: return np.frombuffer(file.read(4), dtype = np_uint)[0]
    return np.frombuffer(file.read(4*amount),dtype = np_uint)

def read_ushorts(file: BufferedReader, amount: int = 1) -> int | np.ndarray:
    if amount == 1: return np.frombuffer(file.read(2), dtype = np_ushort)[0]
    return np.frombuffer(file.read(2*amount),dtype = np_ushort)

def read_sshorts(file: BufferedReader, amount: int = 1) -> int | list[int]:
    if amount == 1: return unpack('<h',file.read(2))[0]
    else: return unpack(f'<{amount}h',file.read(amount*2))  

def read_ubytes(file: BufferedReader, amount: int = 1) -> int | np.ndarray:
    if amount == 1: return np.frombuffer(file.read(1), dtype = np_ubyte)[0]
    return [int(val) for val in np.frombuffer(file.read(amount),dtype = np_ubyte)]

def read_floats(file: BufferedReader, amount: int = 1) -> float | np.ndarray:
    if amount == 1: return np.frombuffer(file.read(4), dtype = np_float)[0]
    return np.frombuffer(file.read(4*amount),dtype = np_float)

def read_vector(file: BufferedReader, dims: int = 3) -> Vector:
    return Vector(read_floats(file,dims))

def xmtom(m) -> Matrix: # Exanima transformation matrix as a 4x4 matrix. Thanks, Inuk.
    return Matrix(((
        (m[0], m[6], m[3], m[9]),
        (m[2], m[8], m[5], m[11]),
        (m[1], m[7], m[4], m[10]),
        (0, 0, 0, 1))))

def read_x_tmatrix(file: BufferedReader) -> Matrix:
    return xmtom(read_floats(file,12))

def read_name(file: BufferedReader) -> str:
    return file.read(16).rstrip(b"\0").decode("ascii",errors='ignore')

def read_string(file: BufferedReader, string_length: int = 0) -> str:
    if not string_length: return file.read(read_uints(file,1)).decode("ascii",errors='ignore')
    else: return file.read(string_length).rstrip(b"\0").decode("ascii",errors='ignore')

def create_diffuse_shift_node(color: tuple[float,float,float,float], tree) -> bpy.types.ShaderNodeMix:
    shift_node = tree.nodes.new(type = 'ShaderNodeMix')
    shift_node.data_type = 'RGBA'
    shift_node.blend_type = 'MULTIPLY'
    shift_node.inputs[7].default_value = color
    return shift_node

image_type_dict = {
    0x20000: 'Diffuse', 0x400000: 'Diffuse',
    0x40000: 'Specular',
    0x80000: 'Emission',
    0x100000: 'Roughness',
    0x200000: 'Normal',
    0x800000: 'Height',
    0x1000000: 'Gloss',
    0x8000000: 'Dirt'
}

def add_tex_node_to_p_bsdf_node(image_type: str, bsdf_node, tex_node, shift_node, tree) -> None:
    if   image_type == 'Diffuse':  
        tree.links.new(tex_node.outputs['Color'],shift_node.inputs['A'])
        tree.links.new(shift_node.outputs['Result'],bsdf_node.inputs['Base Color'])
    elif image_type == 'Normal':   tree.links.new(tex_node.outputs['Color'],bsdf_node.inputs['Normal'])
    elif image_type == 'Emission': tree.links.new(tex_node.outputs['Color'],bsdf_node.inputs['Emission Strength'])
    elif image_type == 'Specular': tree.links.new(tex_node.outputs['Color'],bsdf_node.inputs[14])

def parse_and_build_material(rfp: pbRFP, file: BufferedReader, import_textures: bool = False, lite_mode: bool = False, rml_name: str = '', length: int = 0) -> bpy.types.Material:
    if not rml_name:
        sig,length = read_uints(file,2)
        start = file.tell()
        mat = bf.get_material(name = read_name(file))
    else: 
        start = file.tell()
        mat = bf.get_material(name = rml_name)
    if mat.name[0] == '_' or mat.name[0] == '&': mat.x_mat_type = 'Procedural'
    # Retaining old stuff.
    after_name = file.tell()
    file.seek(file.tell() - 0x10)
    mat.x_data = file.read(length).hex().upper()
    if lite_mode and not import_textures: return mat #Skip the nodification stuff if it doesnt need to do this, like in a prop.
    file.seek(after_name)
    #
    mat.use_nodes = True
    tree = mat.node_tree
    bsdf_node = mat.node_tree.nodes["Principled BSDF"]
    bsdf_node.inputs[27].default_value = read_vector(file,4) #Emission, color of light it emits from itself.
    bsdf_node.inputs[0].default_value  = read_vector(file,4) #Diffuse,  color reflected by object. Alters diffuse textures.
    bsdf_node.inputs[14].default_value = read_vector(file,4) #Specular, color of the shine.
    mat.x_ambient                      = read_vector(file,4) #Ambient,  color of object regardless of lighting... This doesnt exist on blender.
    bsdf_node.inputs[7].default_value  = 1 - read_floats(file,1) #Gloss -> Roughness in blender... 1-val
    mat.x_unkparams = file.read(0x74).hex().upper()
    # Adding the color changer and the thing that changes both the changer and the diffuse vec on the bsdf
    shift_node = tree.nodes.get('Mix') or create_diffuse_shift_node(color = bsdf_node.inputs[0].default_value, tree = tree)
    shift_node.inputs[7].default_value = bsdf_node.inputs[0].default_value
    shift_node.inputs[0].default_value = 1
    mat.x_diffuse = bsdf_node.inputs[0].default_value
    #
    # print(f'Started reading images @ {hex(file.tell())}')
    linked_image_names = [node.image.name for node in tree.nodes if type(node) is bpy.types.ShaderNodeTexImage and node.image]
    while file.tell() - start < length:
        image_type_int = read_uints(file,1)
        if image_type_int not in image_type_dict: raise Exception(f'Found an unknown image type, {hex(image_type_int)} @ {hex(file.tell()-4)} in {file.name}')
        image_type = image_type_dict[image_type_int]
        i_length = read_uints(file,1)
        unk_1 = read_uints(file,1)
        emission,diffuse,specular,ambient,gloss = read_floats(file,5)
        unk_2,unk_3 = read_uints(file,2)
        name = read_name(file).lower().replace('.rfi','').replace('.dds','')
        if lite_mode and image_type != 'Diffuse': continue #Skip anything that isnt the diffuse in the lite mode. Ignores creating the images, speeding it up
        if name not in linked_image_names:
            # x_tex = mat.x_textures.add()
            # x_tex.type,x_tex.emission,x_tex.diffuse,x_tex.specular,x_tex.ambient,x_tex.gloss,x_tex.name = image_type,emission,diffuse,specular,ambient,gloss,name
            if import_textures:
                # x_tex.image = bpy.data.images.get(name,i_f.get_image_from_rfp(rfp = rfp, entry_name = x_tex.name))
                # print(f'Attemptying to get image {name}')
                image = bpy.data.images.get(name,i_fn.get_image_from_rfp(rfp = rfp, entry_name = name))
                if image:
                    x_tex = image.x_params
                    x_tex.type,x_tex.emission,x_tex.diffuse,x_tex.specular,x_tex.ambient,x_tex.gloss,x_tex.name = image_type,emission,diffuse,specular,ambient,gloss,name
                    tex_node = tree.nodes.new(type = 'ShaderNodeTexImage')
                    tex_node.label = name
                    tex_node.image = image
                    add_tex_node_to_p_bsdf_node(image_type = x_tex.type, bsdf_node = bsdf_node, tex_node = tex_node, shift_node = shift_node, tree = tree)
    file.seek(start + length)
    return mat

def parse_and_build_materials(rfp: pbRFP, file: BufferedReader, import_textures: bool = False, lite_mode: bool = False) -> list[bpy.types.Material]:
    length,mats_n = read_uints(file,2)
    return [parse_and_build_material(rfp = rfp, file = file, import_textures = import_textures, lite_mode = lite_mode) for _ in range(mats_n)]

@dataclass(slots = True)
class MotionConstraint:
    type:      int           = field(default_factory = int)
    v1:        Vector        = field(default_factory = Vector)
    v2:        Vector        = field(default_factory = Vector)
    dist:      float         = field(default_factory = float)
    stiffness: float         = field(default_factory = float) #From [0,1], ?
    damping:   float         = field(default_factory = float) #From [0,1], ?
    v3:        Vector | None = field(default_factory = None)
    @classmethod
    def parse(cls, file: BufferedReader) -> MotionConstraint:
        dtype = read_uints(file,1)
        v1,v2 = read_vector(file,3).xzy,read_vector(file,3).xzy
        dist,stiffness,damping = read_floats(file,3)
        if dtype & 4 != 0: v3 = read_vector(file,3).xzy
        else: v3 = None
        return MotionConstraint(type = dtype, v1 = v1, v2 = v2, dist = dist, stiffness = stiffness, damping = damping, v3 = v3)

def parse_and_build_mesh(header: xp.NodeHeader, file: BufferedReader, flip_normals: bool, return_bmesh: bool = False) -> bpy.types.Mesh:
    bm = bmesh.new()
    # fs_layer = bm.faces.layers.int.new('Face Sets')
    # fp_layer = bm.faces.layers.int.new('Face Parameters')
    ff_layer = bm.faces.layers.string.new('Face Flags') #Need to store this metadata on the faces. This is the easiest way.
    fi_layer = bm.faces.layers.int.new('Face Ints')
    unk_layer = bm.loops.layers.int.new('Unk Parameter')
    uv_layer = bm.loops.layers.uv.verify() #Get the UV Layer
    geomflag,vgroups = read_uints(file,2)
    vgroups += 1
    verts,uverts     = [],[]
    vert_colors,bone_weights = [],[] #Unused... for now?
    for _ in range(vgroups):
        vflag,vtype,verts_n = read_uints(file,3)
        verts_n += 1
        if   vtype & 0xFF0000 == 0xF30000: verts  = [bm.verts.new((co)) for co in read_floats(file, verts_n*3).reshape(verts_n,3)[:,[0,2,1]]] #Swaps y and z columns.
        elif vtype & 0xFF0000 == 0xF20000: uverts = read_floats(file,verts_n*2).reshape(verts_n,2) #It becomes a numpy array, but the indexing will be the same.
        #These last two options were taken from Inuk's drinkyrfc.
        elif vtype & 0xFF0000 == 0xB40000: vert_colors  = [unpack(f'<{verts_n}L', file.read(4*verts_n))]
        elif vtype & 0xFF0000 == 0xA40000: bone_weights = [unpack('<4L4f', file.read(4*4 + 4*4)) for __ in range(verts_n)]
    vrtmapstag,vrtmapslength    = read_uints(file,2)
    assert vrtmapstag == 0x3DC0, f'Invalid facechunk flag @ {hex(file.tell()-8)}'
    null,comboverts,materials_n = read_uints(file,3)
    comboverts += 1; materials_n += 1 #Stores one more than what's defined for some reason.
    materials = [(read_uints(file,3),read_name(file)) for _ in range(materials_n)]
    vrtmaps_n = read_uints(file,1)
    vrtmaps_n += 1
    vertmap,uvmap,unkmap = [],[],[]
    parsing_func = read_ushorts if comboverts < 0xFFFF else read_uints
    for _ in range(vrtmaps_n):
        vm_start = file.tell()
        vmflag = read_uints(file,1)
        read_vertmap = parsing_func(file,comboverts)
        if vmflag == 0x10001   or vmflag == 0x01: vertmap = read_vertmap
        elif vmflag == 0x10010 or vmflag == 0x10: uvmap   = read_vertmap
        elif vmflag == 0x2:                       unkmap  = read_vertmap #idk
        else: raise ValueError(f'Found an unknown vertex map flag ({hex(vmflag)}) @ {hex(vm_start)}')
    mesh = bf.create_mesh(header.name)
    prev_chunktag,prev_chunkstart = 0,0
    constraints = []
    while file.tell() - header.start < header.node_length:
        chunktag,chunklength = read_uints(file,2)
        chunkstart = file.tell()
        # print(f'Reading chunktag {hex(chunktag)} @ {hex(chunkstart)}')
        if chunktag == 0x3DC1: #Faces
            null,faces_n = read_uints(file,2)
            faces_n += 1
            mat_dict = {}
            for i,((ignored,start,stop),matname) in enumerate(materials): 
                for j in range(start,stop+1): mat_dict[j] = i
            for _ in range(faces_n):
                map_verts = parsing_func(file,3)
                if not flip_normals: map_verts = list(reversed(map_verts))
                # try: face = bm.faces.new([verts[vertmap[idx]] for idx in reversed(map_verts)]) if not flip_normals else bm.faces.new([verts[idx] for idx in map_verts])
                try: face = bm.faces.new([verts[vertmap[idx]] for idx in map_verts])
                except: pass
                else:
                    for loop,map_vert in zip(face.loops,map_verts):
                    # for loop,map_vert in zip(face.loops,reversed(map_verts) if not flip_normals else map_verts):
                        u,v = uverts[uvmap[map_vert]]
                        loop[uv_layer].uv = u, 1-v #Flip them in blender. It's flipped for some reason.
                        # loop[unk_layer] = unkmap[map_vert]
                    face.material_index = mat_dict[map_verts[0]]
            for _ in range(len(materials)): reminder = file.read(8) #Idk why this exists other than to restate the material ranges for each face.
            while file.tell() - chunkstart < chunklength:
                subtag,sublength = read_uints(file,2)
                # print(f'Reading face subchunk {hex(subtag)} @ {hex(file.tell()-8)}')
                if   subtag & 0xFF0F == 0x3D02:
                    for face,fi in zip(bm.faces,read_ubytes(file,faces_n)):
                        face[fi_layer] = fi
                elif subtag & 0xFF0F == 0x3D03:
                    for face,ff in zip(bm.faces,read_uints(file,faces_n)):
                        face[ff_layer] = hex(ff).encode('ascii')
                        # face[fs_layer] = ff & 0x00FFFFFF #Face set, categorize the face.
                        # face[fp_layer] = ff >> 24 #Face Parameters, what the face does.
                else: raise Exception(f'Found an unknown face subchunk {hex(subtag)} @ {hex(file.tell()-8)}')
        elif chunktag & 0xFFFFFF00 == 0x3DD0B000: #Physics
            file.seek(chunkstart - 8) #Attaching the raw hex to the mesh in case it should be reused.
            mesh.physics_data = file.read(chunklength + 8).hex()
            mesh.gen_physics = True
            file.seek(chunkstart)
            unk_int,mesh.density = read_uints(file,1),read_floats(file,1)
            unused_data = file.read(0x54) #0x30 + 0x10 + 0x14, point-mass tensor and other stuff
            av_size,spheres_n = 0,0
            while file.tell() - chunkstart < chunklength:
                tflag,tlength = read_uints(file,2)
                if tflag == 0xCD00: #Collision spheres
                    null,spheres_n = read_uints(file,2)
                    #The positions are unused because the collision is regenerated on export if specified to.
                    for pos,size in [(read_vector(file,3),read_floats(file,1)) for i in range(spheres_n)]:
                        av_size += size
                elif tflag == 0xDDB0: #Constraints, unused for now.
                    # constraint_data = file.read(tlength)
                    constraints = [MotionConstraint.parse(file) for _ in range(read_uints(file,1))]
                elif tflag == 0xDDB3: #Sound Chunk
                    unkdata = file.read(tlength)
            if spheres_n: mesh.physics_size = av_size/spheres_n
        elif chunktag & 0xFFFFFF00 == 0x3D0CEC00: #Static Collision
            start = file.tell()
            file.seek(start - 8) #Attaching the raw hex to the mesh in case it should be reused.
            mesh.collision_data = file.read(chunklength + 8).hex()
            file.seek(start)
            if chunktag == 0x3D0CEC04: null,voxels_n,size = read_uints(file,3)
            else:                           size,voxels_n = read_uints(file,2)
            mesh.collision_size = size
            collision_data = file.read(4*3*voxels_n) #Unused. 3dim vector list.
        elif chunktag & 0xFFFFFF00 == 0x3DD0C000: #Soft Body
            mesh.x_softbody = True
            data = file.read(chunklength)
            # softbody  = XSoftBody.parse(file)
        elif chunktag == 0x3AC1: #Unknown chunk
            data = file.read(chunklength)
        else: raise ValueError(f'Found an unknown mesh chunk ({hex(chunktag)}) @ {hex(file.tell())}. Previous chunk was {hex(prev_chunktag)} @ {hex(prev_chunkstart)}')
        prev_chunktag,prev_chunkstart = chunktag,chunkstart
    for (ignored,start,stop),matname in materials: mesh.materials.append(bf.get_material(matname)) #Define the materials. I think it's important to do this before migrating the bm to m
    assert file.tell() - header.start - 8 == header.node_length, f'Improperly Read node {header.name}. Read {hex(file.tell() - header.start - 8)} instead of {hex(header.node_length)}'
    bm.to_mesh(mesh)
    if return_bmesh: return bm
    return mesh, constraints

def parse_and_build_light(header: xp.NodeHeader, file: BufferedReader) -> bpy.types.Light:
    light = bf.create_light(header.name)
    # print(light)
    light.use_shadow = True
    if header.suppress == 0:
        flag = read_uints(file,1)
        light.color = read_vector(file,3)
        ignored = file.read(4)
        light.diffuse_factor,light.brightness,distance,light.shadow_soft_size,soften = read_floats(file,5)
        light.energy = distance * 600
        if header.objflag == 0x140200: #0x140200
            file.read(8)
        #     light.type = 'SPOT'
            # light.spot_size,light.spot_blend = read_floats(file,2)
        #Animation stuff
        if flag & 0x30000 != 0: unk = file.read(header.node_length-152).hex().upper()
    return light

def parse_and_build_voxel_light(header: xp.NodeHeader, file: BufferedReader) -> bpy.types.Light:
    light = bf.create_light(header.name)
    light.use_shadow = False
    ignored = file.read(4)
    light.color = read_vector(file,3)
    ignored = file.read(4)
    light.diffuse_factor,distance = read_floats(file,2)
    light.energy = distance * 600
    ignored = file.read(4)
    return light

def visualize_constraint(constraint: MotionConstraint, col: bpy.types.Collection) -> bpy.types.Object:
    bm = bmesh.new()
    vertA = bm.verts.new(constraint.v1)
    vertB = bm.verts.new(constraint.v2)
    edge = bm.edges.new((vertA,vertB))
    mesh = bf.create_mesh('Constraint Visualizer')
    bm.to_mesh(mesh)
    obj = bf.create_object(name = 'Constraint Visualizer', data = mesh)
    obj.show_in_front = True
    col.objects.link(obj)
    return obj

empty_type_dict = {
    0x0:        'None',
    0x3DD0E002: 'Fire',
    0x3DD0E004: 'Portal'
}

def parse_and_build_node(file: BufferedReader, rfc_name: str, rfc_sig: int, built_nodes: list[bpy.types.Object], col: bpy.types.Collection, flip_normals: bool = False, return_bmesh: bool = False, return_data: bool = False) -> bpy.types.Object:
    node_type,length = read_uints(file,2)
    start = file.tell()
    header = xp.NodeHeader.parse(file = file, rfc_sig = rfc_sig, type = node_type, length = length)
    # print(f'Parsing node {header.name}')
    data = None
    if not header.suppress:
        constraints = None
        if   node_type == 0x3D01: pass #Empty
        if   node_type == 0x3D03: data,constraints = parse_and_build_mesh(header = header, file = file, flip_normals = flip_normals, return_bmesh = return_bmesh)
        elif node_type == 0x3D06: data = parse_and_build_light(header = header, file = file)
        elif node_type == 0x3D0C: data = parse_and_build_voxel_light(header = header, file = file)
        obj = bf.create_object(name = header.name, data = data)
        if node_type == 0x3D01: #Since empties dont have data, slap the stuff on the object
            if header.flags == 0x0 or header.flags == 0x10009:
                obj.x_effect_type,eff_length,obj.x_effect_intensity = empty_type_dict[read_uints(file,1)],read_uints(file,1),read_floats(file,1)
                # (obj['Effect ID'],type_length,obj['Intensity']),obj.empty_display_size = unpack('<2L f', file.read(12)),10
        obj.node_name = header.name
        obj.rfc_name = rfc_name
        if constraints and node_type == 0x3D03:
            for x_c in constraints:
                bx_c = obj.x_constraints.add()
                bx_c.type = x_c.type
                bx_c.v1,bx_c.v2 = x_c.v1,x_c.v2
                bx_c.dist, bx_c.stiffness,bx_c.damping = x_c.dist,x_c.stiffness,x_c.damping 
                # c_obj = visualize_constraint(constraint = constraint, col = col)
                # c_obj.parent = obj.parent

    else:
        obj = bf.copy_object(built_nodes[header.suppress - 1])
    if return_data: return data
    if file.tell() - start > length: raise Exception(f'Incorrectly read node {header.name} @ {hex(start)} with data {data}. Overshot by {hex(file.tell() - start)} bytes.')
    if header.parent and built_nodes[header.parent - 1] != obj: obj.parent = built_nodes[header.parent - 1]
    obj.matrix_local = header.tmatrix
    if col: col.objects.link(obj)
    return obj

def parse_and_build_nodes(file: BufferedReader, rfc_name: str, rfc_sig: int, col: bpy.types.Collection, flip_normals: bool = False, return_bmesh: bool = False, return_data: bool = False) -> list[bpy.types.Object]:
    length,nodes_n = read_uints(file,2)
    built_nodes = []
    for _ in range(nodes_n):
        built_nodes.append(parse_and_build_node(file = file,rfc_name = rfc_name,rfc_sig = rfc_sig,
                                                built_nodes = built_nodes, col = col,
                                                flip_normals = flip_normals, return_bmesh = return_bmesh,
                                                return_data = return_data))
    if not return_data: #Meshes, lights and whatnot dont have this stuff.
        root = built_nodes[0] #Making it easy to get metadata.
        for obj in built_nodes:
            if obj is not root: obj.root_node = root 
    return built_nodes

def build_tileset(rfp: pbRFP, set_name: str, return_col: bool = False) -> bpy.types.Collection | list[bpy.types.Object]:
    col = bf.verify_colname_exists(set_name)
    raw_objs = rfp.resource.parse_and_build_entry(rfp, set_name + '.rfc', col, return_nodes = True, lite_mode = False, import_images = True)
    
    roots = [obj for obj in raw_objs if not obj.parent]
    # merged_roots = [bf.merge_hierarchy_lite(root = root, purge_original = True) for root in roots]
    merged_roots  = [bf.merge_hierarchy(hierarchy = [root] + [child for child in root.children_recursive if '+F' not in child.name], col = col) for root in roots] 
    for obj in merged_roots: obj.ex_type = 'Tile'
    if 'ws' in set_name:
        for obj in merged_roots: obj.wallset = set_name
    elif 'fs' in set_name:
        for obj in merged_roots: obj.floorset = set_name
    # bpy.data.batch_remove(raw_objs) #Get rid of the unused stuff.
    if return_col: return col
    else:          return merged_roots

def parse_and_build_tilemap(rfp: pbRFP, file: BufferedReader, col: bpy.types.Collection, scene: bpy.types.Scene, mirror_x: bool = False, mirror_y: bool = False) -> None:
    tilechunk = xp.TileChunk.parse(file)
    #Import them.
    #Create the sets if they cant be imported then store them in the asset library.
    set_names = set(tilechunk.wallsets + tilechunk.floorsets)
    known_sets = {col for col in bpy.data.collections if col.name in set_names}
    sets_imported = bf.get_assets_from_file(path = library_path, id_type = 'collections', link = True, names = set_names - known_sets)
    created_sets = [build_tileset(rfp = rfp, set_name = set_name, return_col = True) for set_name in set_names - sets_imported - known_sets]
    if mirror_x: tilechunk.mirror_x()
    if mirror_y: tilechunk.mirror_y()
    wallsets  = {i:xtb.SortedTileset.sort(name,bpy.data.collections[name].all_objects) for i,name in enumerate(tilechunk.wallsets)}
    floorsets = {i:xtb.SortedTileset.sort(name,bpy.data.collections[name].all_objects) for i,name in enumerate(tilechunk.floorsets)}
    scale = tilechunk.scale
    dim2,dim1 = tilechunk.tiles_arr.shape
    x_start = -(scale * ((dim1/2)) - scale/2)
    y_start = -(scale * ((dim2/2)) - scale/2)
    tiles_arr = tilechunk.tiles_arr
    y_width,x_width = tiles_arr.shape
    half_x,half_y = x_width//2,y_width//2
    grid_scale = scene.tilemap.grid_scale
    scene.tilemap.suppress_updates = True
    grid_half = grid_scale / 2
    b_sectors = scene.tilemap.sectors
    b_sectors.clear()
    for y in range(dim2):
        pos_y = y_start + y*scale
        for x in range(dim1):
            # print(f'Inspecting sector {(y,x)}')
            pos_x = x_start + x*scale
            tile = tiles_arr[y,x]
            b_sec = b_sectors.add() #For storing other metadata.
            b_sec.x,b_sec.y = x - half_x,y - half_y #Shift from local to world coords. From the grid corner to scene origin.
            if tile.parts[5][0] & 0b1000:
                xtb.build_tile(tile = tile, pos_x = pos_x, pos_y = pos_y, wallsets = wallsets, floorsets = floorsets, col = col)
                b_sec.enterable = True
            b_sec.special_rot,b_sec.special_group,b_sec.special_mod = tile.special_orientation,tile.special_group,tile.special_modifier
            if tile.special_group or tile.special_orientation or tile.special_modifier:
                visualiser = bf.create_empty(name = 'special_identifier', col = col)
                visualiser.location = (grid_scale * b_sec.x) + grid_half, (grid_scale * b_sec.y) + grid_half, grid_scale
                visualiser.empty_display_type,visualiser.empty_display_size = 'CUBE',20
            if tile.parts[4][0] & 0b1000:
                b_sec.terrain = True
    if created_sets: 
        print(f'Writing {len(created_sets)} new set collections to the asset library')
        bf.write_assets_to_file(dest_path = library_path, id_type = 'collections', link = False, blocks_set = set(created_sets), purge_original = True, unpack_collections = True, parent_cat_name = 'Tilesets')
        # for col in created_sets:
        #     print(f'Writing tileset collection ({col.name}) as catalog...')
        #     bf.write_assets_to_file(dest_path = library_path, id_type = 'objects', link = False, blocks_set = set(col.objects), purge_original = True, catalog_name = col.name, parent_cat_name = 'Tilesets')
    scene.tilemap.suppress_updates = False
def parse_and_pose_subnodev1(file: BufferedReader, type: int, nodes_by_name: dict[str,bpy.types.Object]):
    type = type
    int_1,int_2,int_3,flag = None,None,None,None
    if type == 0x3DE0EC00:
        int_1, = unpack('<L',file.read(4))
        obj = nodes_by_name[read_name(file)]
        int_2, = unpack('<L',file.read(4))
        obj.matrix_world = read_x_tmatrix(file)
        int_3, = unpack('<L',file.read(4))
    elif type == 0x3DE0ECAC:
        obj = nodes_by_name[read_name(file)]
        flag = unpack('<L',file.read(4))
        obj.matrix_world = read_x_tmatrix(file)

def parse_and_pose_subnodev2(file: BufferedReader, nodes_by_name: dict[str,bpy.types.Object], recursion: int = 0):
    # When this function is originally called, the signature is already read. 
    # Need to read the signature on recursive classes.
    if recursion:
        signature,length = read_uints(file,2)
        if signature != 0x3DE0ECAC: raise Exception(f'Signature ({hex(signature)}) is not a SubNodeV2 @ {hex(file.tell()-8)}')
    else:
        length = read_uints(file,1)
    start  = file.tell()
    obj, flag = nodes_by_name[read_name(file)], read_uints(file,1)
    obj.matrix_world = read_x_tmatrix(file)
    while file.tell() - start < length:
        parse_and_pose_subnodev2(file = file, nodes_by_name = nodes_by_name, recursion = recursion + 1)

def parse_and_pose_subnodes(file: BufferedReader, objs: list[bpy.types.Object], start: int, length: int) -> None:
    if file.tell() - start < length: 
        nodes_by_name = {obj.node_name:obj for obj in objs}
        while file.tell() - start < length:
            subnode_sig = read_uints(file,1)
            if subnode_sig == 0x3DE0EC00: #Subnodev1
                length = read_uints(file,1)
                start = file.tell()
                ini_int = read_uints(file,1)
                childamount = (length - 8)//76
                for _ in range(childamount): parse_and_pose_subnodev1(file,subnode_sig,nodes_by_name)
                end_int = read_uints(file,1)
            elif subnode_sig == 0x3DE0ECAC: #Subnodev2
                parse_and_pose_subnodev2(file,nodes_by_name)
            elif subnode_sig == 0x3DE0ECDB: #Softbody
                length = read_uints(file,1)
                start = file.tell()
                obj = nodes_by_name[read_name(file)]
                if obj.type != 'MESH': raise Exception(f'Cannot pose soft body {obj} because its type is {obj.type}, not MESH')
                flag,verts_n = read_uints(file,2)
                vert_cos = read_floats(file, verts_n*3).reshape(verts_n,3)[:,0,2,1]
                for vert,co in zip(obj.data.vertices,vert_cos):
                    vert.co = co

asset_categories = ['objlib','objects','character']
def build_referenced_model(rfp: pbRFP, name: str, category: str, return_col: bool = False) -> list[bpy.types.Object] | bpy.types.Collection | None:
    name,category = name.lower(),category.lower()
    if category not in asset_categories: raise Exception(f'Model category {category} does not exist! Should be on of the following: {asset_categories}')
    if category == 'objlib':
        for rpk in rfp.objlib_rpks:
            if name in rpk.lookup_dict:
                col = bf.verify_colname_exists(colname = name)
                objs = rpk.parse_and_build_entry(rfp = rfp,entry_name = name, col = col, return_nodes = True, lite_mode = True, import_images = True)
                for obj in objs: obj.ex_type = 'Prop'
                if return_col: return col 
                else:          return objs
    elif category == 'objects':
        model_name = name.replace('o_','')
        if model_name[0] == '@': return #Factory model! Not implemented yet.
        col = bf.verify_colname_exists(colname = 'o_' + model_name)
        if model_name in rfp.objects.lookup_dict:
            objs = rfp.objects.parse_and_build_entry(rfp = rfp,entry_name = model_name, col = col, return_nodes = True, lite_mode = True, import_images = True)
            for obj in objs: obj.ex_type = 'Item'
            if return_col: return col
            else:          return objs

def parse_and_build_rfc(rfp: pbRFP, file: BufferedReader, signature: int, size: int, name: str, col: bpy.types.Collection | None = None, 
                        linked: bool = True, return_nodes: bool = False,
                        import_tiles: bool = True, import_materials: bool = True, import_props: bool = True, import_database: bool = True,
                        import_images: bool = False,
                        mirror_x: bool = False, mirror_y: bool = False, flip_normals: bool = False, return_data: bool = False,
                        lite_mode: bool = False) -> None | list[bpy.types.Object]:
    start = file.tell()
    size -= 4 #the rfc signature is read before this function, discard it
    if not col and linked:
        print(f'Creating scene {name}')
        scene = bf.verify_scenename_is_present(name)
        bf.clear_scene(scene = scene, purge = True)
        bpy.context.window.scene = scene
    else: scene = None
    if scene: scene.suppress_item_updates = True
    prev_chunktag,prev_chunkstart = 0,0
    item_db = idb.pbDatabase(file)
    char_db = cdb.pbCharDB(file)
    while file.tell() - start < size:
        chunk_signature = read_uints(file,1)
        chunk_start = file.tell()
        # print(f'Reading chunk signature {hex(chunk_signature)}')
        if   chunk_signature == 0x3DED: #Tile Map
            # print(f'Reading tiles...')
            if import_tiles:
                tiles_col = bf.verify_colname_in_scene(scene,'Tiles')
                print(f'Building tilemap...')
                parse_and_build_tilemap(rfp = rfp, file = file, col = tiles_col, mirror_x = mirror_x, mirror_y = mirror_y, scene = scene)
            else: data = file.read(read_uints(file,1))
        elif chunk_signature == 0xBA00: #Materials
            if import_materials:
                mats = parse_and_build_materials(rfp = rfp, file = file, import_textures = import_images, lite_mode = lite_mode)
            else: data = file.read(read_uints(file,1))
        elif chunk_signature == 0x3D000000: #Nodes: meshes and lights n stuff
            if not linked: nodes_col = None
            elif not col and scene: nodes_col = nodes_col = bf.verify_colname_in_scene(scene,'Nodes')
            else: nodes_col = col
            nodes = parse_and_build_nodes(file = file, rfc_sig = signature, rfc_name = name, col = nodes_col, flip_normals = flip_normals, return_data = return_data)
            if return_nodes: return nodes
        elif chunk_signature == 0x3DE10000: #Props
            if import_props:
                print(f'Building props...')
                props_col = bf.verify_colname_in_scene(scene,'Props')
                props = xp.parse_props(file = file)
                #Improve this.
                model_names = set([prop.model_name for prop in props])
                known_colnames = set([col.name for col in bpy.data.collections if col.name in model_names])
                print(f'\tFound {len(known_colnames)} matching prop collections.')
                print(f'\tTrying to import {len(model_names - known_colnames)} prop models from the asset library...')
                models_imported = bf.get_assets_from_file(path = library_path, id_type = 'collections', link = True, names = model_names - known_colnames)
                print(f'\tImported {len(models_imported)} from the asset library...')
                print(f'\tBuilding {len(model_names - models_imported - known_colnames)} models...')
                cols_to_append = [build_referenced_model(rfp = rfp, name = name, category = 'objlib', return_col = True) for name in model_names - models_imported - known_colnames]
                name_to_col_dict = {col.name:col for col in bpy.data.collections if col.name in model_names}
                info_interval = len(props)//10 + 1
                print(f'Placing props...')
                for i,prop in enumerate(props):
                    if i%info_interval == 0: print(f'\tPlacing prop {i + 1} of {len(props)}')
                    o_col = name_to_col_dict.get(prop.model_name,None)
                    if o_col:
                        objs = bf.copy_objects(objects = o_col.objects, col = props_col)
                        root = objs[0]
                        root.matrix_world = prop.tmatrix
                        if prop.flag == 0x80000: root.static = True
                        if prop.subnodes: xtb.pose_subnodes(objs = objs, placed_node = prop)
                if cols_to_append: 
                    print(f'Writing {len(cols_to_append)} Objlib collections to the asset library')
                    bf.write_assets_to_file(dest_path = library_path, id_type = 'collections', link = False, blocks_set = set(cols_to_append), purge_original = True, catalog_name = 'Props')
                # parse_and_build_props(rfp = rfp, file = file, col = props_col, mirror_x = mirror_x, mirror_y = mirror_y)
            else: data = file.read(read_uints(file,1))
        elif chunk_signature == 0xDBC0: #Item database
            item_db.parse_local_db()
            if import_database:
                print(f'Building placed items...')
                col = bf.verify_colname_in_scene(scene,'Items')
                model_names = set(['o_' + name for name in item_db.get_placed_world_model_names(rfp = rfp) if name[0] != '@']) #"Object" prefix to distinguish from character models.
                # if not model_names: raise Exception(f'Failed to find any models for any items') #Temp
                known_colnames = set([col.name for col in bpy.data.collections if col.name in model_names])
                print(f'\tFound {len(known_colnames)} matching object collections...')
                names_to_import = model_names - known_colnames
                print(f'\tTrying to import {len(names_to_import)} object models from the asset library...')
                models_imported = bf.get_assets_from_file(path = library_path, id_type = 'collections', link = True, names = names_to_import)
                print(f'\tImported {len(models_imported)} from the asset library...')
                print(f'\tBuilding {len(model_names - models_imported - known_colnames)} models...')
                cols_to_append = [build_referenced_model(rfp = rfp, name = name, category = 'objects', return_col = True) for name in model_names - models_imported - known_colnames]
                cols_to_append = [col for col in cols_to_append if col and col.objects] #Get rid of Nones
                idb.pbDatabase.wrld_model_dict = {col.name.replace('o_',''):col for col in bpy.data.collections if col.name in model_names}
                item_db.build_placed_items(rfp = rfp, col = col)
                if cols_to_append: 
                    print(f'Writing {len(cols_to_append)} Objects collections to the asset library')
                    bf.write_assets_to_file(dest_path = library_path, id_type = 'collections', link = False, blocks_set = set(cols_to_append), purge_original = True, catalog_name = 'Objects')
        elif chunk_signature & 0xFFFFFF00 == 0xCAC00000: #Character database
            col = bf.verify_colname_in_scene(scene,'Characters')
            locale_id = rfp.r_locale_dict[name.replace('.rfc','')] #Important for identifying which character should be built. Only build characters that are in the current locale.
            char_db.parse_local_db(rfp = rfp, locale_id = locale_id, idb = item_db, col = col)
        elif chunk_signature == 0xEC00DC00: #Envmap
            data = file.read(read_uints(file,1)) #Temp. 
        else: raise Exception(f'Found an unknown rfc chunk {hex(chunk_signature)} @ {hex(file.tell()-4)}. Previous chunk was {hex(prev_chunktag)} @ {hex(prev_chunkstart)} in {file.name}')
        prev_chunktag,prev_chunkstart = chunk_signature,chunk_start
    if scene: scene.suppress_item_updates = False