// Четвертое отделение, спецназ.
//B_Soldier_F
//B_G_Soldier_F
//B_soldier_AR_F
//B_Soldier_GL_F
//B_Soldier_M_F
//B_G_Soldier_M_F
private ["_top"];

_unit = _this select 0;
if (_unit != player) exitWith{};

_top = typeOf player;

switch (_top) do
	{
	case "B_Soldier_F": 
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
		player forceAddUniform "U_B_survival_uniform";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_yellow";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		player addItemToVest "MiniGrenade";
		player addBackpack "B_Parachute";
		player addHeadgear "H_HelmetSpecB_blk";
		player addGoggles "G_Balaclava_blk";

		comment "Add weapons";
		player addWeapon "arifle_MXC_Black_F";
		player addPrimaryWeaponItem "muzzle_snds_H";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Binocular";		
	};
	case "B_G_Soldier_F":
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
		player forceAddUniform "U_B_survival_uniform";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_yellow";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
		player addItemToVest "MiniGrenade";
		player addBackpack "B_Parachute";
		player addHeadgear "H_HelmetSpecB_blk";
		player addGoggles "G_Balaclava_blk";

		comment "Add weapons";
		player addWeapon "arifle_MXC_Black_F";
		player addPrimaryWeaponItem "muzzle_snds_H";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
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
		player forceAddUniform "U_B_survival_uniform";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellPurple";
		player addItemToUniform "SmokeShellBlue";
		player addItemToUniform "Chemlight_yellow";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 5 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
		player addHeadgear "H_HelmetSpecB_blk";
		player addGoggles "G_Balaclava_blk";

		comment "Add weapons";
		player addWeapon "arifle_MX_SW_Black_F";
		player addPrimaryWeaponItem "muzzle_snds_H_SW";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Rangefinder";
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
		player forceAddUniform "U_B_survival_uniform";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_yellow";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 3 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "3Rnd_UGL_FlareCIR_F";
		player addItemToVest "16Rnd_9x21_Mag";
		player addItemToVest "UGL_FlareYellow_F";
		player addBackpack "B_Parachute";
		player addHeadgear "H_HelmetSpecB_blk";
		player addGoggles "G_Balaclava_blk";

		comment "Add weapons";
		player addWeapon "arifle_MX_GL_Black_F";
		player addPrimaryWeaponItem "muzzle_snds_H";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Rangefinder";
	};
	case "B_Soldier_M_F":
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
		player forceAddUniform "U_B_survival_uniform";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_yellow";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "SmokeShell";
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 8 do {player addItemToVest "20Rnd_762x51_Mag";};
		player addBackpack "B_Parachute";
		player addHeadgear "H_HelmetSpecB_blk";
		player addGoggles "G_Balaclava_blk";

		comment "Add weapons";
		player addWeapon "srifle_EBR_F";
		player addPrimaryWeaponItem "muzzle_snds_B";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_DMS";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Laserdesignator";
	};
	case "B_G_Soldier_M_F":
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
		player forceAddUniform "U_B_survival_uniform";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_yellow";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "SmokeShell";
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 8 do {player addItemToVest "20Rnd_762x51_Mag";};
		player addBackpack "B_Parachute";
		player addHeadgear "H_HelmetSpecB_blk";
		player addGoggles "G_Balaclava_blk";

		comment "Add weapons";
		player addWeapon "srifle_EBR_F";
		player addPrimaryWeaponItem "muzzle_snds_B";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_DMS";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Laserdesignator";
	};	
	};