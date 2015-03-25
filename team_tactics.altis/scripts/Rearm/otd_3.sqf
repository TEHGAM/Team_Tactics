// Третье отделение, разведка.
//B_recon_medic_F			Медик
//B_recon_M_F				Марксман
//B_recon_LAT_F 			АТ
//B_recon_exp_F			Подрывник

private ["_top"];

_unit = _this select 0;
if (_unit != player) exitWith{};

_top = typeOf player;

switch (_top) do
	{
	case "B_recon_medic_F":
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
		player forceAddUniform "U_B_CombatUniform_mcam_vest";
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
		player addBackpack "B_AssaultPack_mcamo";
		player addItemToBackpack "Medikit";
		for "_i" from 1 to 9 do {player addItemToBackpack "FirstAidKit";};
		for "_i" from 1 to 2 do {player addItemToBackpack "SmokeShell";};
		player addHeadgear "H_HelmetSpecB_paint2";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Rangefinder";
	};
	case "B_recon_M_F":
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
		player forceAddUniform "U_B_CombatUniform_mcam_vest";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_yellow";
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellPurple";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 7 do {player addItemToVest "20Rnd_762x51_Mag";};
		player addItemToVest "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		player addHeadgear "H_HelmetSpecB_blk";

		comment "Add weapons";
		player addWeapon "srifle_EBR_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_DMS";
		player addWeapon "hgun_P07_F";
		player addWeapon "Laserdesignator";
	};
	case "B_recon_LAT_F": 
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
		player forceAddUniform "U_B_CombatUniform_mcam_vest";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addItemToUniform "Chemlight_yellow";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "3Rnd_Smoke_Grenade_shell";
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "B_IR_Grenade";
		player addItemToVest "MiniGrenade";
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		player addBackpack "B_AssaultPack_mcamo";
		for "_i" from 1 to 2 do {player addItemToBackpack "NLAW_F";};
		player addHeadgear "H_HelmetSpecB_paint1";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "launch_NLAW_F";
		player addWeapon "hgun_P07_F";
		player addWeapon "Rangefinder";
	};
	case "B_recon_exp_F":
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
		player forceAddUniform "U_B_CombatUniform_mcam_vest";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "MiniGrenade";
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		player addBackpack "B_AssaultPack_mcamo";
		player addItemToBackpack "MineDetector";
		for "_i" from 1 to 2 do {player addItemToBackpack "APERSBoundingMine_Range_Mag";};
		player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
		for "_i" from 1 to 3 do {player addItemToBackpack "DemoCharge_Remote_Mag";};
		player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		player addHeadgear "H_HelmetSpecB_paint2";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Rangefinder";
	};	
	};