//Allow player to respawn with his loadout? If true unit will respawn with all ammo from initial save! Set to false to disable this and rely on other scripts!
vas_onRespawn = false;
//Preload Weapon Config?
vas_preload = true;
//If limiting weapons its probably best to set this to true so people aren't loading custom loadouts with restricted gear.
vas_disableLoadSave = false;
//Amount of save/load slots
vas_customslots = 14; //14 is actually 15 slots, starts from 0 to whatever you set, so always remember when setting a number to minus by 1, i.e 12 will be 11.
//Disable 'VAS hasn't finished loading' Check !!! ONLY RECOMMENDED FOR THOSE THAT USE ACRE AND OTHER LARGE ADDONS !!!
vas_disableSafetyCheck = false;
/*
	NOTES ON EDITING!
	YOU MUST PUT VALID CLASS NAMES IN THE VARIABLES IN AN ARRAY FORMAT, NOT DOING SO WILL RESULT IN BREAKING THE SYSTEM!
	PLACE THE CLASS NAMES OF GUNS/ITEMS/MAGAZINES/BACKPACKS/GOGGLES IN THE CORRECT ARRAYS! TO DISABLE A SELECTION I.E
	GOGGLES vas_goggles = [""]; AND THAT WILL DISABLE THE ITEM SELECTION FOR WHATEVER VARIABLE YOU ARE WANTING TO DISABLE!
	
														EXAMPLE
	vas_weapons = ["srifle_EBR_ARCO_point_grip_F","arifle_Khaybar_Holo_mzls_F","arifle_TRG21_GL_F","Binocular"];
	vas_magazines = ["30Rnd_65x39_case_mag","20Rnd_762x45_Mag","30Rnd_65x39_caseless_green"];
	vas_items = ["ItemMap","ItemGPS","NVGoggles"];
	vas_backpacks = ["B_Bergen_sgg_Exp","B_AssaultPack_rgr_Medic"];
	vas_goggles = [""];				

												Example for side specific (TvT)
	switch(playerSide) do
	{
		//Blufor
		case west:
		{
			vas_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
		//Opfor
		case west:
		{
			vas_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
	};
*/

//If the arrays below are empty (as they are now) all weapons, magazines, items, backpacks and goggles will be available
//Want to limit VAS to specific weapons? Place the classnames in the array!
vas_weapons = [];
//Want to limit VAS to specific magazines? Place the classnames in the array!
vas_magazines = [];
//Want to limit VAS to specific items? Place the classnames in the array!
vas_items = [];
//Want to limit backpacks? Place the classnames in the array!
vas_backpacks = [];
//Want to limit goggles? Place the classnames in the array!
vas_glasses = [];


/*
	NOTES ON EDITING:
	THIS IS THE SAME AS THE ABOVE VARIABLES, YOU NEED TO KNOW THE CLASS NAME OF THE ITEM YOU ARE RESTRICTING. THIS DOES NOT WORK IN 
	CONJUNCTION WITH THE ABOVE METHOD, THIs IS ONLY FOR RESTRICTING / LIMITING ITEMS FROM VAS AND NOTHING MORE
	
														EXAMPLE
	vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
	vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
	vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS
	
												Example for side specific (TvT)
	switch(playerSide) do
	{
		//Blufor
		case west:
		{
			vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
		//Opfor
		case west:
		{
			vas_r_weapons = ["srifle_EBR_F","arifle_MX_GL_F"];
			vas_r_items = ["muzzle_snds_H","muzzle_snds_B","muzzle_snds_L","muzzle_snds_H_MG"]; //Removes suppressors from VAS
			vas_r_goggles = ["G_Diving"]; //Remove diving goggles from VAS
		};
	};
*/

//Below are variables you can use to restrict certain items from being used.
//Remove Weapon
vas_r_weapons = [
"launch_RPG32_F",
"srifle_EBR_F",
"srifle_GM6_F",
"srifle_GM6_camo_F",
"srifle_GM6_SOS_F",
"srifle_GM6_camo_SOS_F",
"srifle_GM6_LRPS_F",
"srifle_GM6_camo_LRPS_F",
"srifle_LRR_F",
"srifle_LRR_camo_F",
"srifle_LRR_SOS_F",
"srifle_LRR_camo_SOS_F",
"srifle_LRR_LRPS_F",
"srifle_LRR_camo_LRPS_F",
"hgun_Rook40_F",
"arifle_Katiba_F",
"arifle_Katiba_GL_F",
"arifle_Katiba_C_F",
"LMG_Mk200_F",
"arifle_MX_SW_F",
"arifle_SDAR_F",
"arifle_TRG21_F",
"arifle_TRG20_F",
"arifle_TRG21_GL_F",
"launch_B_Titan_F",
"launch_I_Titan_F",
"launch_O_Titan_F",
"launch_Titan_F",
"launch_B_Titan_short_F",
"launch_I_Titan_short_F",
"launch_O_Titan_short_F",
"launch_Titan_short_F",
"LMG_Zafir_F",
"hgun_ACPC2_F",
"arifle_Mk20_F",
"arifle_Mk20C_F",
"arifle_Mk20_GL_F",
"arifle_Mk20_MRCO_plain_F",  
"arifle_Mk20_MRCO_pointer_F",
"arifle_Mk20_GL_MRCO_pointer_F",
"arifle_Mk20_GL_ACO_F",
"srifle_DMR_01_F",
"hgun_Pistol_heavy_01_F",
"hgun_Pistol_heavy_02_F",
"hgun_PDW2000_F",
"hgun_Pistol_Signal_F"
];
vas_r_backpacks = [
"B_Assault_Diver",
"B_AssaultPack_blk_DiverExp",
"B_Kitbag_rgr_Exp",
"B_FieldPack_blk_DiverExp",
"O_Assault_Diver",
"B_FieldPack_ocamo_Medic",
"B_FieldPack_cbr_LAT",
"B_FieldPack_cbr_Repair",
"B_Carryall_ocamo_Exp",
"B_FieldPack_oli",
"B_Carryall_oli",
"G_AssaultPack",
"G_Bergen",
"C_Bergen_Base",
"C_Bergen_red",
"C_Bergen_grn",
"C_Bergen_blu",
"B_AssaultPack_mcamo_AT",
"B_AssaultPack_rgr_ReconMedic",
"A3_Weapons_F_Ammoboxes",
"B_AssaultPack_rgr_ReconExp",
"B_AssaultPack_rgr_ReconLAT",
"B_AssaultPack_mcamo_AA", 
"B_AssaultPack_mcamo_AAR", 
"B_AssaultPack_mcamo_Ammo", 
"B_Kitbag_mcamo_Eng", 
"B_Carryall_mcamo_AAA",
"B_Carryall_mcamo_AAT",
"B_FieldPack_ocamo_AA", 
"B_FieldPack_ocamo_AAR", 
"B_FieldPack_ocamo_ReconMedic",
"B_FieldPack_cbr_AT",
"B_FieldPack_cbr_AAT",
"B_FieldPack_cbr_AA",
"B_FieldPack_cbr_AAA",
"B_FieldPack_cbr_Medic",
"B_FieldPack_ocamo_ReconExp",
"B_FieldPack_cbr_Ammo",
"B_FieldPack_cbr_RPG_AT",
"B_Carryall_ocamo_AAA", 
"B_Carryall_ocamo_Eng",
"B_Carryall_cbr_AAT",
"B_FieldPack_oucamo_AT",
"B_FieldPack_oucamo_LAT",
"B_Carryall_oucamo_AAT",
"B_FieldPack_oucamo_AA",
"B_Carryall_oucamo_AAA",
"B_FieldPack_oucamo_AAR",
"B_FieldPack_oucamo_Medic",
"B_FieldPack_oucamo_Ammo",
"B_FieldPack_oucamo_Repair",
"B_Carryall_oucamo_Exp",
"B_Carryall_oucamo_Eng",
"I_Fieldpack_oli_AA",
"I_Assault_Diver",
"I_Fieldpack_oli_Ammo",
"I_Fieldpack_oli_Medic",
"I_Fieldpack_oli_Repair",
"I_Fieldpack_oli_LAT",
"I_Fieldpack_oli_AAR",
"I_Carryall_oli_AAT",
"I_Carryall_oli_Exp",
"I_Carryall_oli_AAA",
"I_Carryall_oli_Eng",
"G_TacticalPack_Eng",
"G_FieldPack_LAT",
"G_Carryall_Ammo",
"G_Carryall_Exp",
"B_BergenG_TEST_B_Soldier_overloaded",
"O_Mortar_01_support_F",
"I_Mortar_01_support_F",
"O_Mortar_01_weapon_F",
"I_Mortar_01_weapon_F",
"O_HMG_01_support_F",
"I_HMG_01_support_F",
"O_HMG_01_support_high_F",
"I_HMG_01_support_high_F",
"O_HMG_01_weapon_F",
"I_HMG_01_weapon_F",
"O_GMG_01_weapon_F",
"I_GMG_01_weapon_F",
"O_HMG_01_high_weapon_F",
"I_HMG_01_high_weapon_F",
"O_GMG_01_high_weapon_F",
"I_GMG_01_high_weapon_F",
"B_O_Parachute_02_F",
"O_AT_01_weapon_F",
"I_AT_01_weapon_F",
"O_AA_01_weapon_F",
"I_AA_01_weapon_F",
"B_I_Parachute_02_F"
];
//Magazines to remove from VAS
vas_r_magazines = [
"30Rnd_556x45_Stanag_Tracer_Red",
"30Rnd_556x45_Stanag_Tracer_Green",
"30Rnd_556x45_Stanag_Tracer_Yellow",
"30Rnd_556x45_Stanag",
"30Rnd_65x39_caseless_green",
"30Rnd_65x39_caseless_green_mag_Tracer",
"RPG32_F",
"RPG32_HE_F",
"150Rnd_762x51_Box",
"150Rnd_762x51_Box_Tracer",
"O_IR_Grenade",
"I_IR_Grenade",
"6Rnd_GreenSignal_F",
"6Rnd_RedSignal_F"
];
//Items to remove from VAS
vas_r_items = [
"B_Soldier_03_f",
"B_Soldier_lite_F",
"B_Soldier_SL_F",
"B_Soldier_TL_F",
"B_engineer_F",
"B_crew_F",
"B_recon_F",
"B_recon_TL_F",
"U_B_GhillieSuit",
"U_B_HeliPilotCoveralls",
"U_O_CombatUniform_ocamo",
"U_O_GhillieSuit",
"U_O_PilotCoveralls",
"U_O_Wetsuit",
"U_C_Poloshirt_blue",
"U_C_Poloshirt_burgundy",
"U_C_Poloshirt_stripped",
"U_C_Poloshirt_tricolour",
"U_C_Poloshirt_salmon",
"U_C_Poloshirt_redwhite",
"U_C_Commoner1_1",
"U_C_Commoner1_2",
"U_C_Commoner1_3",
"U_Rangemaster",
"U_NikosBody",
"U_OrestesBody",
"U_B_CombatUniform_wdl",
"U_B_CombatUniform_wdl_tshirt",
"U_B_CombatUniform_wdl_vest",
"U_B_CombatUniform_sgg",
"U_B_CombatUniform_sgg_tshirt",
"U_B_CombatUniform_sgg_vest",
"U_B_PilotCoveralls",
"U_O_CombatUniform_oucamo",
"U_O_SpecopsUniform_ocamo",
"U_O_SpecopsUniform_blk",
"U_O_OfficerUniform_ocamo",
"U_I_CombatUniform",
"U_I_CombatUniform_tshirt",
"U_I_CombatUniform_shortsleeve",
"U_I_pilotCoveralls",
"U_I_HeliPilotCoveralls",
"U_I_GhillieSuit",
"U_I_OfficerUniform",
"U_I_Wetsuit",
"U_Competitor",
"U_MillerBody",
"U_KerryBody",
"U_AttisBody",
"U_AntigonaBody",
"U_IG_Menelaos",
"U_OI_Scientist",
"U_IG_Guerilla1_1",
"U_IG_Guerilla2_1",
"U_IG_Guerilla2_2",
"U_IG_Guerilla2_3",
"U_IG_Guerilla3_1",
"U_IG_Guerilla3_2",
"U_IG_leader",
"U_BG_Guerilla1_1",
"U_BG_Guerilla2_1",
"U_BG_Guerilla2_2",
"U_BG_Guerilla2_3",
"U_BG_Guerilla3_1",
"U_BG_Guerilla3_2",
"U_BG_leader",
"U_OG_Guerilla1_1",
"U_OG_Guerilla2_1",
"U_OG_Guerilla2_2",
"U_OG_Guerilla2_3",
"U_OG_Guerilla3_1",
"U_OG_Guerilla3_2",
"U_OG_leader",
"U_C_Poor_1",
"U_C_Poor_2",
"U_C_Scavenger_1",
"U_C_Scavenger_2",
"U_C_Farmer",
"U_C_Fisherman",
"U_C_WorkerOveralls",
"U_C_FishermanOveralls",
"U_C_WorkerCoveralls",
"U_C_HunterBody_grn",
"U_C_HunterBody_brn",
"U_C_Commoner2_1",
"U_C_Commoner2_2",
"U_C_Commoner2_3",
"U_C_PriestBody",
"U_C_Poor_shorts_1",
"U_C_Poor_shorts_2",
"U_C_Commoner_shorts",
"U_C_ShirtSurfer_shorts",
"U_C_TeeSurfer_shorts_1",
"U_C_TeeSurfer_shorts_2",
"U_B_survival_uniform",
"U_I_G_Story_Protagonist_F",
"U_I_G_resistanceLeader_F",
"U_C_Journalist",
"U_C_Scientist",
"U_B_Protagonist_VR",
"U_I_Protagonist_VR",
"U_O_Protagonist_VR",
"U_BG_Guerrilla_6_1",
"U_NikosAgedBody",
"V_Rangemaster_belt",
"V_BandollierB_khk",
"V_BandollierB_cbr",
"V_BandollierB_rgr",
"V_BandollierB_blk",
"V_BandollierB_oli",
//"V_PlateCarrier1_rgr",
"V_PlateCarrier2_rgr",
"V_PlateCarrier3_rgr",
"V_PlateCarrier1_blk",
"V_PlateCarrierSpec_rgr",
"V_Chestrig_khk",
"V_Chestrig_rgr",
"V_Chestrig_blk",
"V_Chestrig_oli",
"V_TacVest_khk",
"V_TacVest_brn",
"V_TacVest_oli",
"V_TacVest_blk",
"V_TacVest_camo",
"V_TacVest_blk_POLICE",
"V_TacVestIR_blk",
"V_TacVestCamo_khk",
"V_HarnessO_brn",
"V_HarnessOGL_brn",
"V_HarnessO_gry",
"V_HarnessOGL_gry",
"V_HarnessOSpec_brn",
"V_HarnessOSpec_gry",
"V_PlateCarrierIA1_dgtl",
"V_PlateCarrierIA2_dgtl",
"V_PlateCarrierIAGL_dgtl",
"V_RebreatherIR",
"V_RebreatherIA",
"V_PlateCarrierL_CTRG",
"V_I_G_resistanceLeader_F",
"V_Press_F",
"H_HelmetB",
"H_HelmetB_camo",
"H_HelmetB_paint",
"H_HelmetB_light",
"H_Booniehat_khk",
"H_Booniehat_indp",
"H_Booniehat_mcamo",
"H_Booniehat_grn",
"H_Booniehat_tan",
"H_Booniehat_dirty",
"H_Booniehat_dgtl",
"H_Booniehat_khk_hs",
"H_HelmetB_plain_mcamo",
"H_HelmetIA",
"H_HelmetIA_net",
"H_HelmetIA_camo",
"H_Helmet_Kerry",
"H_HelmetB_grass",
"H_HelmetB_snakeskin",
"H_HelmetB_desert",
"H_HelmetB_black",
"H_HelmetB_sand",
"H_Cap_red",
"H_Cap_blu",
"H_Cap_oli",
"H_Cap_headphones",
"H_Cap_tan",
"H_Cap_blk",
"H_Cap_blk_CMMG",
"H_Cap_brn_SPECOPS",
"H_Cap_tan_specops_US",
"H_Cap_grn",
"H_Cap_grn_BI",
"H_Cap_blk_Raven",
"H_Cap_blk_ION",
"H_Cap_oli_hs",
"H_Cap_press",
"H_HelmetCrew_B",
"H_HelmetCrew_O",
"H_HelmetCrew_I",
"H_PilotHelmetFighter_B",
"H_PilotHelmetFighter_O",
"H_PilotHelmetFighter_I",
"H_PilotHelmetHeli_B",
"B_UAV_AI",
"H_PilotHelmetHeli_O",
"O_UAV_AI",
"I_UAV_AI",
"H_PilotHelmetHeli_I",
"H_CrewHelmetHeli_B",
"H_CrewHelmetHeli_O",
"H_CrewHelmetHeli_I",
"H_HelmetO_ocamo",
"H_HelmetLeaderO_ocamo",
"H_MilCap_ocamo",
"H_MilCap_mcamo",
"H_MilCap_oucamo",
"H_MilCap_rucamo",
"H_MilCap_gry",
"H_MilCap_dgtl",
"H_MilCap_blue",
"H_HelmetB_light_grass",
"H_HelmetB_light_desert",
"H_HelmetB_light_black",
"H_HelmetB_light_sand",
"H_BandMask_blk","
H_BandMask_khk",
"H_BandMask_reaper",
"H_BandMask_demon",
"H_HelmetO_oucamo",
"H_HelmetLeaderO_oucamo",
"H_HelmetSpecO_ocamo",
"H_HelmetSpecO_blk",
"H_Bandanna_surfer",
"H_Bandanna_khk",
"H_Bandanna_khk_hs",
"H_Bandanna_cbr",
"H_Bandanna_sgg",
"H_Bandanna_gry",
"H_Bandanna_camo",
"H_Bandanna_mcamo",
"H_Shemag_khk",
"H_Shemag_tan",
"H_Shemag_olive",
"H_Shemag_olive_hs",
"H_ShemagOpen_khk",
"H_ShemagOpen_tan",
"H_Beret_blk",
"H_Beret_blk_POLICE",
"H_Beret_red",
"H_Beret_grn",
"H_Beret_grn_SF",
"H_Beret_brn_SF",
"H_Beret_ocamo",
"H_Beret_02",
"H_Beret_Colonel",
"H_Watchcap_khk",
"H_Watchcap_camo",
"H_Watchcap_sgg",
"H_TurbanO_blk",
"H_StrawHat",
"H_StrawHat_dark",
"H_Hat_blue",
"H_Hat_brown",
"H_Hat_camo",
"H_Hat_grey",
"H_Hat_checker",
"U_C_Driver_1",
"U_C_Driver_2",
"U_C_Driver_3",
"U_C_Driver_4",
"U_C_Driver_1_black",
"U_C_Driver_1_blue",
"U_C_Driver_1_green",
"U_C_Driver_1_red",
"U_C_Driver_1_white",
"U_C_Driver_1_yellow",
"U_C_Driver_1_orange",
"U_Marshal",
"C_Marshal_F",
"H_RacingHelmet_1_F",
"H_RacingHelmet_2_F",
"H_RacingHelmet_3_F",
"H_RacingHelmet_4_F",
"H_RacingHelmet_1_black_F",
"H_RacingHelmet_1_blue_F",
"H_RacingHelmet_1_green_F",
"H_RacingHelmet_1_red_F",
"H_RacingHelmet_1_white_F",
"H_RacingHelmet_1_yellow_F",
"H_RacingHelmet_1_orange_F",
"H_Cap_marshal",
"C_Marshal_F",
//I����
"NVGoggles_OPFOR",
"NVGoggles_INDEP",
"Laserdesignator",
"Rangefinder",
"O_UavTerminal",
"I_UavTerminal",
"optic_SOS",
"optic_DMS",
"optic_LRPS",
"optic_Nightstalker",
"optic_tws",
"optic_tws_mg"
];
//Goggles to remove from VAS
vas_r_glasses = [];
