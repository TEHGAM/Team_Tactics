//Второе отделение, легкое
//B_Soldier_SL_F		Командир отделения
//B_engineer_F 			Инженер
//B_Soldier_GL_F 		Гренадер
//B_soldier_AR_F		Пулеметчик
//B_G_Soldier_AR_F		Пулеметчик
//B_medic_F				Медик
//B_soldier_M_F 		Марксман
//B_soldier_LAT_F 		АТ легкий


private ["_top"];
_unit = _this select 0;
if (_unit != player) exitWith{};

_top = typeOf player;

switch (_top) do
	{
	case "B_Soldier_SL_F": 
	{
		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
		
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		for "_i" from 1 to 2 do {player addItemToUniform "Chemlight_yellow";};
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellPurple";
		player addItemToUniform "SmokeShellRed";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		player addHeadgear "H_HelmetSpecB_blk";

		comment "Add weapons";
		player addWeapon "arifle_MXC_Black_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Binocular";
	};
	case "B_engineer_F":
	{
		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
		
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 4 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "MiniGrenade";
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		player addBackpack "B_TacticalPack_mcamo";
		player addItemToBackpack "MineDetector";
		player addItemToBackpack "ToolKit";
		for "_i" from 1 to 2 do {player addItemToBackpack "APERSBoundingMine_Range_Mag";};
		for "_i" from 1 to 2 do {player addItemToBackpack "DemoCharge_Remote_Mag";};
		player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
		player addHeadgear "H_HelmetSpecB_paint2";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Binocular";
		
		
	};
	case "B_Soldier_GL_F":
	{
		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
		
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addItemToUniform "Chemlight_yellow";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "3Rnd_Smoke_Grenade_shell";
		player addItemToVest "16Rnd_9x21_Mag";
		player addBackpack "B_TacticalPack_mcamo";
		for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
		for "_i" from 1 to 2 do {player addItemToBackpack "3Rnd_UGL_FlareWhite_F";};
		player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";
		player addItemToBackpack "1Rnd_SmokePurple_Grenade_shell";
		player addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";
		for "_i" from 1 to 6 do {player addItemToBackpack "3Rnd_HE_Grenade_shell";};
		player addItemToBackpack "3Rnd_UGL_FlareCIR_F";
		player addItemToBackpack "ATMine_Range_Mag";
		player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
		player addHeadgear "H_HelmetSpecB_paint1";

		comment "Add weapons";
		player addWeapon "arifle_MX_GL_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Binocular";
	};
	case "B_soldier_AR_F":
	{
		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
		
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellPurple";
		player addItemToUniform "SmokeShellBlue";
		player addItemToUniform "Chemlight_yellow";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 5 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		player addBackpack "B_TacticalPack_mcamo";
		player addHeadgear "H_HelmetSpecB_paint2";

		comment "Add weapons";
		player addWeapon "arifle_MX_SW_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Binocular";
	};
	case "B_G_Soldier_AR_F":
	{
		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
		
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellPurple";
		player addItemToUniform "SmokeShellBlue";
		player addItemToUniform "Chemlight_yellow";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 5 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		player addBackpack "B_TacticalPack_mcamo";
		player addHeadgear "H_HelmetSpecB_paint2";

		comment "Add weapons";
		player addWeapon "arifle_MX_SW_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Binocular";
	};
	case "B_medic_F":
	{
		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
		
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addItemToUniform "Chemlight_yellow";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "MiniGrenade";
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		player addBackpack "B_TacticalPack_mcamo";
		player addItemToBackpack "Medikit";
		for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
		for "_i" from 1 to 4 do {player addItemToBackpack "SmokeShell";};
		player addHeadgear "H_HelmetSpecB_paint2";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Binocular";
	};
	case "B_soldier_M_F":
	{
		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
		
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_yellow";
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellPurple";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 8 do {player addItemToVest "20Rnd_762x51_Mag";};
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		player addBackpack "B_TacticalPack_mcamo";
		player addHeadgear "H_HelmetSpecB_paint2";

		comment "Add weapons";
		player addWeapon "srifle_EBR_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_DMS";
		player addWeapon "hgun_P07_F";
		player addWeapon "Binocular";
	};
	case "B_soldier_LAT_F":
	{
		comment "Remove existing items";
		removeAllWeapons player;
		removeAllItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		
		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
		
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addItemToUniform "Chemlight_yellow";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "3Rnd_Smoke_Grenade_shell";
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "16Rnd_9x21_Mag";
		player addItemToVest "B_IR_Grenade";
		player addItemToVest "MiniGrenade";
		player addBackpack "B_TacticalPack_mcamo";
		for "_i" from 1 to 3 do {player addItemToBackpack "NLAW_F";};
		player addHeadgear "H_HelmetSpecB_paint1";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "launch_NLAW_F";
		player addWeapon "hgun_P07_F";
		player addWeapon "Binocular";
	};	
	};