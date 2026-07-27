'''
Used for parsing the children of libnodes and placed items. This being a separate module prevents circular imports.
'''

from __future__ import annotations

from .parsing_funcs import *
from .writing_funcs import *

from dataclasses import dataclass,field

import bpy

@dataclass(slots = True)
class SubNodeV1:
    index: int #Remainder?
    name: str
    null: int
    matrix: Matrix
    children: list[SubNodeV1]
    @classmethod
    def parse(cls, file: BufferedReader) -> SubNodeV1:
        return SubNodeV1(index    = read_uints(file,1), #?
                         name     = read_name(file),
                         null     = read_uints(file,1),
                         matrix   = read_x_tmatrix(file),
                         children = [SubNodeV1.parse(file) for _ in range(read_uints(file,1))])
    def pose(self, objs_by_name: dict[str,bpy.types.Object], parent: bpy.types.Object | None = None) -> None:
        obj = objs_by_name[self.name]
        obj.matrix_world = self.matrix
        if parent: obj.parent = parent
        for child in self.children:
            child.pose(objs_by_name, obj)
    def write(self) -> bytes:
        d = write_uint(self.index) + write_name(self.name) + write_uint(self.null) + write_tmatrix(self.matrix)
        d += write_uint(len(self.children))
        for child in self.children: d += child.write()
        return d

@dataclass(slots = True)
class OldSubnodes:
    hierarchies: list[SubNodeV1] = field(default_factory = list)
    null: int = 0x0
    @classmethod
    def parse(cls, file: BufferedReader) -> OldSubnodes:
        length = read_uints(file,1)
        return OldSubnodes(hierarchies = [SubNodeV1.parse(file) for _ in range(read_uints(file,1))],
                           null        = read_uints(file,1))
    def pose(self, objs_by_name: dict[str,bpy.types.Object]) -> None:
        for sn in self.hierarchies:
            sn.pose(objs_by_name)
    def write(self, *args, **kwargs) -> bytes:
        d = write_uint(len(self.hierarchies))
        for h in self.hierarchies: d += h.write()
        d += write_uint(self.null)
        return write_uints((0x3DE0EC00,len(d))) + d
    
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
    def pose(self, objs_by_name: dict[str, bpy.types.Object], parent: bpy.types.Object | None = None) -> None:
        obj = objs_by_name[self.name]
        obj.matrix_world = self.tmatrix
        if parent: obj.parent = parent
        for child in self.children:
            child.pose(objs_by_name, obj)
    def copy(self, transform: Matrix) -> SubNodeV2:
        if transform: tmatrix = transform @ self.tmatrix
        else:         tmatrix = self.tmatrix.copy()
        return SubNodeV2(name = self.name,
                         flag = self.flag,
                         tmatrix = tmatrix,
                         children = [child.copy(transform) for child in self.children])
    def write(self, transform: Matrix | None = None) -> bytes:
        if transform: world_mat = transform @ self.tmatrix
        else: world_mat = self.tmatrix
        d = write_name(self.name) + write_uint(self.flag) + write_tmatrix(world_mat)
        for child in self.children: 
            d += child.write(transform)
        return write_uints((0x3DE0ECAC, len(d))) + d

@dataclass(slots = True)
class SoftBodySubNode:
    name: str
    flag: int
    #Vertices of the softbody mesh in world space. 
    vert_coords: list[Vector] 
    @classmethod
    def parse(cls, file: BufferedReader) -> SoftBodySubNode:
        length = read_uints(file,1)
        name = read_name(file)
        flag,verts_n = read_uints(file,2)
        vert_coords = [read_3dfvec(file) for _ in range(verts_n)]
        return SoftBodySubNode(name = name, flag = flag, vert_coords = vert_coords)
    def pose(self, objs_by_name: dict[str, bpy.types.Object]) -> None:
        return #Not implemented yet...
    def write(self, transform: Matrix | None = None) -> bytes:
        d = write_name(self.name) + write_uints((self.flag,len(self.vert_coords)))
        if transform:
            for co in self.vert_coords:
                d += write_3dfvec(transform @ co)
        else:
            for co in self.vert_coords:
                d += write_3dfvec(co)
        return write_uints((0x3DE0ECDB,len(d))) + d

def read_subnodes(file: BufferedReader, start: int, length: int) -> list[SubNodeV2 | OldSubnodes | SoftBodySubNode]:
    subnodes = []
    #Will immediately end if beyond the size of the placed item, dont need logic to prevent this from running.
    while file.tell() - start < length:
        subnode_sig = read_uints(file,1)
        if subnode_sig == 0x3DE0EC00: #Old format, implies all subnodes are in a single chunk
            subnodes.append(OldSubnodes.parse(file))
        elif subnode_sig == 0x3DE0ECAC:
            subnodes.append(SubNodeV2.parse(file))
        elif subnode_sig == 0x3DE0ECDB:
            subnodes.append(SoftBodySubNode.parse(file))
        else: raise Exception(f'Found an unknown subnode type ({hex(subnode_sig)}) @ {hex(file.tell())} in {file.name}. Started @ {hex(start)}')
    return subnodes