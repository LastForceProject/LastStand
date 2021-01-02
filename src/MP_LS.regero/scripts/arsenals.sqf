// -- Регулярка.

ars16 = [] spawn 
{
	_boxes = [ars_16];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

ars41 = [] spawn 
{
	_boxes = [ars_41 ,ars_41_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsDOOM = [] spawn 
{
	_boxes = [ars_doom ,ars_doom_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsLSG = [] spawn 
{
	_boxes = [ars_lsg ,ars_lsg_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsRS = [] spawn 
{
	_boxes = [ars_rs ,ars_rs_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsCG = [] spawn 
{
	_boxes = [ars_cg ,ars_cg_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

ars327 = [] spawn 
{
	_boxes = [ars_327 ,ars_327_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

ars212 = [] spawn 
{
	_boxes = [ars_212 ,ars_212_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

ars501 = [] spawn
{
	_boxes = [ars_501 ,ars_501_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

ars5012 = [] spawn
{
	_boxes = [ars_5012 ,ars_5012_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

// -- Спецура.

arsRC = [] spawn 
{
	_boxes = [ars_rc ,ars_rc_2];
	{
	_box = _x;
	[_box,
	["RC_Alpha_RTO_Backpack_Elyrea", "RC_Alpha_Tech_Backpack_Goran","Clone_Rank_LT","Clone_Rank_CPT","Clone_Rank_MAJ","Clone_Rank_CC","Clone_Rank_MC","RC_Alpha_EOD_Backpack","RC_Solus_nvg_02","RC_Solus_BackPack_02","RC_Solus_eod_armor_V2_02","RC_Solus_Uniform_02","RC_Solus_Helmet_02","TermMineC_Mag","RC_Solus_BPack_Nort","RC_Solus_Helmet_Nort","RC_Solus_nvg_Nort","RC_Solus_Uniform_Nort","RC_Solus_Antena_Omen","RC_Solus_Helmet_Omen","RC_Solus_BPack_Kappa","RC_Solus_Helmet_Kappa","RC_Solus_Uniform_Kappa","RC_Solus_Uniform_Omen","RC_Solus_eod_armor_V2_Omen","RC_Solus_EOD_Backpack_Omen","SWLB_OmegaFi_Nvg","RD501_DC_15_RB","SWLB_clone_RC_HUD","SWLB_clone_commander_binocular","SWLB_clone_commander_binocular_night","ItemMap","ItemCompass","ItemGPS","ACE_FlareTripMine_Mag","ACE_adenosine","ACE_epinephrine","ACE_personalAidKit","ACE_EarPlugs","kss_bottle_big","kss_bottle_small","kss_mre","ACE_SpottingScope","ACE_IR_Strobe_Item","ACE_CableTie","ACE_DefusalKit","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_bodyBag","MineDetector","ACE_morphine","ToolKit","ACE_plasmaIV","ACE_plasmaIV_250","ACE_plasmaIV_500","ACE_quikclot","ACE_elasticBandage","ACE_fieldDressing","ACE_EntrenchingTool","ACE_Tripod","ACE_splint","ACE_M26_Clacker","SWLW_beltGrenade_mag","SWLW_RPS6","ItemWatch","SWLB_comlink","SWLB_clone_binocular","tf_microdagr","SmokeShell","SmokeShellYellow","SmokeShellBlue","SmokeShellPurple","SmokeShellOrange","SmokeShellRed","SmokeShellGreen","ACE_HandFlare_Red","ACE_HandFlare_Green","ACE_HandFlare_Yellow","ACE_HandFlare_White","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiYellow","ACE_Chemlight_HiRed","ACE_Chemlight_HiWhite","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_Orange","ACE_Chemlight_IR","ACE_Chemlight_White","Chemlight_blue","Chemlight_red","Chemlight_green","Chemlight_yellow","ACE_packingBandage","ACE_tourniquet","RC_Helmet_13","RC_Helmet_DeltaScorch","RC_HelmetDeltaSev","RC_Helmet_MPGunner","RC_Helmet_MPMarksman","RC_Helmet_Omega","RC_Helmet_MPRecon","RC_Helmet_MPStealth","RC_Helmet_YayaxCov","RC_Helmet_YayaxDev","RC_Helmet_YayaxJind","RC_Helmet_YayaxYover","RC_Helmet_DeltaFixer","RC_Helmet_DeltaBoss","RC_Helmet_BravoRam","RC_Helmet_Bravo4","RC_Helmet_Bravo3","RC_Helmet_Bravo2","RC_Helmet_AiwhaZag","RC_Helmet_AiwhaTyto","RC_Helmet_AiwhaSarge","RC_Helmet_AiwhaDikut","RC_Helmet","RC_Uniform_13","RC_DeltaBoss_Uniform","RC_DeltaFixer_Uniform","RC_DeltaScorch_Uniform","RC_DeltaSev_Uniform","RC_AiwhaSarge_Uniform","RC_AiwhaTyto_Uniform","RC_AiwhaZag_Uniform","RC_Bravo2_Uniform","RC_Bravo3_Uniform","RC_Bravo4_Uniform","RC_BravoRam_Uniform","RC_MPGunner_Uniform","RC_MPMarksman_Uniform","RC_MPRecon_Uniform","RC_YayaxCov_Uniform","RC_YayaxDev_Uniform","RC_YayaxJind_Uniform","RC_YayaxYover_Uniform","RC_Uniform","RC_AiwhaDikut_Uniform","RC_eod_armor_V2","RC_sniper_armor_V2","RC_sl_armor_V2","RC_tech_armor_V2","RC_basic_armor_v2","RC_backpack","RC_EOD_Backpack","RC_RTO_Backpack_13","RC_RTO_Backpack","RC_Tech_Backpack","RC_nvg_antenna","RC_nvg","RC_Solus_Helmet_66","RC_Solus_Helmet_47","RC_Solus_Uniform_66","RC_Solus_Uniform_47","RC_Solus_eod_armor_V2","RC_Solus_EOD_Backpack_47","RC_Solus_nvg_47","RC_Solus_Backpack_66","B_UAV_06_backpack_F","B_UavTerminal","swop_mag_flashbang","RC_OmegaNiner_backpack","RC_DeltaBoss_backpack","RC_DeltaFixer_backpack","RC_DeltaSev_backpack","RC_MPGunner_backpack","RC_MPMarksman_backpack","RC_Omega_backpack","RC_MPRecon_backpack","RC_MPStealth_backpack","RC_DeltaScorch_backpack","RC_OmegaDarman_backpack","RC_YayaxDev_backpack","RC_YayaxYover_backpack","RC_Yivra_Helmet_Naak","RC_Yivra_Helmet_Elyrea","RC_Yivra_Helmet_Aden","RC_Yivra_Helmet_Goran","RC_Yivra_Uniform_Naak","RC_Yivra_Uniform_Elyrea","RC_Yivra_Uniform_Goran","RC_Yivra_Uniform_Aden","RC_Yivra_s1_armor_Elyrea","RC_Yivra_eod_armor_V2_Aden","RC_Yivra_Sniper_armor_V2_Naak","RC_Yivra_Tech_Backpack_Goran","RC_Yivra_EOD_Backpack_Aden","RC_Yivra_Backpack_Naak","RC_Yivra_RTO_Backpack_Elyrea","RC_Yivra_antenna_Goran","RC_Yivra_nvg_Goran","RC_Yivra_nvg_Naak","RC_Yivra_antenna_Aden","LW_DC17M","LW_DC17M_47","RD501_scope_dc_15a_acog","acc_flashlight","acc_pointer_IR","ACE_acc_pointer_green","RC_MPStealth_Uniform","RC_OmegaNiner_Uniform","RC_OmegaFi_Uniform","RC_OmegaDarman_Uniform","LW_attachment_DC17M_blaster","LW_attachment_DC17M_sniper","LW_attachment_DC17M_at","LW_attachment_scope_DC17M_sniper","SWOP_DC17M_Sniper","RC_Alpha_Helmet_2","RC_Alpha_Helmet_1","RC_Alpha2_Uniform","RC_Alpha1_Uniform","RC_Alpha_Backpack","RC_Omega_Tech_backpack","OPTRE_EyePiece","OPTRE_HUD_g_Glasses","OPTRE_HUD_Glasses","OPTRE_HUD_p_Glasses","OPTRE_HUD_r_Glasses","OPTRE_HUD_w_Glasses","OPTRE_HUD_b_Glasses","B_Parachute","TrainingMine_Mag","RC_Solus_Helmet_Sand","RC_Solus_Uniform_Sand","RC_Solus_eod_armor_Sand","RC_Solus_Backpack_Sand","RC_Solus_EOD_Backpack_Sand","RC_Solus_Tech_Backpack_Sand","RC_Solus_Tech_Backpack_Forest","RC_Solus_EOD_Backpack_Forest","RC_Solus_Backpack_Forest","RC_Solus_eod_armor_Forest","RC_Solus_Uniform_Forest","RC_Solus_Helmet_Forest","RC_Solus_Antena_Forest","RC_Solus_nvg_Forest","RC_Solus_Antena_Sand","RC_Solus_nvg_Sand","RC_Omega_sniper_armor_V2","RC_Omega_eod_armor_V2","RC_Solus_s1_armor_Clever","RC_Solus_Uniform_Clever","RC_Solus_Helmet_Clever","RC_Solus_Backpack_Clever","LW_DC17M_83","RC_Solus_Antena_Clever","RC_Solus_nvg_Clever","SWLW_DC15SA","RD501_DC15_razor_blade_x9_mag","SWLW_rps6_mag","LW_DC17M_Mag","LW_DC17M_Sniper_Mag","LW_DC17M_AT_Mag","LW_DC17M_AP_Mag","SWOP_DC17M_Sniper_Mag","SWLW_DC15SA_Mag","Laserbatteries","SWLB_CEE_Gregor_Helmet","SWLB_CEE_Gregor_Uniform","SWLB_CEE_Gregor_Backpack","IEDUrbanBig_Remote_Mag","IEDLandBig_Remote_Mag","IEDLandSmall_Remote_Mag","IEDUrbanSmall_Remote_Mag","APERSMine_Range_Mag","APERSTripMine_Wire_Mag","APERSBoundingMine_Range_Mag","ATMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","APERSMineDispenser_Mag","SatchelCharge_Remote_Mag","DemoCharge_Remote_Mag","ClaymoreDirectionalMine_Remote_Mag","JLTS_intel_holoProjector","C12_Remote_Mag","UNSCMine_Range_Mag","SWLW_clones_spec_demo_mag","RC_Solus_Helmet_Tox","RC_Solus_Uniform_Tox","RC_Solus_BPack_Tox","OPTRE_NVG"]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsARC = [] spawn 
{
	_boxes = [ars_arc ,ars_arc_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsARF = [] spawn 
{
	_boxes = [ars_arf ,ars_arf_2];
	{
	_box = _x;
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsDEC = [] spawn
{
	_boxes = [ars_dec ,ars_dec_2];
	{
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsZulu = [] spawn 
{
	_boxes = [ars_zulu ,ars_zulu_2];
	{
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsDH = [] spawn 
{
	_boxes = [ars_dh ,ars_dh_2];
	{
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsFreya = [] spawn 
{
	_boxes = [ars_f ,ars_f_2];
	{
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

// -- Жиды 

arsJedi = [] spawn
{
	_boxes = [ars_jedi ,ars_jedi_2];
	{
	_box = _x;
	[_box,	["MechArmor_h_LOKI_white_CombatUniform", "Hid_Heav_Protect_armor", "As_helmet2_white", "OPTRE_HUD_r_Glasses","WBK_Cybercrystal","Clone_Rank_LT","Clone_Rank_CPT","Clone_Rank_MAJ","Clone_Rank_CC","Clone_Rank_MC","OPTRE_UNSC_CH252_Helmet_Vacuum_SNO","SWLB_CEE_Clone_Scarf","OPTRE_ONI_Researcher_Headgear","U_O_R_Gorka_01_black_F","OPTRE_ONI_Researcher_Uniform","SS_JEDIBA_U","Jedi_H","SWLB_comlink_hush98","SWOP_ImpEngineerHelm","B_UavTerminal","SWOP_B_DioPackUAV","WBK_lightsaber4_jedi","WBK_lightsaber4_green","CG_Uniform_Jedi","66_Uniform_Jedi","501_Uniform_Jedi","41_Uniform_Jedi","327_Uniform_Jedi","21_Uniform_Jedi","212_Uniform_Jedi","104_Uniform_Jedi","Void_Uniform_Jedi","Void_HelmetP1_Jedi","CG_HelmetP1_Jedi","66_HelmetP1_Jedi","501_HelmetP1_Jedi","41_HelmetP1_Jedi","327_HelmetP1_Jedi","21_HelmetP1_Jedi","104_HelmetP1_Jedi","212_HelmetP1_Jedi","WBK_lightsaber4_purple","WBK_lightsaber4_yellow","WBK_lightsaber3_jedi","WBK_lightsaber3_green","WBK_lightsaber3_pink","WBK_lightsaber3_purple","WBK_lightsaber3_white","WBK_lightsaber3_yellow","WBK_lightsaber2_jedi","WBK_lightsaber2_green","WBK_lightsaber2_pink","WBK_lightsaber2_purple","WBK_lightsaber2_white","WBK_lightsaber2_yellow","WBK_lightsaber1_jedi","WBK_lightsaber1_green","WBK_lightsaber1_pink","WBK_lightsaber1_purple","WBK_lightsaber1_white","WBK_lightsaber1_yellow","WBK_lightsaber_jedi","WBK_lightsaber_green","WBK_lightsaber_pink","WBK_lightsaber_purple","WBK_lightsaber_white","WBK_lightsaber_yellow","WBK_lightsaberOldRep_jedi","WBK_TrainingSword","ice123_apo_hood_WH","ice123_apo_hood_WH_P1","ice123_apo_hood_WH_P2","ice123_apo_hood_BL_B","ice123_apo_hood_BL_P1","ice123_apo_hood_BL_P2","ice123_apo_hood","ice123_apo_hood_P1","ice123_apo_hood_P2","SWOP_DengarHelm","OPTRE_ONI_Researcher_Headgear","mgsr_headbag","SWOP_Jedi_hero2_F_CombatUniform","SWOP_Jedi_hero_F_CombatUniform","SWOP_Jedi_mantle_F_CombatUniform","SWOP_Jedi_mantle2_F_CombatUniform","SWOP_jedi_padawan_F_CombatUniform","SWOP_Jedi_pallium_F_CombatUniform","SWOP_Jedi_temple_F_CombatUniform","SWOP_Jedi_training_F_CombatUniform","RD501_SWOP_Resistance_HeavyUnif_KhakiR_F_CombatUniform","SWOP_Resistance_HeavyUnif_KhakiR_F_CombatUniform","RD501_SWOP_RebSc_Bl_CombatUniform","SWOP_RebGreyB_F_CombatUniform","SWOP_Arena_F_CombatUniform","SWOP_Reb_f_Kel_Dor2_CombatUniform","SWOP_jedi_vest_invisible","SWOP_skywalker_jediorder_cape","SWOP_skywalker_cape","SWOP_skywalker_vest","mgsr_poncho_dry_vest_BL","mgsr_poncho_dry_vest_BR","mgsr_poncho_dry_vest","mgsr_poncho_dry_white_vest_WH","SWOP_B_CloneDVa","RD501_SWOP_B_CloneDVa","G_Aviator","G_Balaclava_combat","G_Balaclava_oli","G_Balaclava_lowprofile","G_Balaclava_blk","G_Bandanna_beast","G_Bandanna_tan","G_Bandanna_aviator","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_khk","G_Bandanna_blk","G_Combat","G_Combat_Goggles_tna_F","G_Lady_Blue","G_EyeProtectors_F","G_EyeProtectors_Earpiece_F","G_Squares","G_Squares_Tinted","G_Spectacles","G_RegulatorMask_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_blk_F","G_Sport_Blackred","G_Balaclava_TI_G_tna_F","G_Sport_Greenblack","G_Sport_Red","G_Sport_Checkered","G_Sport_BlackWhite","G_Sport_Blackyellow","G_Tactical_Clear","G_Tactical_Black","G_Shades_Blue","G_Shades_Black","G_Spectacles_Tinted","shemaghface_od","shemagh2_goggclr_od","shemagh2_goggylw_od","shemagh2_goggblk_od","shemagh2_goggblk_tan","shemaghface_tan","shemagh2_goggclr_tan","shemagh2_goggylw_tan","shemaghface_white","shemagh2_goggblk_white","shemagh2_goggclr_white","shemagh2_goggylw_white","mcu2p2_grey","goggles_blk","goggles_clear","goggles_yellow","tactical_glassesblk","tactical_glassesclr","tactical_glassesylw","shemagh_od","shemagh_goggblk_od","shemagh_goggclr_od","shemagh_goggylw_od","shemagh_tan","shemagh_goggblk_tan","shemagh_goggclr_tan","shemagh_goggylw_tan","shemagh_white","shemagh_goggblk_white","shemagh_goggclr_white","shemagh_goggylw_white","shemagh_looseod","shemagh_loosetan","shemagh_loose","shemagh_looseodBG","shemagh_loosewhiteBG","shemagh_loosetanBG","shemagh_looseodCG","shemagh_loosetanCG","shemagh_loosewhiteCG","shemagh_looseodYG","shemagh_loosewhiteYG","shemagh_loosetanOG","shemagh_tight_od","SWLB_CEE_Clone_Scarf","SWLB_CEE_Clone_Scarf_Blue","SWLB_CEE_Clone_Scarf_Green","SWLB_CEE_Clone_Scarf_Orange","SWLB_CEE_Clone_Scarf_Red","SWLB_CEE_Clone_Scarf_Stewart","SWLB_CEE_Clone_Scarf_White","mgsr_eyepatch_goggles","mgsr_headbag_goggles","rd501_swop_nvchipclean","SWOP_NVChipClean","SWOP_NVChip","SWOP_NVChip2","Binocular","SWLB_clone_commander_binocular","SWLB_clone_commander_binocular_night","SWLB_clone_binocular","ItemMap","ItemCompass","SWLB_comlink","ItemWatch","ItemGPS","SmokeShellGreen","SmokeShellRed","SmokeShellOrange","SmokeShellPurple","SmokeShellBlue","kss_mre","ACE_IR_Strobe_Item","ACE_CableTie","ACE_DefusalKit","ACE_bodyBag","MineDetector","ACE_EntrenchingTool","ACE_Altimeter","tf_microdagr","kss_bottle_big","kss_bottle_small","lightsaberG_swing","lightsaber_style_1","Force_tir_2","Force_tir_3","Force_tir_1","Laserbatteries","G_Bandanna_sport","lightsaber_style_2","SWOP_Reb_f_kaleesh_CombatUniform","SWLB_CEE_Clone_Hood","Sith_H","SS_GRIMMJOW_U","RD501_Invis_LR_Backpack","SWOP_skywalker_F_CombatUniform","H_RacingHelmet_1_black_F","H_Beret_blk","SS_OBI","SWOP_RebDsvet_mon_calamari_rebelI_CombatUniform","OPTRE_UNSC_CH252_Helmet2_Vacuum_SNO","OPTRE_UNSC_M52A_Armor3_URB","SWLB_mando_uniform","OPTRE_UNSC_CH252D_Helmet","OPTRE_UNSC_M52D_Armor","erwin_H","SS_ERWIN_U","G_Blindfold_01_white_F","SS_JEDI_U","LST_501_Uniform_Jedi","LST_501_Uniform_Jedi_Anakin","LST_327_Uniform_Jedi","LST_41_Uniform_Jedi","LST_101_Uniform_Jedi","LST_CG_Uniform_Jedi","LST_RS_Uniform_Jedi"]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

//   --  Великие наймы, шалупонь и подсосы кредо, да похуй лыл
// 13-ые это КГБ от мира ЗВ
ars13 = [] spawn {
	_boxes = [ars_13 ,ars_13_2];
	{
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

ars13spec = [] spawn {
	_boxes = [ars_13_spec ,ars_13_spec_2];
	{
	[_box,
	[]] call ace_arsenal_fnc_initBox;
	} forEach _boxes;
};

arsNeutral = [] spawn {
	_box = ars_neutral;
	[_box, 
	[]] call ace_arsenal_fnc_initBox;
};

arsMando = [] spawn {
	_box = ars_mando;
	[_box, 
	[]] call ace_arsenal_fnc_initBox;
};

arsTG = [] spawn {
	_box = ars_tg;
	[_box, 
	[]] call ace_arsenal_fnc_initBox;
};
