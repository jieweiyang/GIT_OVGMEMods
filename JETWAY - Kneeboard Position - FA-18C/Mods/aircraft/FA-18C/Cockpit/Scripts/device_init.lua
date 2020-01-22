mount_vfs_model_path(LockOn_Options.script_path.."../Shape")

dofile(LockOn_Options.script_path		.."config.lua")
dofile(LockOn_Options.script_path		.."devices.lua")
dofile(LockOn_Options.common_script_path.."tools.lua")
dofile(LockOn_Options.script_path		.."materials.lua")

MainPanel = {"F18::ccF18MainPanel", 
			LockOn_Options.script_path.."mainpanel_init.lua",
			{{"FM_Proxy",		devices.FM_PROXY},
			 {"CONTROL",		devices.CONTROL_INTERFACE},
			 {"ELEC",			devices.ELEC_INTERFACE},
			 {"HYDRO",			devices.HYDRAULIC_INTERFACE},
			 {"GEAR",			devices.GEAR_INTERFACE},
			 {"CPT_LIGHTS",		devices.CPT_LIGTHS},
			 {"ECS",			devices.ECS_INTERFACE},
			 -- Instruments --------------------------
			 {"IFEI",			devices.IFEI},
			 {"AAU52",			devices.AAU52},
			 {"AVU35",			devices.AVU35},
			 {"AVU53",			devices.AVU53},
			 {"ID2163A", 		devices.ID2163A},
			 {"SAI", 			devices.SAI},
			 --
			 {"RWR", 	devices.RWR},
			 {"CMDS",	devices.CMDS},
			 --
			 {"RDR",	devices.RADAR},
			},
}

creators   = {}

creators[devices.FM_PROXY] = {
	"F18::avFMProxy_F18",
	"",
	{{"FCCA", devices.FCCA},
	{"FCCB", devices.FCCB}}
}

creators[devices.CONTROL_INTERFACE] = {
	"F18::avControlInterface_F18",
	LockOn_Options.script_path.."Interfaces/ControlSystem.lua",
	{{"FM_proxy", devices.FM_PROXY},
	{"ELEC", devices.ELEC_INTERFACE},
	{"FCCA", devices.FCCA},
	{"FCCB", devices.FCCB}},
}

creators[devices.ELEC_INTERFACE] = {
	"F18::avElectricInterface_F18",
	LockOn_Options.script_path.."Interfaces/ElectricSystem.lua",
	{{"FM_proxy", devices.FM_PROXY}},
}

creators[devices.HYDRAULIC_INTERFACE] = {
	"F18::avHydroInterface_F18",
	LockOn_Options.script_path.."Interfaces/HydraulicSystem.lua",
	{{"FM_proxy", devices.FM_PROXY},
	{"ElecInterface", devices.ELEC_INTERFACE}},
}

creators[devices.GEAR_INTERFACE] = {
	"F18::avGearInterface_F18",
	LockOn_Options.script_path.."Interfaces/GearSystem.lua",
	{{"ElecInterface", devices.ELEC_INTERFACE},
	{"CONTROL", devices.CONTROL_INTERFACE}},
}

creators[devices.FUEL_INTERFACE] = {
	"F18::avFuelInterface_F18",
	LockOn_Options.script_path.."Interfaces/FuelSystem.lua",
	{{"FM_proxy", devices.FM_PROXY},
	{"ElecInterface", devices.ELEC_INTERFACE}},
}

creators[devices.CPT_MECHANICS] = {
	"F18::avCockpitMechanics_F18",
	"",
	{{"ElecInterface", devices.ELEC_INTERFACE}},
}

creators[devices.EXT_LIGHTS] = {
	"F18::avExtLightsSystem_F18",
	LockOn_Options.script_path.."Interfaces/ExtLights.lua",
	{{"ELEC",devices.ELEC_INTERFACE}}
}

creators[devices.CPT_LIGTHS] = {
	"F18::avCptLightsSystem_F18",
	LockOn_Options.script_path.."Interfaces/CptLights.lua",
	{{"ELEC",devices.ELEC_INTERFACE}}
}

creators[devices.OXYGEN_INTERFACE] = {
	"F18::avOxygenInterface_F18",
	LockOn_Options.script_path.."Interfaces/OxygenSystem.lua",
	{}
}

creators[devices.ECS_INTERFACE] = {
	"F18::avAirInterface_F18",
	LockOn_Options.script_path.."Interfaces/ECS.lua",
	{{"FM_Proxy", devices.FM_PROXY}}
}

creators[devices.ENGINES_INTERFACE] = {
	"F18::avEngineInterface_F18",
	"",
	{{"FM_proxy", devices.FM_PROXY},
	{"ELEC", devices.ELEC_INTERFACE}}
}

-- HOTAS Interface
creators[devices.HOTAS]	= {
	"F18::avHOTAS_F18",
	"",
	{{"CONTROL", devices.CONTROL_INTERFACE},
	{"EXT_LIGHTS", devices.EXT_LIGHTS},
	{"INTERCOM", devices.INTERCOM},
	{"SMS", devices.SMS},
	{"CMDS", devices.CMDS},
	{"LMDI", devices.MDI_LEFT},
	{"RMDI", devices.MDI_RIGHT},
	{"RDR", devices.RADAR},
	}
}

-- Computers --------------------------
creators[devices.MUX] = {
	"F18::avMuxManager_F18",
	""
}

creators[devices.SDC] = {
	"F18::avSignalDataComputer_F18",
	"",
	{{"ELEC",devices.ELEC_INTERFACE},
	{"HYDRO",devices.HYDRAULIC_INTERFACE},
	{"FM_PROXY",devices.FM_PROXY},
	{"MuxManager", devices.MUX},
	{"IFEI", devices.IFEI}}
}

creators[devices.MISSION_COMPUTER_NO_1] = {
	"F18::avMC_No1_F18",
	LockOn_Options.script_path.."Computers/MC_No1.lua",
	{
		{"ELEC",devices.ELEC_INTERFACE},
		{"MuxManager", devices.MUX},
		{"FM_PROXY", devices.FM_PROXY},
		{"MIDS", devices.MIDS}
	}
}

creators[devices.MISSION_COMPUTER_NO_2] = {
	"F18::avMC_No2_F18",
	LockOn_Options.script_path.."Computers/MC_No2.lua",
	{
		{"ELEC",devices.ELEC_INTERFACE},
		{"MuxManager", devices.MUX},
		{"FM_PROXY", devices.FM_PROXY},
		{"MIDS", devices.MIDS},
		{"RADAR", devices.RADAR}
	},
	LockOn_Options.script_path .. "Computers/MC2_commands.lua"
}

creators[devices.FCCA] = {
	"F18::avFCCA_F18",
	LockOn_Options.script_path.."Computers/FCC.lua",
	{{"FM_proxy", devices.FM_PROXY},
	{"ELEC", devices.ELEC_INTERFACE},
	{"CTRL", devices.CONTROL_INTERFACE},
	{"FCC_SEC", devices.FCCB},
	{"MuxManager", devices.MUX}},
}

creators[devices.FCCB] = {
	"F18::avFCCB_F18",
	LockOn_Options.script_path.."Computers/FCC.lua",
	{{"FM_proxy", devices.FM_PROXY},
	{"ELEC", devices.ELEC_INTERFACE},
	{"CTRL", devices.CONTROL_INTERFACE},
	{"FCC_SEC", devices.FCCA},
	{"MuxManager", devices.MUX}},
}

creators[devices.ADC] = {
	"F18::avAirDataComputer_F18",
	"",
	{{"FM_proxy", devices.FM_PROXY},
	{"ELEC", devices.ELEC_INTERFACE},
	{"MuxManager", devices.MUX},
	{"MAD", devices.MAD}},
}

creators[devices.CONTROL_CONVERTER] = {
	"F18::avControlConverter_F18",
	"",
	{
		{"FM_proxy", devices.FM_PROXY},
		{"ELEC", devices.ELEC_INTERFACE},
		{"MuxManager", devices.MUX},
		{"UFC", devices.UFC},
		{"RadarAltimeter", devices.RADAR_ALTIMETER},
		{"RaltIndicator", devices.ID2163A},
		{"SAI", devices.SAI},
		{"ADF", devices.ADF},
		{"MIDS", devices.MIDS},
		{"INTERCOM", devices.INTERCOM},
		{"ICLS", devices.ILS}
	},
}

creators[devices.SMS] = {
	"F18::avArmamentControl_AYK22_F18",
	"",
	{
		{"ELEC", devices.ELEC_INTERFACE},
		{"MuxManager", devices.MUX},
		{"AIM_9_Interface", devices.SIDEWINDER_INTERFACE},
		{"Maverick_Interface", devices.MAVERICK_INTERFACE},
		{"Walleye_Interface", devices.WALLEYE_INTERFACE},
		{"Harm_Interface", devices.HARM_INTERFACE},
		{"Datalink_Interface", devices.DATALINK_INTERFACE},
		{"FM_PROXY", devices.FM_PROXY}
	},
	LockOn_Options.script_path .. "Computers/SMS/sms_commands.lua"
}

creators[devices.DIGITAL_MAP_COMPUTER] = {
	"F18::avDigitalMapComputer_ASQ196_F18",
	"",
	{
		{"ELEC", devices.ELEC_INTERFACE},
		{"MuxManager", devices.MUX}
	},
}

creators[devices.UFC] = {
	"F18::avUFC_F18",
	"",
	{{"ControlConverter", devices.CONTROL_CONVERTER},
	{"ELEC", devices.ELEC_INTERFACE},
	{"INTERCOM", devices.INTERCOM},
	{"FM_PROXY", devices.FM_PROXY},
	{"CPT_LIGHTS", devices.CPT_LIGTHS}}
}

-- Instruments --------------------------
creators[devices.AAU52] = {
	"F18::avAAU52_F18",
	LockOn_Options.script_path.."Instruments/AAU52.lua",
	{{"FM_Proxy", devices.FM_PROXY},
	 {"ElecInterface",devices.ELEC_INTERFACE}}
}

creators[devices.AVU35] = {
	"F18::avAVU35_F18",
	LockOn_Options.script_path.."Instruments/AVU35.lua",
	{{"FM_Proxy", devices.FM_PROXY},
	 {"ElecInterface",devices.ELEC_INTERFACE}}
}

creators[devices.AVU53] = {
	"F18::avAVU53_F18",
	LockOn_Options.script_path.."Instruments/AVU53.lua",
	{{"FM_Proxy", devices.FM_PROXY},
	 {"ElecInterface",devices.ELEC_INTERFACE}}
}

creators[devices.STANDBY_COMPASS] = {
	"avMechCompass",
	LockOn_Options.script_path.."Instruments/StandbyCompass.lua",
	{}
}

creators[devices.ID2163A] = {
	"F18::avRadarAltimeterID2163A_F18",
	LockOn_Options.script_path.."Instruments/ID2163A.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE},
	 {"RadarAltimeter",devices.RADAR_ALTIMETER}}
}

creators[devices.RADAR_ALTIMETER] = {
	"F18::avRadarAltimeter_F18",
	LockOn_Options.script_path.."Instruments/RadarAltimeter.lua",
	{{"ID2163A", devices.ID2163A},
	 {"ElecInterface", devices.ELEC_INTERFACE}}
}

creators[devices.SAI] = {
	"F18::avSAI_F18",
	LockOn_Options.script_path.."Instruments/SAI_Parameters.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE},
	 {"FM_Proxy", devices.FM_PROXY},
	 {"ICLS", devices.ILS}}
}

creators[devices.IFEI] = {
	"F18::avIFEI_F18",
	LockOn_Options.script_path.."IFEI/device/IFEI.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE},
	{"SDC", devices.SDC}}
}

-- Multipurpose Display Group ---------------------------
creators[devices.HUD] = {
	"F18::avHUD_AVQ32_F18",
	LockOn_Options.script_path.."Multipurpose_Display_Group/HUD_AVQ32/device/AVQ32.lua",
	{
		-- common links for left/right MDIs, AMPCD, and HUD
		{"ELEC",devices.ELEC_INTERFACE},
		{"FM_PROXY", devices.FM_PROXY}
	}
}

creators[devices.MDI_LEFT] = {
	"F18::avMDI_IP1556A_F18",
	LockOn_Options.script_path.."Multipurpose_Display_Group/MDI_IP1556A/device/MDI_left.lua",
	{
		-- common links for left/right MDIs, AMPCD, and HUD
		{"ELEC", devices.ELEC_INTERFACE},
		{"FM_PROXY", devices.FM_PROXY},
		-- common links for left/right MDIs and AMPCD
		{"MuxManager", devices.MUX},
		{"DMC", devices.DIGITAL_MAP_COMPUTER},
		{"MC2", devices.MISSION_COMPUTER_NO_2},
		{"MAV", devices.MAVERICK_INTERFACE},
		{"WALLEYE", devices.WALLEYE_INTERFACE},
		{"SMS", devices.SMS},
		{"TGP", devices.TGP_INTERFACE},
		-- common links for left/right MDIs
		{"HI", devices.AMPCD},
		{"HUD", devices.HUD},
		{"RDR", devices.RADAR},
	}
}

creators[devices.MDI_RIGHT] = {
	"F18::avMDI_IP1556A_F18",
	LockOn_Options.script_path.."Multipurpose_Display_Group/MDI_IP1556A/device/MDI_right.lua",
	{
		-- common links for left/right MDIs, AMPCD, and HUD
		{"ELEC", devices.ELEC_INTERFACE},
		{"FM_PROXY", devices.FM_PROXY},
		-- common links for left/right MDIs and AMPCD
		{"MuxManager", devices.MUX},
		{"DMC", devices.DIGITAL_MAP_COMPUTER},
		{"MC2", devices.MISSION_COMPUTER_NO_2},
		{"MAV", devices.MAVERICK_INTERFACE},
		{"WALLEYE", devices.WALLEYE_INTERFACE},
		{"SMS", devices.SMS},
		{"TGP", devices.TGP_INTERFACE},
		-- common links for left/right MDIs
		{"HI", devices.AMPCD},
		{"HUD", devices.HUD},
		{"RDR", devices.RADAR},
	}
}

creators[devices.AMPCD] = {
	"F18::avAMPCD_F18",
	LockOn_Options.script_path.."Multipurpose_Display_Group/AMPCD/device/AMPCD.lua",
	{
		-- common links for left/right MDIs, AMPCD, and HUD
		{"ELEC", devices.ELEC_INTERFACE},
		{"FM_PROXY", devices.FM_PROXY},
		-- common links for left/right MDIs and AMPCD
		{"MuxManager", devices.MUX},
		{"DMC", devices.DIGITAL_MAP_COMPUTER},
		{"MC2", devices.MISSION_COMPUTER_NO_2},
		{"MAV", devices.MAVERICK_INTERFACE},
		{"WALLEYE", devices.WALLEYE_INTERFACE},
		{"SMS", devices.SMS},
		{"TGP", devices.TGP_INTERFACE},
	}
}

-- Radio & Comm

creators[devices.INTERCOM] = {
	"F18::avIntercom_AM7360_F18",
	LockOn_Options.script_path.."Radio/Intercom.lua",
	{
		{"ELEC", devices.ELEC_INTERFACE},
		{"UHF1", devices.UHF1},
		{"UHF2", devices.UHF2},
		{"MIDS", devices.MIDS},
		{"RWR", devices.RWR},
		{"SMS", devices.SMS},
	}
}

creators[devices.UHF1] = {
	"F18::avUHF1_F18",
	LockOn_Options.script_path.."Radio/ARC_210_UHF1.lua",
	{
		{"ELEC", devices.ELEC_INTERFACE},
		{"MUX", devices.MUX},
		{"CONTROL_CONVERTER", devices.CONTROL_CONVERTER}
	}
}

creators[devices.UHF2] = {
	"F18::avUHF2_F18",
	LockOn_Options.script_path.."Radio/ARC_210_UHF2.lua",
	{
		{"ELEC", devices.ELEC_INTERFACE},
		{"MUX", devices.MUX},
		{"CONTROL_CONVERTER", devices.CONTROL_CONVERTER}
	}
}

creators[devices.KY58] = {
	"F18::avSecureSpeechSystem_KY_58_F18", 
	"",
	{{"ELEC", devices.ELEC_INTERFACE}}
}

--
creators[devices.RADAR] = {
	"F18::avRadar_APG73_F18",
	LockOn_Options.script_path.."Sensors/Radar/RadarDevice.lua",
	{
		{"ElecInterface",devices.ELEC_INTERFACE},
		{"MuxManager", devices.MUX},
		{"FM_PROXY", devices.FM_PROXY},
		{"IFF", devices.IFF},
		{"MIDS", devices.MIDS},
		{"MC2", devices.MISSION_COMPUTER_NO_2}
	}
}

-- INS/GPS
creators[devices.INS] = {
	"F18::avINS_ASN139_F18",
	LockOn_Options.script_path.."INS_GPS/INS_ASN139.lua",
	{{"ElecInterface",devices.ELEC_INTERFACE},
	 {"MuxManager", devices.MUX},
	 {"FM_PROXY", devices.FM_PROXY}}
}

-- GPS
creators[devices.GPS] = {
	"F18::avGPS_ASN163_F18",
	LockOn_Options.script_path.."INS_GPS/GPS_ASN163.lua",
	{{"ELEC",devices.ELEC_INTERFACE},
	 {"MuxManager", devices.MUX}}
}

-- Magnetic Azimuth Detector
creators[devices.MAD] = {
	"F18::avMAD_DT604A_F18",
	LockOn_Options.script_path.."INS_GPS/MAD_DT604A.lua"
}

-- Armament
-- Implementation of missile features specific for avionic interface
creators[devices.SIDEWINDER_INTERFACE]= {"F18::avSidewinder_Interface",
										"",
										{}
}

creators[devices.MAVERICK_INTERFACE] = {"F18::avMaverick_Interface",
										LockOn_Options.script_path .. "Computers/SMS/maverick_interface.lua",
										{},
										LockOn_Options.script_path .. "Computers/SMS/maverick_commands.lua"
}

creators[devices.WALLEYE_INTERFACE] = {"F18::avWalleye_Interface",
										LockOn_Options.script_path .. "Computers/SMS/walleye_interface.lua",
										{{"DATALINK", devices.DATALINK_INTERFACE}}
}

creators[devices.DATALINK_INTERFACE] = {"F18::avDatalink_Interface",
										LockOn_Options.script_path .. "Computers/SMS/datalink_interface.lua",
										{}
}


-- RNAV
creators[devices.ADF] = {
	"F18::avADF_OA8697ARD_F18",
	LockOn_Options.script_path.."Radio/ADF.lua",
	{{"ELEC",devices.ELEC_INTERFACE}}
}

creators[devices.ANTENNA_SELECTOR] = {
	"F18::avAntennaSelector_F18",
	"",
	{{"ELEC",devices.ELEC_INTERFACE},
	{"UHF1",devices.UHF1},
	{"UHF2",devices.UHF2},
	{"ADF",devices.ADF}}
}

creators[devices.MIDS] = {
	"F18::avMIDS_LVT_F18",
	LockOn_Options.script_path.."Radio/MIDS.lua",
	{
		{"ELEC",devices.ELEC_INTERFACE},
		{"MUX", devices.MUX},
		{"MIDS_RT", devices.MIDS_RT},
		{"RADAR", devices.RADAR},
		{"IFF", devices.IFF},
		{"MC2", devices.MISSION_COMPUTER_NO_2},
	}
}

creators[devices.MIDS_RT] = {
	"F18::avMIDS_RT_1840_F18",
	LockOn_Options.script_path.."Radio/MIDS_RT.lua",
	{}
}


creators[devices.ILS] = {
	"F18::avILS_ARA_63_F18",
	LockOn_Options.script_path.."Radio/ILS.lua",
	{{"ELEC",devices.ELEC_INTERFACE},
	{"INTERCOM",devices.INTERCOM}}
}

-- TEWS
creators[devices.RWR]	= {
	"F18::avRWR_ALR67_F18",
	LockOn_Options.script_path.."TEWS/device/RWR_ALR67.lua",
	{{"ELEC", devices.ELEC_INTERFACE},
	 {"MuxManager", devices.MUX},
	 {"CMDS", devices.CMDS}}
}

creators[devices.CMDS]	= {
	"F18::avCMDS_ALE47_F18",
	LockOn_Options.script_path.."TEWS/device/CMDS_ALE47.lua",
	{{"ELEC", devices.ELEC_INTERFACE},
	 {"MuxManager", devices.MUX}}
}

--
creators[devices.MACROS]	= {
	"F18::avAutostartDevice_F18",
	LockOn_Options.common_script_path.."Macro_handler.lua",
	{
		{"POWER_PLANT", devices.ENGINES_INTERFACE},
		{"CONTROL_INTERFACE", devices.CONTROL_INTERFACE},
		{"CPT_LIGHTS", devices.CPT_LIGTHS},
		{"INS", devices.INS}
	}
}

-- IFF
creators[devices.IFF]	= {
	"F18::avIFF_APX111_F18",
	"",
	{{"ELEC", devices.ELEC_INTERFACE},
	 {"MuxManager", devices.MUX}}
}

-- Helmet
creators[devices.NVG]	= {
	"avNightVisionGoggles",
	LockOn_Options.script_path.."HELMET/NVG.lua",
	{}}

creators[devices.HMD_INTERFACE]	= {
	"F18::avHMD_Interface_F18",
	LockOn_Options.script_path.."HELMET/HMD_Interface.lua",
	{{"ELEC", devices.ELEC_INTERFACE},
	 {"MuxManager", devices.MUX}}
}

-- HMD
creators[devices.HMD]	= {
	"avHMD",
	LockOn_Options.script_path.."HMD/device/HMD.lua",
	{}
}
--
creators[devices.CLC] = {
	"F18::avCommandLaunchComputer_F18",
	LockOn_Options.script_path .. "Computers/SMS/CLC.lua",
	{{"ELEC", devices.ELEC_INTERFACE},
	 {"MuxManager", devices.MUX},
	 {"RWR", devices.RWR},
	 {"Harm_Interface", devices.HARM_INTERFACE}}
}

creators[devices.HARM_INTERFACE] = {
	"F18::avHarm_Interface",
	"",
	{},
	""
}

creators[devices.TGP_INTERFACE] = {
	"F18::avTGP_Interface_F18",
	LockOn_Options.script_path.."Sensors/TGP/TGP.lua",
	{{"ELEC", devices.ELEC_INTERFACE},
	 {"MuxManager", devices.MUX}},
	""
}

-- Indicators
indicators = {}

-- Controls indicator
indicators[#indicators + 1] = {
	"F18::ccControlsIndicator_F18",
	LockOn_Options.script_path.."ControlsIndicator/ControlsIndicator.lua",
	devices.CONTROL_INTERFACE
}

-- Head-up Display
indicators[#indicators + 1] = {
	"F18::ccHUD_AVQ32_F18",
	LockOn_Options.script_path.."Multipurpose_Display_Group/HUD_AVQ32/indicator/AVQ32_init.lua",
	devices.HUD,
	{
		{"HUD-CENTER", "HUD-DOWN", "HUD-RIGHT"},
		{sx = 0, sy = 0, sz = 0}
	}
}

-- Left MDI
indicators[#indicators + 1] = {
	"F18::ccMPD_F18",
	LockOn_Options.script_path.."Multipurpose_Display_Group/MDI_IP1556A/indicator/MDI_left_init.lua",
	devices.MDI_LEFT,
	{
		{"MDI-L-CENTER", "MDI-L-DOWN", "MDI-L-RIGHT"},
		{sx = 0, sy = 0, sz = 0},
		1
	}
}

-- Right MDI
indicators[#indicators + 1] = {
	"F18::ccMPD_F18",
	LockOn_Options.script_path.."Multipurpose_Display_Group/MDI_IP1556A/indicator/MDI_right_init.lua",
	devices.MDI_RIGHT,
	{
		{"MDI-R-CENTER", "MDI-R-DOWN", "MDI-R-RIGHT"},
		{sx = 0, sy = 0, sz = 0},
		2
	}
}

-- AMPCD
indicators[#indicators + 1] = {
	"F18::ccMPD_F18",
	LockOn_Options.script_path.."Multipurpose_Display_Group/AMPCD/indicator/AMPCD_init.lua",
	devices.AMPCD,
	{
		{"AMPCD-CENTER", "AMPCD-DOWN", "AMPCD-RIGHT"},
		{sx = 0, sy = 0, sz = 0},
		3
	}
}

-- IFEI
indicators[#indicators + 1] = {
	"F18::ccIFEI_F18",
	LockOn_Options.script_path.."IFEI/indicator/IFEI_init.lua",
	devices.IFEI,
	{{"IFEI-CENTER","IFEIL-DOWN","IFEI-RIGHT"},
	{sx_l = 0.0004}}
}

-- UFC
indicators[#indicators + 1] = {
	"F18::ccUFC_F18",
	LockOn_Options.script_path.."UFC/indicator/UFC_init.lua",
	devices.UFC,
	{{"UFC-CENTER","UFC-DOWN","UFC-RIGHT"},
	{sx_l = 0.0}}
}

-- RWR
indicators[#indicators + 1] = {
	"F18::ccRWR_ALR67_F18",
	LockOn_Options.script_path.."TEWS/indicator/RWR_ALR67_init.lua",
	devices.RWR,
	{{"RWR-CENTER", "RWR_DOWN", "RWR-RIGHT"},
	{sy_l = 0.0, sz_l = -0.0}}
	--{sy_l = 0.0003, sz_l = -0.0004}}
}

-- HMD
indicators[#indicators + 1] = {
	"ccHMD",
	LockOn_Options.script_path.."HMD/indicator/HMD_init.lua",
	devices.HMD
}

disable_kneeboard_render_target = false
---------------------------------------------
dofile(LockOn_Options.common_script_path.."KNEEBOARD/declare_kneeboard_device_Resize.lua")
---------------------------------------------
dofile(LockOn_Options.common_script_path.."PADLOCK/PADLOCK_declare.lua")
---------------------------------------------
