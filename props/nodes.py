import bpy

from bpy.props import PointerProperty

def register():
    bpy.types.Object.root_node = PointerProperty(type = bpy.types.Object)

def unregister():
    del bpy.types.Object.root_node