// -- Регулярка.

arsRS = [] spawn 
{
	_boxes = [ars_rs_0,ars_rs_1,ars_rs_2,ars_rs_3,ars_rs_4,ars_rs_5];
	{
	_box = _x;
	[_box,
	["SWLW_DC15X_wooden","SWLW_DC15X","SWLB_clone_P1Sergeant_helmet","SWLB_clone_P1Sergeant_uniform","SWLB_clone_P1Captain_uniform","SWLB_clone_P1Captain_helmet","SWLB_clone_P1Lieutenant_helmet","SWLB_clone_P1Lieutenant_uniform","SWLB_clone_uniform","SWLB_P1_Pilot_Helmet","SWLB_clone_P1_helmet","SWLB_clone_backpack","LS_clone_backpack_eod","SWLB_clone_backpack_heavy","SWLB_clone_backpack_medic","SWLB_clone_backpack_RTO","SWLB_clone_P1_HUD","442_clone_p1_glasses","SWLB_clone_commander_binocular","SWLB_clone_commander_binocular_night","SWLB_clone_binocular","ItemMap","ItemCompass","SWLB_comlink","tf_microdagr","ACE_Altimeter","ItemWatch","ItemGPS","SWLW_beltGrenade_mag","SWLW_DC17","JLTS_DC17SA","SWLW_rps6_mag","ls_mag_dc17dual_20rnd","SWLB_CEE_Engineer_Vest","SWLB_CEE_Engineer_Vest_Officer","SWLB_CEE_Engineer_Vest_NCO","SWLB_clone_basic_armor","ACE_personalAidKit","ACE_epinephrine","ACE_tourniquet","ACE_CableTie","ACE_Fortify","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_bodyBag","MineDetector","ACE_morphine","ToolKit","JLTS_riot_shield_item","ACE_quikclot","FirstAidKit","ACE_plasmaIV","ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_elasticBandage","ACE_fieldDressing","ACE_EntrenchingTool","ACE_packingBandage","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ACE_splint","DemoCharge_Remote_Mag","ACE_M26_Clacker","Clone_Rank_LT","Clone_Rank_CPT","Clone_Rank_SG","ls_mag_stunLow_2rnd","SWLW_DC17_Mag","SWLW_flareRed_mag","SWLW_smokeRed_mag","JLTS_DC17SA_mag","JLTS_stun_mag_short","JLTS_stun_mag_long","SWLW_rps6_disposable","3AS_DC15L_F","3AS_200Rnd_EC40_Mag","SWLW_DC15BR","SWLW_DC15BR_Mag","SWLW_DP20","SWLW_DP20_Mag","SWLW_GL","SWLW_mag_40mm_1rnd","SWLW_mag_40mm_6rnd","ls_gar_mortar_backpack","3AS_Republic_Mortar_Bag","3AS_DC15S_F","3AS_DC15A_F","3AS_60Rnd_EC30_mag","3AS_45Rnd_EC50_Mag","B_Parachute","3AS_Optic_Red_DC15A","3AS_Optic_DC15L","Laserbatteries","JLTS_DC17SA_flashlight","acc_flashlight","acc_pointer_IR"]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};






// -- Спецура.

arsRC = [] spawn 
{
	_boxes = [ars_rc_0,ars_rc_1,ars_rc_3,ars_rc_4,ars_rc_5];
	{
	_box = _x;
	[_box,
	["RC_Uniform","RC_Helmet","RC_eod_armor_V2","RC_sniper_armor_V2","RC_sl_armor_V2","RC_tech_armor_V2","RC_basic_armor_v2","SWLB_clone_commando_backpack_k2","SWLB_clone_commando_backpack_k2_eod","SWLB_clone_commando_backpack_k2_rto","SWLB_clone_commando_backpack_k2_tech","RC_nvg_antenna","RC_nvg","LW_DC17M","LW_attachment_DC17M_at","LW_attachment_DC17M_blaster","LW_attachment_DC17M_sniper","LW_DC17M_Mag","LW_DC17M_Sniper_Mag","LW_DC17M_AT_Mag","SWLW_DC15SA","SWLW_DC15SA_Mag","SWLW_beltGrenade_mag","Chemlight_yellow","Chemlight_red","Chemlight_green","Chemlight_blue","ACE_Chemlight_White","ACE_Chemlight_IR","ACE_Chemlight_Orange","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_HiWhite","ACE_Chemlight_HiYellow","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiBlue","ACE_M14","Luma_Blue","Luma_Green","Luma_Red","Luma_Yellow","ACE_HandFlare_White","ACE_HandFlare_Yellow","ACE_HandFlare_Green","ACE_HandFlare_Red","OPTRE_M2_Smoke_Yellow","OPTRE_M2_Smoke","OPTRE_M2_Smoke_Red","OPTRE_M2_Smoke_Purple","OPTRE_M2_Smoke_Orange","OPTRE_M2_Smoke_Green","OPTRE_M2_Smoke_Blue","ACE_CTS9","ItemWatch","tf_microdagr","SWLB_comlink","ItemCompass","ItemMap","SWLB_clone_commander_binocular","SWLB_clone_commander_binocular_night","SWLB_clone_binocular","OPTRE_EyePiece","OPTRE_HUD_b_Glasses","OPTRE_HUD_g_Glasses","OPTRE_HUD_Glasses","OPTRE_HUD_p_Glasses","OPTRE_HUD_r_Glasses","OPTRE_HUD_w_Glasses","C7_Remote_Mag","C12_Remote_Mag","SWLW_clones_spec_demo_mag","SWLW_DetPack_remote_mag","3AS_DetPack","UNSCMine_Range_Mag","RTX_RemoteMagazine","SWLW_clones_spec_breach_mag","APERSMineDispenser_Mag","ACE_epinephrine","ACE_personalAidKit","ACE_M26_Clacker","ACE_tourniquet","ACE_Fortify","ACE_CableTie","ACE_IR_Strobe_Item","ACE_bloodIV","ACE_bloodIV_250","ACE_DefusalKit","ACE_bloodIV_500","ACE_bodyBag","MineDetector","ACE_morphine","ToolKit","ACE_plasmaIV","ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_quikclot","ACE_elasticBandage","ACE_fieldDressing","ACE_EntrenchingTool","ACE_packingBandage","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ACE_splint","LW_attachment_scope_DC17M_sniper","LW_DC17M_AP_Mag","RC_Helmet_DeltaFixer","RC_Helmet_DeltaScorch","RC_HelmetDeltaSev","RC_Helmet_DeltaBoss","RC_DeltaFixer_backpack","RC_DeltaSev_backpack","RC_DeltaScorch_backpack","RC_DeltaBoss_backpack"]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};


// -- Жиды 

arsJedi = [] spawn
{
	_boxes = [ars_jedi ,ars_jedi_2];
	{
	_box = _x;
	[_box,	["MechArmor_h_LOKI_white_CombatUniform","Hid_Heav_Protect_armor","As_helmet2_white","OPTRE_HUD_r_Glasses","WBK_Cybercrystal","Clone_Rank_LT","Clone_Rank_CPT","Clone_Rank_MAJ","Clone_Rank_CC","Clone_Rank_MC","OPTRE_UNSC_CH252_Helmet_Vacuum_SNO","SWLB_CEE_Clone_Scarf","OPTRE_ONI_Researcher_Headgear","U_O_R_Gorka_01_black_F","OPTRE_ONI_Researcher_Uniform","SS_JEDIBA_U","Jedi_H","SWLB_comlink_hush98","B_UavTerminal","WBK_lightsaber4_jedi","WBK_lightsaber4_green","WBK_lightsaber4_purple","WBK_lightsaber4_yellow","WBK_lightsaber3_jedi","WBK_lightsaber3_green","WBK_lightsaber3_pink","WBK_lightsaber3_purple","WBK_lightsaber3_white","WBK_lightsaber3_yellow","WBK_lightsaber2_jedi","WBK_lightsaber2_green","WBK_lightsaber2_pink","WBK_lightsaber2_purple","WBK_lightsaber2_white","WBK_lightsaber2_yellow","WBK_lightsaber1_jedi","WBK_lightsaber1_green","WBK_lightsaber1_pink","WBK_lightsaber1_purple","WBK_lightsaber1_white","WBK_lightsaber1_yellow","WBK_lightsaber_jedi","WBK_lightsaber_green","WBK_lightsaber_pink","WBK_lightsaber_purple","WBK_lightsaber_white","WBK_lightsaber_yellow","WBK_lightsaberOldRep_jedi","WBK_TrainingSword","G_Aviator","G_Balaclava_combat","G_Balaclava_oli","G_Balaclava_lowprofile","G_Balaclava_blk","G_Bandanna_beast","G_Bandanna_tan","G_Bandanna_aviator","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_khk","G_Bandanna_blk","G_Combat","G_Combat_Goggles_tna_F","G_Lady_Blue","G_EyeProtectors_F","G_EyeProtectors_Earpiece_F","G_Squares","G_Squares_Tinted","G_Spectacles","G_RegulatorMask_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_blk_F","G_Sport_Blackred","G_Balaclava_TI_G_tna_F","G_Sport_Greenblack","G_Sport_Red","G_Sport_Checkered","G_Sport_BlackWhite","G_Sport_Blackyellow","G_Tactical_Clear","G_Tactical_Black","G_Shades_Blue","G_Shades_Black","G_Spectacles_Tinted","shemaghface_od","shemagh2_goggclr_od","shemagh2_goggylw_od","shemagh2_goggblk_od","shemagh2_goggblk_tan","shemaghface_tan","shemagh2_goggclr_tan","shemagh2_goggylw_tan","shemaghface_white","shemagh2_goggblk_white","shemagh2_goggclr_white","shemagh2_goggylw_white","mcu2p2_grey","goggles_blk","goggles_clear","goggles_yellow","tactical_glassesblk","tactical_glassesclr","tactical_glassesylw","shemagh_od","shemagh_goggblk_od","shemagh_goggclr_od","shemagh_goggylw_od","shemagh_tan","shemagh_goggblk_tan","shemagh_goggclr_tan","shemagh_goggylw_tan","shemagh_white","shemagh_goggblk_white","shemagh_goggclr_white","shemagh_goggylw_white","shemagh_looseod","shemagh_loosetan","shemagh_loose","shemagh_looseodBG","shemagh_loosewhiteBG","shemagh_loosetanBG","shemagh_looseodCG","shemagh_loosetanCG","shemagh_loosewhiteCG","shemagh_looseodYG","shemagh_loosewhiteYG","shemagh_loosetanOG","shemagh_tight_od","SWLB_CEE_Clone_Scarf_Blue","SWLB_CEE_Clone_Scarf_Green","SWLB_CEE_Clone_Scarf_Orange","SWLB_CEE_Clone_Scarf_Red","SWLB_CEE_Clone_Scarf_Stewart","SWLB_CEE_Clone_Scarf_White","Binocular","SWLB_clone_commander_binocular","SWLB_clone_commander_binocular_night","SWLB_clone_binocular","ItemMap","ItemCompass","SWLB_comlink","ItemWatch","ItemGPS","SmokeShellGreen","SmokeShellRed","SmokeShellOrange","SmokeShellPurple","SmokeShellBlue","ACE_IR_Strobe_Item","ACE_CableTie","ACE_DefusalKit","ACE_bodyBag","MineDetector","ACE_EntrenchingTool","ACE_Altimeter","tf_microdagr","lightsaber_style_1","Force_tir_2","Force_tir_3","Force_tir_1","Laserbatteries","G_Bandanna_sport","lightsaber_style_2","SWLB_CEE_Clone_Hood","Sith_H","SS_GRIMMJOW_U","H_RacingHelmet_1_black_F","H_Beret_blk","OPTRE_UNSC_CH252_Helmet2_Vacuum_SNO","OPTRE_UNSC_M52A_Armor3_URB","OPTRE_UNSC_CH252D_Helmet","OPTRE_UNSC_M52D_Armor","erwin_H","SS_ERWIN_U","G_Blindfold_01_white_F","SS_JEDI_U","LST_501_Uniform_Jedi","LST_501_Uniform_Jedi_Anakin","LST_327_Uniform_Jedi","LST_41_Uniform_Jedi","LST_101_Uniform_Jedi","LST_CG_Uniform_Jedi","LST_RS_Uniform_Jedi","Hid_back_pack_v1"]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};










