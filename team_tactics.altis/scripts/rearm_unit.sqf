_otd1 = [sl1,tl1,uav1,gl1,ar1,at1,aa1,exp1,eng1,med11,med12,uav01,uav02];
_otd2 = [sl2,tl2,uav2,gl2,ar2,at2,aa2,exp2,eng2,med21,med22];

private ["_nabor","_spec"];
_nabor =0;
while {true} do {
    waitUntil {player == player};
    waitUntil {sleep 0.1; alive player};	
	if (player in _otd1) then 
		{ 
			switch (player) do{
				default {_nabor =1;};
				case med11: {_nabor = 11;};
				case med12: {_nabor = 12;};	
				case uav01: {_nabor = 3;};
				case uav02: {_nabor = 3;};
			};
	};
	if (player in _otd2) then 
		{
			switch (player) do
			{
				default {_nabor =2;};
				case med21: {_nabor = 21;};
				case med22: {_nabor = 22;};
				hint str _nabor;
			};	
		};
	//hint str _nabor;	
	_spec = typeOf player;
	removeAllWeapons player;
	removeBackpack player;
	removeAllItems player;
	removeAllAssignedItems player;
	removeUniform player;
	removeVest player;
	removeBackpack player;
	removeHeadgear player;
	removeGoggles player;
switch (_spec) do {
default {
		//removeAllWeapons player;
	};
	case "B_officer_F": {//командир взвода
		comment "Exported from Arsenal by [BB]Al Nazir";

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
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";
	
	};
	case "B_RangeMaster_F":{//замком взвода
		comment "Exported from Arsenal by [BB]Al Nazir";

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
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";

	};
	case "B_Soldier_SL_F": {//командир отделения
		switch (_nabor) do{
			case 1:{
			comment "Exported from Arsenal by [BB]Al Nazir";

			comment "Add containers";
			player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
			for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
			player addItemToUniform "30Rnd_65x39_caseless_mag_Tracer";
			player addItemToUniform "Chemlight_blue";
			player addItemToUniform "Chemlight_red";
			player addVest "V_PlateCarrierGL_rgr";
			player addItemToVest "16Rnd_9x21_Mag";
			for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
			for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
			player addItemToVest "SmokeShell";
			player addItemToVest "30Rnd_9x21_Mag";
			for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
			player addItemToVest "MiniGrenade";
			player addItemToVest "SmokeShellRed";
			player addItemToVest "SmokeShellPurple";
			player addItemToVest "SmokeShellBlue";
			player addItemToVest "Chemlight_blue";
			player addItemToVest "Chemlight_red";
			player addBackpack "tf_rt1523g";
			player addItemToBackpack "APERSMine_Range_Mag";
			player addItemToBackpack "APERSBoundingMine_Range_Mag";
			player addHeadgear "H_HelmetSpecB_blk";

			comment "Add weapons";
			player addWeapon "arifle_MXC_Black_F";
			player addPrimaryWeaponItem "acc_pointer_IR";
			player addPrimaryWeaponItem "optic_Hamr";
			player addWeapon "hgun_P07_F";
			player addHandgunItem "muzzle_snds_L";
			player addWeapon "Laserdesignator";

			comment "Add items";
			player linkItem "ItemMap";
			player linkItem "ItemCompass";
			player linkItem "ItemWatch";
			player linkItem "tf_anprc152_6";
			player linkItem "ItemGPS";
			player linkItem "NVGoggles_OPFOR";
			};
			case 2:{
			comment "Exported from Arsenal by [BB]Al Nazir";

			comment "Add containers";
			player forceAddUniform "U_B_CTRG_2";
			for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
			player addItemToUniform "30Rnd_65x39_caseless_mag_Tracer";
			player addItemToUniform "Chemlight_blue";
			player addItemToUniform "Chemlight_red";
			player addVest "V_PlateCarrierGL_rgr";
			player addItemToVest "16Rnd_9x21_Mag";
			for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
			for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
			player addItemToVest "SmokeShell";
			player addItemToVest "30Rnd_9x21_Mag";
			for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
			player addItemToVest "MiniGrenade";
			player addItemToVest "SmokeShellRed";
			player addItemToVest "SmokeShellPurple";
			player addItemToVest "SmokeShellBlue";
			player addItemToVest "Chemlight_blue";
			player addItemToVest "Chemlight_red";
			player addBackpack "tf_rt1523g";
			player addHeadgear "H_HelmetSpecB_blk";

			comment "Add weapons";
			player addWeapon "arifle_MXC_Black_F";
			player addPrimaryWeaponItem "acc_pointer_IR";
			player addPrimaryWeaponItem "optic_Hamr";
			player addWeapon "hgun_P07_F";
			player addHandgunItem "muzzle_snds_L";
			player addWeapon "Laserdesignator";

			comment "Add items";
			player linkItem "ItemMap";
			player linkItem "ItemCompass";
			player linkItem "ItemWatch";
			player linkItem "tf_anprc152_4";
			player linkItem "ItemGPS";
			player linkItem "NVGoggles_OPFOR";
			};
		};
	};
	
	case "B_soldier_UAV_F":{ //Оператор БПА
		
		switch (_nabor) do {
			case 1:{			//первый набор для командира звена первого отделения
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
					for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
					player addItemToUniform "Chemlight_blue";
					player addItemToUniform "Chemlight_red";
					player addItemToUniform "SmokeShell";
					player addItemToUniform "SmokeShellRed";
					player addItemToUniform "SmokeShellBlue";
					player addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
					for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
					for "_i" from 1 to 4 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
					for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
					player addItemToVest "B_IR_Grenade";
					player addBackpack "I_UAV_01_backpack_F";
					player addHeadgear "H_HelmetSpecB_paint2";

					comment "Add weapons";
					player addWeapon "arifle_MXC_Black_F";
					player addPrimaryWeaponItem "acc_pointer_IR";
					player addPrimaryWeaponItem "optic_Hamr";
					player addWeapon "hgun_P07_F";
					player addWeapon "Rangefinder";

					comment "Add items";
					player linkItem "ItemMap";
					player linkItem "ItemCompass";
					player linkItem "ItemWatch";
					player linkItem "ItemRadio";
					player linkItem "B_UavTerminal";
					player linkItem "NVGoggles";

			};
			case 2:{		//для командира звена второго отделения
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					player forceAddUniform "U_B_CTRG_3";
					for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
					player addItemToUniform "Chemlight_blue";
					player addItemToUniform "Chemlight_red";
					player addItemToUniform "SmokeShellBlue";
					player addItemToUniform "SmokeShellRed";
					player addItemToUniform "SmokeShell";
					player addVest "V_PlateCarrierGL_rgr";
					player addItemToVest "16Rnd_9x21_Mag";
					for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
					player addItemToVest "MiniGrenade";
					player addItemToVest "SmokeShell";
					player addItemToVest "SmokeShellPurple";
					player addItemToVest "B_IR_Grenade";
					player addItemToVest "APERSBoundingMine_Range_Mag";
					for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
					for "_i" from 1 to 3 do {player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
					player addBackpack "B_UAV_01_backpack_F";
					player addHeadgear "H_HelmetSpecB_paint1";

					comment "Add weapons";
					player addWeapon "arifle_MXC_Black_F";
					player addPrimaryWeaponItem "acc_pointer_IR";
					player addPrimaryWeaponItem "optic_Hamr";
					player addWeapon "hgun_P07_F";
					player addWeapon "Rangefinder";

					comment "Add items";
					player linkItem "ItemMap";
					player linkItem "ItemCompass";
					player linkItem "ItemWatch";
					player linkItem "ItemRadio";
					player linkItem "B_UavTerminal";
					player linkItem "NVGoggles";

			};
			case 3:{ // для простого оператора БПА
					comment "Exported from Arsenal by [BB]Al Nazir";

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
					player linkItem "ItemWatch";
					player linkItem "ItemRadio";
					player linkItem "B_UavTerminal";
					player linkItem "NVGoggles";			
					};
		};//конец switch(_nabor)
		
	};//конец с БПА
	
	case "B_medic_F":{//Медик, медиков 2 типа в 2 отделения. Итого 4 набора!
		switch (_nabor) do{
			case 11:{
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					player forceAddUniform "U_B_CombatUniform_mcam";
					for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
					player addItemToUniform "Chemlight_blue";
					player addItemToUniform "Chemlight_red";
					player addItemToUniform "SmokeShell";
					player addItemToUniform "SmokeShellRed";
					player addItemToUniform "SmokeShellBlue";
					player addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
					for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
					for "_i" from 1 to 3 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
					player addItemToVest "B_IR_Grenade";
					player addBackpack "B_TacticalPack_mcamo";
					player addItemToBackpack "Medikit";
					for "_i" from 1 to 11 do {player addItemToBackpack "FirstAidKit";};
					player addItemToBackpack "MiniGrenade";
					player addItemToBackpack "B_IR_Grenade";
					player addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";
					for "_i" from 1 to 3 do {player addItemToBackpack "SmokeShell";};
					player addHeadgear "H_HelmetSpecB_paint2";

					comment "Add weapons";
					player addWeapon "arifle_MX_SW_Black_F";
					player addPrimaryWeaponItem "acc_pointer_IR";
					player addPrimaryWeaponItem "optic_Hamr";
					player addWeapon "hgun_P07_F";
					player addWeapon "Rangefinder";

					comment "Add items";
					player linkItem "ItemMap";
					player linkItem "ItemCompass";
					player linkItem "ItemWatch";
					player linkItem "ItemRadio";
					player linkItem "ItemGPS";
					player linkItem "NVGoggles";

			};
			case 12:{
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					player forceAddUniform "U_B_CombatUniform_mcam_vest";
					for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
					player addItemToUniform "Chemlight_blue";
					player addItemToUniform "Chemlight_red";
					player addItemToUniform "SmokeShellRed";
					player addItemToUniform "SmokeShell";
					player addItemToUniform "SmokeShellBlue";
					player addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
					for "_i" from 1 to 2 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
					player addItemToVest "3Rnd_UGL_FlareWhite_F";
					player addItemToVest "1Rnd_Smoke_Grenade_shell";
					player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
					player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
					player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
					player addItemToVest "HandGrenade";
					for "_i" from 1 to 6 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
					player addItemToVest "16Rnd_9x21_Mag";
					player addBackpack "B_AssaultPack_mcamo";
					for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
					player addItemToBackpack "Medikit";
					player addHeadgear "H_HelmetSpecB_paint1";

					comment "Add weapons";
					player addWeapon "arifle_MXC_F";
					player addPrimaryWeaponItem "muzzle_snds_H";
					player addPrimaryWeaponItem "acc_pointer_IR";
					player addPrimaryWeaponItem "optic_Hamr";
					player addWeapon "hgun_P07_F";
					player addWeapon "Rangefinder";

					comment "Add items";
					player linkItem "ItemMap";
					player linkItem "ItemCompass";
					player linkItem "ItemWatch";
					player linkItem "ItemRadio";
					player linkItem "ItemGPS";
					player linkItem "NVGoggles";

			};
			case 21:{
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					player forceAddUniform "U_B_CTRG_1";
					for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
					player addItemToUniform "Chemlight_blue";
					player addItemToUniform "Chemlight_red";
					player addItemToUniform "SmokeShell";
					player addItemToUniform "SmokeShellRed";
					player addItemToUniform "SmokeShellBlue";
					player addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
					for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
					for "_i" from 1 to 3 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
					player addItemToVest "B_IR_Grenade";
					player addBackpack "B_TacticalPack_mcamo";
					player addItemToBackpack "Medikit";
					for "_i" from 1 to 11 do {player addItemToBackpack "FirstAidKit";};
					player addItemToBackpack "MiniGrenade";
					player addItemToBackpack "B_IR_Grenade";
					player addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";
					for "_i" from 1 to 3 do {player addItemToBackpack "SmokeShell";};
					player addHeadgear "H_HelmetSpecB_paint2";

					comment "Add weapons";
					player addWeapon "arifle_MX_SW_Black_F";
					player addPrimaryWeaponItem "acc_pointer_IR";
					player addPrimaryWeaponItem "optic_Hamr";
					player addWeapon "hgun_P07_F";
					player addWeapon "Rangefinder";

					comment "Add items";
					player linkItem "ItemMap";
					player linkItem "ItemCompass";
					player linkItem "ItemWatch";
					player linkItem "ItemRadio";
					player linkItem "ItemGPS";
					player linkItem "NVGoggles";

			};
			case 22:{
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					player forceAddUniform "U_B_CTRG_3";
					for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
					player addItemToUniform "Chemlight_blue";
					player addItemToUniform "Chemlight_red";
					player addItemToUniform "SmokeShellRed";
					player addItemToUniform "SmokeShell";
					player addItemToUniform "SmokeShellBlue";
					player addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 3 do {player addItemToVest "SmokeShell";};
					for "_i" from 1 to 2 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
					player addItemToVest "3Rnd_UGL_FlareWhite_F";
					player addItemToVest "1Rnd_Smoke_Grenade_shell";
					player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
					player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
					player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
					player addItemToVest "HandGrenade";
					for "_i" from 1 to 6 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
					player addItemToVest "16Rnd_9x21_Mag";
					player addBackpack "B_AssaultPack_mcamo";
					for "_i" from 1 to 10 do {player addItemToBackpack "FirstAidKit";};
					player addItemToBackpack "Medikit";
					player addHeadgear "H_HelmetSpecB_paint1";

					comment "Add weapons";
					player addWeapon "arifle_MXC_F";
					player addPrimaryWeaponItem "muzzle_snds_H";
					player addPrimaryWeaponItem "acc_pointer_IR";
					player addPrimaryWeaponItem "optic_Hamr";
					player addWeapon "hgun_P07_F";
					player addWeapon "Rangefinder";

					comment "Add items";
					player linkItem "ItemMap";
					player linkItem "ItemCompass";
					player linkItem "ItemWatch";
					player linkItem "ItemRadio";
					player linkItem "ItemGPS";
					player linkItem "NVGoggles";

			};
		};
	};
	
	case "B_engineer_F":{//инженер-подрывник
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CombatUniform_mcam";
				for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "B_IR_Grenade";
				player addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
				for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
				player addItemToVest "SmokeShellRed";
				player addItemToVest "SmokeShellPurple";
				player addItemToVest "SmokeShellBlue";
				player addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 6 do {player addItemToVest "20Rnd_762x51_Mag";};
				player addItemToVest "MiniGrenade";
				player addBackpack "B_Carryall_khk";
				player addItemToBackpack "MineDetector";
				player addItemToBackpack "ToolKit";
				for "_i" from 1 to 2 do {player addItemToBackpack "20Rnd_762x51_Mag";};
				player addItemToBackpack "B_IR_Grenade";
				player addItemToBackpack "APERSBoundingMine_Range_Mag";
				for "_i" from 1 to 2 do {player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
				player addItemToBackpack "APERSTripMine_Wire_Mag";
				for "_i" from 1 to 2 do {player addItemToBackpack "DemoCharge_Remote_Mag";};
				for "_i" from 1 to 2 do {player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";};
				player addHeadgear "H_HelmetB_camo";

				comment "Add weapons";
				player addWeapon "srifle_EBR_F";
				player addPrimaryWeaponItem "muzzle_snds_B";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_DMS";
				player addWeapon "hgun_P07_F";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CTRG_1";
				for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "B_IR_Grenade";
				player addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
				for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
				player addItemToVest "SmokeShellRed";
				player addItemToVest "SmokeShellPurple";
				player addItemToVest "SmokeShellBlue";
				player addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 6 do {player addItemToVest "20Rnd_762x51_Mag";};
				player addItemToVest "MiniGrenade";
				player addBackpack "B_Carryall_cbr";
				player addItemToBackpack "MineDetector";
				player addItemToBackpack "ToolKit";
				for "_i" from 1 to 2 do {player addItemToBackpack "20Rnd_762x51_Mag";};
				player addItemToBackpack "B_IR_Grenade";
				player addItemToBackpack "APERSBoundingMine_Range_Mag";
				for "_i" from 1 to 2 do {player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
				player addItemToBackpack "APERSTripMine_Wire_Mag";
				for "_i" from 1 to 2 do {player addItemToBackpack "DemoCharge_Remote_Mag";};
				for "_i" from 1 to 2 do {player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";};
				player addHeadgear "H_HelmetB_camo";

				comment "Add weapons";
				player addWeapon "srifle_EBR_F";
				player addPrimaryWeaponItem "muzzle_snds_B";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_DMS";
				player addWeapon "hgun_P07_F";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
		};
	};
	
	case "B_soldier_exp_F":{//сапер-подрывник
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CombatUniform_mcam_vest";
				for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "B_IR_Grenade";
				player addItemToUniform "30Rnd_9x21_Mag";
				player addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
				for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
				player addItemToVest "SmokeShellRed";
				player addItemToVest "SmokeShellPurple";
				player addItemToVest "SmokeShellBlue";
				player addItemToVest "B_IR_Grenade";
				player addItemToVest "MiniGrenade";
				for "_i" from 1 to 4 do {player addItemToVest "100Rnd_65x39_caseless_mag";};
				player addBackpack "B_AssaultPack_mcamo";
				player addItemToBackpack "MineDetector";
				player addItemToBackpack "B_IR_Grenade";
				player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
				player addItemToBackpack "DemoCharge_Remote_Mag";
				player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				player addItemToBackpack "APERSBoundingMine_Range_Mag";
				player addItemToBackpack "100Rnd_65x39_caseless_mag";
				player addItemToBackpack "APERSTripMine_Wire_Mag";
				player addHeadgear "H_HelmetSpecB_paint2";

				comment "Add weapons";
				player addWeapon "arifle_MX_SW_F";
				player addPrimaryWeaponItem "muzzle_snds_H";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "hgun_P07_F";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CTRG_3";
				for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "B_IR_Grenade";
				player addItemToUniform "30Rnd_9x21_Mag";
				player addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
				for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
				player addItemToVest "SmokeShellRed";
				player addItemToVest "SmokeShellPurple";
				player addItemToVest "SmokeShellBlue";
				player addItemToVest "B_IR_Grenade";
				player addItemToVest "MiniGrenade";
				for "_i" from 1 to 4 do {player addItemToVest "100Rnd_65x39_caseless_mag";};
				player addBackpack "B_AssaultPack_mcamo";
				player addItemToBackpack "MineDetector";
				player addItemToBackpack "B_IR_Grenade";
				player addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
				player addItemToBackpack "DemoCharge_Remote_Mag";
				player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				player addItemToBackpack "APERSBoundingMine_Range_Mag";
				player addItemToBackpack "100Rnd_65x39_caseless_mag";
				player addItemToBackpack "APERSTripMine_Wire_Mag";
				player addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				player addWeapon "arifle_MX_SW_F";
				player addPrimaryWeaponItem "muzzle_snds_H";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "hgun_P07_F";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";			
			};
		};
	};
	
	case "B_soldier_AA_F":{//стрелок ПВО
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CombatUniform_mcam";
				for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "SmokeShell";
				player addItemToUniform "SmokeShellBlue";
				player addItemToUniform "SmokeShellRed";
				player addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
				player addItemToVest "3Rnd_UGL_FlareWhite_F";
				player addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
				player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				player addItemToVest "SmokeShellBlue";
				player addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 2 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
				for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
				player addBackpack "B_Carryall_khk";
				for "_i" from 1 to 2 do {player addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
				player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				for "_i" from 1 to 2 do {player addItemToBackpack "Titan_AA";};
				player addHeadgear "H_HelmetSpecB_paint2";

				comment "Add weapons";
				player addWeapon "arifle_MX_SW_Black_F";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "launch_B_Titan_F";
				player addWeapon "hgun_P07_F";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CTRG_1";
				for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "SmokeShell";
				player addItemToUniform "SmokeShellRed";
				player addItemToUniform "SmokeShellBlue";
				player addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
				player addItemToVest "3Rnd_UGL_FlareWhite_F";
				player addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
				player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				player addItemToVest "SmokeShellRed";
				player addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 2 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
				for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
				player addBackpack "B_Carryall_khk";
				for "_i" from 1 to 2 do {player addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
				player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				for "_i" from 1 to 2 do {player addItemToBackpack "Titan_AA";};
				player addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				player addWeapon "arifle_MX_SW_Black_F";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "launch_B_Titan_F";
				player addWeapon "hgun_P07_F";
				player addHandgunItem "muzzle_snds_L";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
		};
	};
	
	case "B_soldier_AT_F":{//стрелок ПТ
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CombatUniform_mcam";
				for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "SmokeShell";
				player addItemToUniform "SmokeShellRed";
				player addItemToUniform "SmokeShellBlue";
				player addVest "V_PlateCarrierGL_rgr";
				player addItemToVest "SmokeShell";
				for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
				player addItemToVest "3Rnd_UGL_FlareWhite_F";
				player addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
				player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				player addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 2 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
				for "_i" from 1 to 2 do {player addItemToVest "16Rnd_9x21_Mag";};
				player addBackpack "B_Carryall_khk";
				for "_i" from 1 to 2 do {player addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
				player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				for "_i" from 1 to 2 do {player addItemToBackpack "Titan_AT";};
				player addHeadgear "H_HelmetSpecB_paint2";

				comment "Add weapons";
				player addWeapon "arifle_MX_SW_Black_F";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "launch_B_Titan_short_F";
				player addWeapon "hgun_P07_F";
				player addHandgunItem "muzzle_snds_L";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CTRG_1";
				for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "SmokeShell";
				player addItemToUniform "SmokeShellRed";
				player addItemToUniform "SmokeShellBlue";
				player addVest "V_PlateCarrierGL_rgr";
				player addItemToVest "SmokeShell";
				for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
				player addItemToVest "3Rnd_UGL_FlareWhite_F";
				player addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
				player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				player addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 2 do {player addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
				player addBackpack "B_Carryall_khk";
				for "_i" from 1 to 2 do {player addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
				for "_i" from 1 to 2 do {player addItemToBackpack "Titan_AT";};
				player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				player addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				player addWeapon "arifle_MX_SW_Black_F";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "launch_B_Titan_short_F";
				player addWeapon "hgun_P07_F";
				player addHandgunItem "muzzle_snds_L";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
		};
	};
	
	case "B_Soldier_TL_F":{//командир звена
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
				for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "30Rnd_65x39_caseless_mag";
				player addVest "V_PlateCarrierGL_rgr";
				player addItemToVest "SmokeShell";
				player addItemToVest "MiniGrenade";
				player addItemToVest "30Rnd_9x21_Mag";
				for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
				player addItemToVest "HandGrenade";
				player addBackpack "B_AssaultPack_mcamo";
				for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
				for "_i" from 1 to 2 do {player addItemToBackpack "3Rnd_UGL_FlareWhite_F";};
				player addItemToBackpack "3Rnd_UGL_FlareCIR_F";
				player addItemToBackpack "UGL_FlareCIR_F";
				for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
				player addItemToBackpack "1Rnd_Smoke_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokePurple_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";
				for "_i" from 1 to 3 do {player addItemToBackpack "3Rnd_HE_Grenade_shell";};
				player addHeadgear "H_HelmetSpecB_paint2";

				comment "Add weapons";
				player addWeapon "arifle_MX_GL_F";
				player addPrimaryWeaponItem "muzzle_snds_H";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "hgun_P07_F";
				player addHandgunItem "muzzle_snds_L";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CTRG_2";
				for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "SmokeShell";
				player addItemToUniform "SmokeShellRed";
				player addItemToUniform "SmokeShellBlue";
				player addVest "V_PlateCarrierGL_rgr";
				player addItemToVest "SmokeShell";
				player addItemToVest "MiniGrenade";
				for "_i" from 1 to 6 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
				player addItemToVest "HandGrenade";
				for "_i" from 1 to 3 do {player addItemToVest "16Rnd_9x21_Mag";};
				player addItemToVest "UGL_FlareCIR_F";
				player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";
				player addBackpack "B_AssaultPack_mcamo";
				for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
				for "_i" from 1 to 2 do {player addItemToBackpack "3Rnd_UGL_FlareWhite_F";};
				for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
				player addItemToBackpack "1Rnd_Smoke_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokePurple_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";
				for "_i" from 1 to 3 do {player addItemToBackpack "3Rnd_HE_Grenade_shell";};
				player addItemToBackpack "UGL_FlareRed_F";
				player addItemToBackpack "3Rnd_UGL_FlareCIR_F";
				player addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				player addWeapon "arifle_MX_GL_F";
				player addPrimaryWeaponItem "muzzle_snds_H";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "hgun_P07_F";
				player addHandgunItem "muzzle_snds_L";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
		};		
	};
	
	case "B_Soldier_GL_F":{//стрелок ГП
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CombatUniform_mcam_tshirt";
				for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "30Rnd_65x39_caseless_mag";
				player addVest "V_PlateCarrierGL_rgr";
				player addItemToVest "SmokeShell";
				player addItemToVest "MiniGrenade";
				player addItemToVest "30Rnd_9x21_Mag";
				for "_i" from 1 to 5 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
				player addItemToVest "HandGrenade";
				player addBackpack "B_AssaultPack_mcamo";
				for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
				for "_i" from 1 to 2 do {player addItemToBackpack "3Rnd_UGL_FlareWhite_F";};
				player addItemToBackpack "3Rnd_UGL_FlareCIR_F";
				player addItemToBackpack "UGL_FlareCIR_F";
				for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
				player addItemToBackpack "1Rnd_Smoke_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokePurple_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";
				for "_i" from 1 to 3 do {player addItemToBackpack "3Rnd_HE_Grenade_shell";};
				player addHeadgear "H_HelmetSpecB_paint2";

				comment "Add weapons";
				player addWeapon "arifle_MX_GL_F";
				player addPrimaryWeaponItem "muzzle_snds_H";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "hgun_P07_F";
				player addHandgunItem "muzzle_snds_L";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CTRG_2";
				for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				player addItemToUniform "SmokeShell";
				player addItemToUniform "SmokeShellRed";
				player addItemToUniform "SmokeShellBlue";
				player addVest "V_PlateCarrierGL_rgr";
				player addItemToVest "SmokeShell";
				player addItemToVest "MiniGrenade";
				for "_i" from 1 to 6 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
				player addItemToVest "HandGrenade";
				for "_i" from 1 to 3 do {player addItemToVest "16Rnd_9x21_Mag";};
				player addItemToVest "UGL_FlareCIR_F";
				player addItemToVest "30Rnd_65x39_caseless_mag_Tracer";
				player addBackpack "B_AssaultPack_mcamo";
				for "_i" from 1 to 2 do {player addItemToBackpack "FirstAidKit";};
				for "_i" from 1 to 2 do {player addItemToBackpack "3Rnd_UGL_FlareWhite_F";};
				for "_i" from 1 to 3 do {player addItemToBackpack "30Rnd_65x39_caseless_mag";};
				player addItemToBackpack "1Rnd_Smoke_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokePurple_Grenade_shell";
				player addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";
				for "_i" from 1 to 3 do {player addItemToBackpack "3Rnd_HE_Grenade_shell";};
				player addItemToBackpack "UGL_FlareRed_F";
				player addItemToBackpack "3Rnd_UGL_FlareCIR_F";
				player addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				player addWeapon "arifle_MX_GL_F";
				player addPrimaryWeaponItem "muzzle_snds_H";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "hgun_P07_F";
				player addHandgunItem "muzzle_snds_L";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
		};		
	};
	
	case "B_soldier_AR_F":{//пулеметчик
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CombatUniform_mcam_vest";
				for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				for "_i" from 1 to 2 do {player addItemToUniform "16Rnd_9x21_Mag";};
				player addVest "V_PlateCarrierGL_rgr";
				player addItemToVest "SmokeShell";
				player addItemToVest "HandGrenade";
				player addItemToVest "MiniGrenade";
				player addItemToVest "3Rnd_UGL_FlareWhite_F";
				player addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
				player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				player addItemToVest "SmokeShellRed";
				player addItemToVest "SmokeShellPurple";
				player addItemToVest "SmokeShellBlue";
				player addItemToVest "B_IR_Grenade";
				player addItemToVest "200Rnd_65x39_cased_Box_Tracer";
				player addBackpack "B_AssaultPack_mcamo";
				for "_i" from 1 to 3 do {player addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";};
				player addHeadgear "H_HelmetSpecB_paint2";

				comment "Add weapons";
				player addWeapon "LMG_Mk200_F";
				player addPrimaryWeaponItem "muzzle_snds_H_MG";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "hgun_P07_F";
				player addHandgunItem "muzzle_snds_L";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				player forceAddUniform "U_B_CTRG_3";
				for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
				player addItemToUniform "Chemlight_blue";
				player addItemToUniform "Chemlight_red";
				for "_i" from 1 to 2 do {player addItemToUniform "16Rnd_9x21_Mag";};
				player addVest "V_PlateCarrierGL_rgr";
				player addItemToVest "SmokeShell";
				player addItemToVest "HandGrenade";
				player addItemToVest "MiniGrenade";
				player addItemToVest "3Rnd_UGL_FlareWhite_F";
				player addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {player addItemToVest "3Rnd_HE_Grenade_shell";};
				player addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				player addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				player addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				player addItemToVest "SmokeShellRed";
				player addItemToVest "SmokeShellPurple";
				player addItemToVest "SmokeShellBlue";
				player addItemToVest "B_IR_Grenade";
				player addItemToVest "200Rnd_65x39_cased_Box_Tracer";
				player addBackpack "B_AssaultPack_mcamo";
				for "_i" from 1 to 3 do {player addItemToBackpack "200Rnd_65x39_cased_Box_Tracer";};
				player addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				player addWeapon "LMG_Mk200_F";
				player addPrimaryWeaponItem "muzzle_snds_H_MG";
				player addPrimaryWeaponItem "acc_pointer_IR";
				player addPrimaryWeaponItem "optic_Hamr";
				player addWeapon "hgun_P07_F";
				player addHandgunItem "muzzle_snds_L";
				player addWeapon "Rangefinder";

				comment "Add items";
				player linkItem "ItemMap";
				player linkItem "ItemCompass";
				player linkItem "ItemWatch";
				player linkItem "ItemRadio";
				player linkItem "ItemGPS";
				player linkItem "NVGoggles";

			};
		};			
	};
		
	// Слоты вне основных отделений
	case "B_sniper_F": {	//снайпер
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		player forceAddUniform "U_B_GhillieSuit";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "Chemlight_blue";
		for "_i" from 1 to 2 do {player addItemToUniform "SmokeShell";};
		for "_i" from 1 to 2 do {player addItemToUniform "16Rnd_9x21_Mag";};
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 7 do {player addItemToVest "7Rnd_408_Mag";};
		player addItemToVest "HandGrenade";
		player addItemToVest "APERSTripMine_Wire_Mag";
		player addItemToVest "16Rnd_9x21_Mag";
		player addHeadgear "H_CrewHelmetHeli_B";

		comment "Add weapons";
		player addWeapon "srifle_LRR_camo_F";
		player addPrimaryWeaponItem "optic_SOS";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Rangefinder";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";

	};
	
	case "B_spotter_F": {	//корректировщик
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		player forceAddUniform "U_B_GhillieSuit";
		for "_i" from 1 to 3 do {player addItemToUniform "FirstAidKit";};
		player addItemToUniform "Chemlight_red";
		player addItemToUniform "Chemlight_blue";
		for "_i" from 1 to 2 do {player addItemToUniform "SmokeShell";};
		player addItemToUniform "16Rnd_9x21_Mag";
		player addItemToUniform "SmokeShellRed";
		player addItemToUniform "SmokeShellBlue";
		player addVest "V_PlateCarrierGL_rgr";
		player addItemToVest "HandGrenade";
		player addItemToVest "APERSTripMine_Wire_Mag";
		player addItemToVest "APERSBoundingMine_Range_Mag";
		player addItemToVest "ClaymoreDirectionalMine_Remote_Mag";
		for "_i" from 1 to 6 do {player addItemToVest "30Rnd_65x39_caseless_mag";};
		player addHeadgear "H_CrewHelmetHeli_B";

		comment "Add weapons";
		player addWeapon "arifle_MXC_F";
		player addPrimaryWeaponItem "muzzle_snds_H";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_Hamr";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Laserdesignator";

		comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles";

	};
		
	case "B_Helipilot_F": {//Пилот боевого вертолета
		comment "Exported from Arsenal by [BB]Al Nazir";

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
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";

	};
	
	case "B_helicrew_F": {//пилот транспортного вертолета
		comment "Exported from Arsenal by [BB]Al Nazir";

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
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";

	};
	
	case "B_Pilot_F": {//пилот истребителя
		comment "Exported from Arsenal by [BB]Al Nazir";

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
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";

	};
	
	//Экипажи
	
	case "B_soldier_repair_F": { //Механик водитель
		comment "Exported from Arsenal by [BB]Al Nazir";

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
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles_OPFOR";
	};
	
	case "B_support_Mort_F": { //стрелок экипажа
		comment "Exported from Arsenal by [BB]Al Nazir";

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
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles_OPFOR";

	};
	
	case "B_crew_F": { //командир экипажа
		comment "Exported from Arsenal by [BB]Al Nazir";

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
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemGPS";
		player linkItem "NVGoggles_OPFOR";

	};
	
};
waitUntil {sleep 1.217; !alive player};
};