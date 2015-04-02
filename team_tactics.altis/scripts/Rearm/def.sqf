private ["_top"];
_unit = _this select 0;
if (_unit != player) exitWith{};
_top = typeOf player;
	
	
switch (_top) do {
default {
		//removeAllWeapons player;
	};
	case "B_officer_F": {//командир взвода
		comment "Exported from Arsenal by [BB]Al Nazir";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		comment "Add containers";
		player forceAddUniform "U_I_G_resistanceLeader_F";
		for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addItemToUniform "B_IR_Grenade";
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "Chemlight_red";
		player addVest "V_TacVest_blk_POLICE";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "MiniGrenade";
		player addItemToVest "B_IR_Grenade";
		player addHeadgear "H_HelmetB";

		comment "Add weapons";
		player addWeapon "arifle_MXC_Black_F";
		player addPrimaryWeaponItem "acc_flashlight";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
	
	};
	case "B_RangeMaster_F":{//замком взвода
		comment "Exported from Arsenal by [BB]Al Nazir";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		comment "Add containers";
		player forceAddUniform "U_I_G_Story_Protagonist_F";
		for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "B_IR_Grenade";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrier2_rgr";
		player addItemToVest "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "Chemlight_blue";
		player addItemToVest "Chemlight_red";
		for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		player addItemToVest "MiniGrenade";
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "B_IR_Grenade";
		player addHeadgear "H_HelmetB_camo";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "acc_flashlight";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";

	};
		
	case "B_soldier_UAV_F":{ //Оператор БПА
			
		comment "Exported from Arsenal by [BB]Al Nazir";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addItemToUniform "16Rnd_9x21_Mag";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "SmokeShellPurple";
		player addItemToVest "APERSBoundingMine_Range_Mag";
		player addBackpack "I_UAV_01_backpack_F";
		player addHeadgear "H_HelmetSpecB_paint2";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "B_UavTerminal";
		player linkItem "NVGoggles";		
		
	};
		
	case "B_Helipilot_F": {//Пилот боевого вертолета
		comment "Exported from Arsenal by [BB]Al Nazir";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		comment "Add containers";
		player forceAddUniform "U_B_HeliPilotCoveralls";
		player addItemToUniform "FirstAidKit";
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
		player addHeadgear "H_PilotHelmetHeli_B";

		comment "Add weapons";
		player addWeapon "arifle_MXC_Black_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "Binocular";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemGPS";

	};
	
	case "B_helicrew_F": {//пилот транспортного вертолета
		comment "Exported from Arsenal by [BB]Al Nazir";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		comment "Add containers";
		player forceAddUniform "U_B_HeliPilotCoveralls";
		player addItemToUniform "FirstAidKit";
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
		player addHeadgear "H_CrewHelmetHeli_B";

		comment "Add weapons";
		player addWeapon "arifle_MXC_Black_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Binocular";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemGPS";

	};
	
	case "B_Pilot_F": {//пилот истребителя
		comment "Exported from Arsenal by [BB]Al Nazir";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		comment "Add containers";
		player forceAddUniform "U_B_PilotCoveralls";
		for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		for "_i" from 1 to 2 do {player addItemToUniform "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {player addItemToUniform "16Rnd_9x21_Mag";};
		player addItemToUniform "SmokeShellPurple";
		player addBackpack "B_Parachute";
		player addHeadgear "H_PilotHelmetFighter_B";

		comment "Add weapons";
		player addWeapon "arifle_MXC_Black_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Binocular";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemGPS";

	};
	
	//Экипажи	
	case "B_soldier_repair_F": { //Механик водитель
		comment "Exported from Arsenal by [BB]Al Nazir";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "30Rnd_65x39_caseless_mag";
		player addItemToUniform "SmokeShellRed";
		player addVest "V_PlateCarrierGL_rgr";
		player addItemToVest "MineDetector";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "MiniGrenade";
		player addItemToVest "SmokeShell";
		player addItemToVest "SmokeShellRed";
		player addItemToVest "SmokeShellPurple";
		player addItemToVest "SmokeShellBlue";
		player addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		player addItemToVest "Chemlight_red";
		player addItemToVest "Chemlight_blue";
		player addBackpack "B_AssaultPack_mcamo";
		player addItemToBackpack "ToolKit";
		player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
		player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		player addHeadgear "H_HelmetCrew_B";
		player addGoggles "G_Goggles_VR";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles_OPFOR";
	};
	
	case "B_support_Mort_F": { //стрелок экипажа
		comment "Exported from Arsenal by [BB]Al Nazir";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "16Rnd_9x21_Mag";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
		player addItemToVest "MiniGrenade";
		player addItemToVest "SmokeShell";
		for "_i" from 1 to 4 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "SmokeShellRed";
		player addItemToVest "SmokeShellPurple";
		player addItemToVest "SmokeShellBlue";
		player addItemToVest "B_IR_Grenade";
		player addHeadgear "H_HelmetCrew_B";

		comment "Add weapons";
		player addWeapon "arifle_MX_SW_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles_OPFOR";

	};
	
	case "B_crew_F": { //командир экипажа
		comment "Exported from Arsenal by [BB]Al Nazir";
		removeAllWeapons player;
		removeBackpack player;
		removeAllItems player;
		//removeAllAssignedItems player;
		removeUniform player;
		removeVest player;
		removeBackpack player;
		removeHeadgear player;
		removeGoggles player;
		comment "Add containers";
		player forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "Chemlight_blue";
		player addItemToUniform "SmokeShell";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		player addItemToVest "HandGrenade";
		player addItemToVest "Chemlight_blue";
		for "_i" from 1 to 2 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		player addItemToVest "Chemlight_red";
		player addItemToVest "3Rnd_UGL_FlareCIR_F";
		for "_i" from 1 to 2 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
		for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
		player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
		player addItemToVest "UGL_FlareRed_F";
		player addItemToVest "MiniGrenade";
		for "_i" from 1 to 2 do {player addItemToVest "UGL_FlareCIR_F";};
		for "_i" from 1 to 2 do {player addItemToVest "UGL_FlareWhite_F";};
		player addHeadgear "H_HelmetCrew_B";

		comment "Add weapons";
		player addWeapon "arifle_MX_GL_F";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles_OPFOR";

	};
	
};