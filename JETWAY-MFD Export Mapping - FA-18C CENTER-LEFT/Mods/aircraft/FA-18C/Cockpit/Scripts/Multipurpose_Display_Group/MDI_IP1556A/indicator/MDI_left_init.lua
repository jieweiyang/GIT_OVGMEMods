-- Left/Right MDIs have specific symbology clipping levels, thus there are separate left/right init files
dofile(LockOn_Options.script_path.."Multipurpose_Display_Group/Common/indicator/MDG_materials.lua")

opacity_sensitive_materials = 
{
	MDG_font_name(MDG_SELF_IDS.LMDI),
	MDG_material_name(MDG_SELF_IDS.LMDI)
}

-- Specific part of MDI initialization
-- Parameters handling functions
dofile(LockOn_Options.script_path.."Multipurpose_Display_Group/Common/indicator/InitParams.lua")
writeParameter("MDG_init_DEFAULT_LEVEL", 4)

-- Parameters to customize common symbology properties
writeParameter("MDG_init_specifics", LockOn_Options.script_path.."Multipurpose_Display_Group/MDI_IP1556A/indicator/MDI_left_specifics.lua")

-- Common part of MDI initialization
dofile(LockOn_Options.script_path.."Multipurpose_Display_Group/MDI_IP1556A/indicator/MDI_init.lua")

--ViewportHandling
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua")
update_screenspace_diplacement(1, true, 0)
try_find_assigned_viewport("LEFT_MFCD_")

-- green shade for "render_target_X" , to change tone - make texture with that tone 
used_render_mask  = LockOn_Options.script_path.."../IndicationResources/MDG/flir_texture.dds"
