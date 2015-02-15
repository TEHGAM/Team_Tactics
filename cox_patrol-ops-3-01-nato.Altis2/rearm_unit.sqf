sleep 1;
_unit = _this select 0;
_nabor = _this select 1;
_spec = typeOf _unit;
removeAllWeapons _unit;
removeBackpack _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";
_unit linkItem "NVGoggles_OPFOR";
_unit linkItem "ItemRadio";
switch (_spec) do {
default {
		removeAllWeapons _unit;
	};
	case "B_officer_F": {
		_unit forceAddUniform "U_I_G_resistanceLeader_F";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "30Rnd_65x39_caseless_mag";
		_unit addVest "V_TacVest_blk_POLICE";
		_unit addItemToVest "16Rnd_9x21_Mag";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";
		_unit addItemToVest "Chemlight_blue";
		_unit addItemToVest "Chemlight_red";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "SmokeShellRed";
		_unit addBackpack "tf_rt1523g";
		_unit addHeadgear "H_HelmetB";
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Rangefinder";	
	};
	case "B_Soldier_SL_F": {
		if (_nabor==1) then{
		_unit forceAddUniform "U_I_G_resistanceLeader_F";
		};
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_2";
		};
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "30Rnd_65x39_caseless_mag_Tracer";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "16Rnd_9x21_Mag";
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "30Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "Chemlight_blue";
		_unit addItemToVest "Chemlight_red";
		_unit addBackpack "tf_rt1523g";
		_unit addItemToBackpack "APERSMine_Range_Mag";
		_unit addItemToBackpack "APERSBoundingMine_Range_Mag";
		_unit addHeadgear "H_HelmetSpecB_blk";
		
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Laserdesignator";	
	};
	case "B_RangeMaster_F":{//помощник ком взвода
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "HandGrenade";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addVest "V_PlateCarrier2_rgr";
		for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "Chemlight_blue";
		_unit addItemToVest "Chemlight_red";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "SmokeShellRed";
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "SmokeShellPurple";
		for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "tf_rt1523g";
		_unit addHeadgear "H_HelmetB_camo";
		
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";
	};
	case "B_soldier_UAV_F":{//ком звена 1
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_1";
		};
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform "30Rnd_9x21_Mag";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		for "_i" from 1 to 3 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
		for "_i" from 1 to 2 do {_unit addItemToVest "100Rnd_65x39_caseless_mag";};
		_unit addBackpack "I_UAV_01_backpack_F";
		_unit addHeadgear "H_HelmetSpecB_paint2";
		_unit addWeapon "arifle_MX_SW_Black_F";

		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";
	};
	case "B_medic_F":{//Медик
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_1";
		};
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform "30Rnd_9x21_Mag";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		for "_i" from 1 to 3 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
		for "_i" from 1 to 2 do {_unit addItemToVest "100Rnd_65x39_caseless_mag";};
		_unit addBackpack "B_TacticalPack_mcamo";
		_unit addItemToBackpack "Medikit";
		for "_i" from 1 to 11 do {_unit addItemToBackpack "FirstAidKit";};
		_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		_unit addItemToBackpack "MiniGrenade";
		_unit addItemToBackpack "B_IR_Grenade";
		_unit addHeadgear "H_HelmetSpecB_paint2";
		
		_unit addWeapon "arifle_MX_SW_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";
	};
	case "B_G_medic_F":{//Второй медик
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam_vest";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_3";
		};
		for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "HandGrenade";
		_unit addItemToVest "MiniGrenade";
		for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
		_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
		_unit addItemToVest "UGL_FlareCIR_F";
		for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
		_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
		_unit addBackpack "B_AssaultPack_mcamo";
		_unit addItemToBackpack "Medikit";
		for "_i" from 1 to 10 do {_unit addItemToBackpack "FirstAidKit";};
		_unit addHeadgear "H_HelmetSpecB_paint2";
		_unit addWeapon "arifle_MX_GL_F";
		_unit addPrimaryWeaponItem "muzzle_snds_H";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";
	};
	
	case "B_engineer_F":{//инженер подрывник
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_1";
		};
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "B_IR_Grenade";
		_unit addItemToUniform "30Rnd_9x21_Mag";
		_unit addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 7 do {_unit addItemToVest "20Rnd_762x51_Mag";};
		_unit addItemToVest "MiniGrenade";
		_unit addBackpack "B_Carryall_khk";
		_unit addItemToBackpack "MineDetector";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};
		_unit addItemToBackpack "B_IR_Grenade";
		_unit addItemToBackpack "APERSBoundingMine_Range_Mag";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
		_unit addItemToBackpack "APERSTripMine_Wire_Mag";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";};
		_unit addHeadgear "H_HelmetB_camo";
		
		_unit addWeapon "srifle_EBR_F";
		_unit addPrimaryWeaponItem "muzzle_snds_B";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_DMS";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";
	};
	case "B_soldier_AA_F":{//стрелок ПВО
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_1";
		};
		for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
		_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
		for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
		_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "B_IR_Grenade";
		_unit addBackpack "B_Carryall_khk";
		_unit addItemToBackpack "Titan_AA";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
		_unit addHeadgear "H_HelmetSpecB_paint2";
		
		_unit addWeapon "arifle_MX_SW_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "launch_B_Titan_F";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Rangefinder";
	};
	case "B_soldier_AT_F":{//
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_1";
		};
		for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
		_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
		for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
		_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "B_IR_Grenade";
		_unit addBackpack "B_Carryall_khk";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AT";};
		_unit addHeadgear "H_HelmetSpecB_paint2";
		
		_unit addWeapon "arifle_MX_SW_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "launch_B_Titan_short_F";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Rangefinder";
	};
	case "B_Soldier_TL_F":{//командир звена B_Soldier_GL_F
		if (_nabor==1) then{
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		};
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_2";
		};
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "HandGrenade";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addVest "V_PlateCarrier2_rgr";
		for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "Chemlight_blue";
		_unit addItemToVest "Chemlight_red";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "SmokeShellRed";
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "SmokeShellPurple";
		for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addBackpack "tf_rt1523g";
		_unit addHeadgear "H_HelmetB_camo";
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";
	};
	case "B_Soldier_GL_F":{//командир звена B_Soldier_GL_F
		if (_nabor==1) then{
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		};
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_2";
		};
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "30Rnd_65x39_caseless_mag";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "30Rnd_9x21_Mag";
		for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "HandGrenade";
		_unit addBackpack "B_AssaultPack_mcamo";
		for "_i" from 1 to 2 do {_unit addItemToBackpack "FirstAidKit";};
		for "_i" from 1 to 2 do {_unit addItemToBackpack "3Rnd_UGL_FlareWhite_F";};
		_unit addItemToBackpack "3Rnd_UGL_FlareCIR_F";
		_unit addItemToBackpack "UGL_FlareCIR_F";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "30Rnd_65x39_caseless_mag";};
		_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";
		_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";
		_unit addItemToBackpack "1Rnd_SmokePurple_Grenade_shell";
		_unit addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
		_unit addHeadgear "H_HelmetSpecB_paint2";
		
		_unit addWeapon "arifle_MX_GL_F";
		_unit addPrimaryWeaponItem "muzzle_snds_H";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Rangefinder";
	};
	case "B_G_Soldier_AR_F":{//пулеметчик
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam_vest";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_3";
		};
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "HandGrenade";
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
		_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
		for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
		_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "B_IR_Grenade";
		_unit addItemToVest "200Rnd_65x39_cased_Box_Tracer";
		_unit addBackpack "B_AssaultPack_mcamo";
		for "_i" from 1 to 3 do {_unit addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";};
		_unit addHeadgear "H_HelmetSpecB_paint2";

		_unit addWeapon "LMG_Mk200_F";
		_unit addPrimaryWeaponItem "muzzle_snds_H_MG";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Rangefinder";		
	};
	case "B_soldier_exp_F":{
		if (_nabor==2) then{
		_unit forceAddUniform "U_B_CombatUniform_mcam_vest";
		};
		if (_nabor==3) then{
		_unit forceAddUniform "U_B_CTRG_3";
		};
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "B_IR_Grenade";
		_unit addItemToUniform "30Rnd_9x21_Mag";
		_unit addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "B_IR_Grenade";
		_unit addItemToVest "MiniGrenade";
		for "_i" from 1 to 4 do {_unit addItemToVest "100Rnd_65x39_caseless_mag";};
		_unit addBackpack "B_AssaultPack_mcamo";
		_unit addItemToBackpack "MineDetector";
		_unit addItemToBackpack "B_IR_Grenade";
		_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		_unit addItemToBackpack "DemoCharge_Remote_Mag";
		_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
		_unit addItemToBackpack "APERSBoundingMine_Range_Mag";
		_unit addItemToBackpack "100Rnd_65x39_caseless_mag";
		_unit addItemToBackpack "APERSTripMine_Wire_Mag";
		_unit addHeadgear "H_HelmetSpecB_paint2";

		_unit addWeapon "arifle_MX_SW_F";
		_unit addPrimaryWeaponItem "muzzle_snds_H";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";		
	};
	// Слоты вне основных отделений
	case "B_sniper_F": {
		_unit forceAddUniform "U_B_GhillieSuit";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
		_unit addItemToUniform "B_IR_Grenade";
		_unit addItemToUniform "SmokeShellRed";
		_unit addItemToUniform "SmokeShellPurple";
		_unit addItemToUniform "SmokeShellBlue";
		_unit addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 7 do {_unit addItemToVest "7Rnd_408_Mag";};
		_unit addItemToVest "HandGrenade";
		_unit addItemToVest "APERSTripMine_Wire_Mag";
		_unit addHeadgear "H_CrewHelmetHeli_B";
		
		_unit addWeapon "srifle_LRR_camo_F";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";
	};
	case "B_spotter_F": {
		_unit forceAddUniform "U_B_GhillieSuit";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
		_unit addItemToUniform "B_IR_Grenade";
		_unit addItemToUniform "SmokeShellRed";
		_unit addItemToUniform "SmokeShellPurple";
		_unit addItemToUniform "SmokeShellBlue";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "HandGrenade";
		_unit addItemToVest "APERSTripMine_Wire_Mag";
		for "_i" from 1 to 3 do {_unit addItemToVest "100Rnd_65x39_caseless_mag";};
		_unit addItemToVest "APERSBoundingMine_Range_Mag";
		_unit addItemToVest "ClaymoreDirectionalMine_Remote_Mag";
		_unit addHeadgear "H_CrewHelmetHeli_B";
		_unit addWeapon "arifle_MX_SW_F";
		_unit addPrimaryWeaponItem "muzzle_snds_H";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Laserdesignator";
	};
	case "B_soldier_UAV_F": {
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
		_unit addItemToUniform "SmokeShell";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		for "_i" from 1 to 3 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "100Rnd_65x39_caseless_mag";
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "B_IR_Grenade";
		_unit addHeadgear "H_HelmetSpecB_paint2";
		
		_unit addWeapon "arifle_MX_SW_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";
	};
	case "B_Helipilot_F": {//Пилот боевого вертолета
		_unit forceAddUniform "U_B_HeliPilotCoveralls";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		_unit addItemToUniform "30Rnd_65x39_caseless_mag";
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addHeadgear "H_PilotHelmetHeli_B";
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";
	};
	case "B_helicrew_F": {
		_unit forceAddUniform "U_B_HeliPilotCoveralls";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		_unit addHeadgear "H_CrewHelmetHeli_B";
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";
	};
	case "B_Pilot_F": {
		_unit forceAddUniform "U_B_PilotCoveralls";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_mag";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addHeadgear "H_PilotHelmetFighter_B";
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";
	};
	
	//Экипажи
	
	case "B_soldier_repair_F": { //Механик водитель
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "MineDetector";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addBackpack "B_AssaultPack_mcamo";
		_unit addItemToBackpack "ToolKit";
		_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
		_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		_unit addHeadgear "H_HelmetCrew_B";
		
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Rangefinder";
	};
	case "B_support_Mort_F": { //стрелок экипажа
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "SmokeShell";
		for "_i" from 1 to 4 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "B_IR_Grenade";
		_unit addHeadgear "H_HelmetCrew_B";
		
		_unit addWeapon "arifle_MX_SW_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";
	};
	case "B_crew_F": { //командир экипажа
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "HandGrenade";
		_unit addItemToVest "Chemlight_blue";
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "Chemlight_red";
		_unit addItemToVest "3Rnd_UGL_FlareCIR_F";
		for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
		_unit addItemToVest "UGL_FlareWhite_F";
		_unit addItemToVest "UGL_FlareRed_F";
		_unit addItemToVest "MiniGrenade";
		_unit addHeadgear "H_HelmetCrew_B";
		
		_unit addWeapon "arifle_MX_GL_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";
	};
	/* case "B_soldier_UAV_F": {
		
	}; */
};