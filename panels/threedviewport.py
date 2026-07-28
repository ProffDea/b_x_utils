import bpy,os

from bpy.props import (
    CollectionProperty,
    StringProperty	,
    BoolProperty	,
    EnumProperty	,
    FloatProperty	,
    PointerProperty ,
    IntProperty     ,
    IntVectorProperty,
    FloatVectorProperty,
)

class XUtils_PT_Panel(bpy.types.Panel):
    bl_label = "Exanima Utils"
    bl_idname = "XUtils_PT_Panel"
    bl_space_type = 'VIEW_3D'
    bl_region_type = 'UI'
    bl_category = 'Exanima Utils'
    def draw(self, context):
        addon_name = __package__.split('.')[0]
        p = bpy.context.preferences.addons[addon_name].preferences
        layout = self.layout
        layout.row().prop(p, 'import_path')
        row = layout.row()
        row.prop(p,'import_sectors')
        row.prop(p,'import_props')
        row = layout.row()
        row.prop(p,'import_items')
        op = layout.row().operator('exanima.import_x_file')
        op.filepath = p.import_path

classes = [XUtils_PT_Panel]

def register():
    for cls in classes: bpy.utils.register_class(cls)

def unregister():
    for cls in classes: bpy.utils.unregister_class(cls)