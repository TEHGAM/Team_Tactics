_otd1 = [sl1,tl1,uav1,gl1,ar1,at1,aa1,exp1,eng1,med11,med12,uav01,uav02];
_otd2 = [sl2,tl2,uav2,gl2,ar2,at2,aa2,exp2,eng2,med21,med22];

private ["_unit","_nabor","_spec"];

while {true} do {
    waitUntil {player == player};
    waitUntil {sleep 0.1; alive player};
	_unit = player;
	_nabor =0;
	if (_unit in _otd1) then 
		{ 
			switch (_unit) do{
				case med11: {_nabor = 11;};
				case med12: {_nabor = 12;};	
				case uav01: {_nabor = 3;};
				case uav02: {_nabor = 3;};
				default {_nabor =1;};
			};
	};
	if (_unit in _otd2) then 
		{
			switch (_unit) do
			{
				case med21: {_nabor = 21;};
				case med22: {_nabor = 22;};
				default {_nabor =2;};
			};	
		};
	
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
switch (_spec) do {
default {
		//removeAllWeapons _unit;
	};
	case "B_officer_F": {//командир взвода
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		_unit forceAddUniform "U_I_G_resistanceLeader_F";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "SmokeShell";
		_unit addItemToUniform "SmokeShellRed";
		_unit addItemToUniform "SmokeShellBlue";
		_unit addItemToUniform "B_IR_Grenade";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addVest "V_TacVest_blk_POLICE";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "B_IR_Grenade";
		_unit addHeadgear "H_HelmetB";

		comment "Add weapons";
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles";
	
	};
	case "B_RangeMaster_F":{//замком взвода
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		_unit forceAddUniform "U_I_G_Story_Protagonist_F";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "B_IR_Grenade";
		_unit addItemToUniform "SmokeShell";
		_unit addItemToUniform "SmokeShellRed";
		_unit addItemToUniform "SmokeShellBlue";
		_unit addVest "V_PlateCarrier2_rgr";
		_unit addItemToVest "16Rnd_9x21_Mag";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "Chemlight_blue";
		_unit addItemToVest "Chemlight_red";
		for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "MiniGrenade";
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "B_IR_Grenade";
		_unit addHeadgear "H_HelmetB_camo";

		comment "Add weapons";
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "acc_flashlight";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles";

	};
	case "B_Soldier_SL_F": {//командир отделения
		switch (_nabor) do{
			case 1:{
			comment "Exported from Arsenal by [BB]Al Nazir";

			comment "Add containers";
			_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
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

			comment "Add weapons";
			_unit addWeapon "arifle_MXC_Black_F";
			_unit addPrimaryWeaponItem "acc_pointer_IR";
			_unit addPrimaryWeaponItem "optic_Hamr";
			_unit addWeapon "hgun_P07_F";
			_unit addHandgunItem "muzzle_snds_L";
			_unit addWeapon "Laserdesignator";

			comment "Add items";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_anprc152_6";
			_unit linkItem "ItemGPS";
			_unit linkItem "NVGoggles_OPFOR";
			};
			case 2:{
			comment "Exported from Arsenal by [BB]Al Nazir";

			comment "Add containers";
			_unit forceAddUniform "U_B_CTRG_2";
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
			_unit addHeadgear "H_HelmetSpecB_blk";

			comment "Add weapons";
			_unit addWeapon "arifle_MXC_Black_F";
			_unit addPrimaryWeaponItem "acc_pointer_IR";
			_unit addPrimaryWeaponItem "optic_Hamr";
			_unit addWeapon "hgun_P07_F";
			_unit addHandgunItem "muzzle_snds_L";
			_unit addWeapon "Laserdesignator";

			comment "Add items";
			_unit linkItem "ItemMap";
			_unit linkItem "ItemCompass";
			_unit linkItem "ItemWatch";
			_unit linkItem "tf_anprc152_4";
			_unit linkItem "ItemGPS";
			_unit linkItem "NVGoggles_OPFOR";
			};
		};
	};
	
	case "B_soldier_UAV_F":{ //Оператор БПА
		
		switch (_nabor) do {
			case 1:{			//первый набор для командира звена первого отделения
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
					for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
					_unit addItemToUniform "Chemlight_blue";
					_unit addItemToUniform "Chemlight_red";
					_unit addItemToUniform "SmokeShell";
					_unit addItemToUniform "SmokeShellRed";
					_unit addItemToUniform "SmokeShellBlue";
					_unit addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
					for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
					for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
					for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
					_unit addItemToVest "B_IR_Grenade";
					_unit addBackpack "I_UAV_01_backpack_F";
					_unit addHeadgear "H_HelmetSpecB_paint2";

					comment "Add weapons";
					_unit addWeapon "arifle_MXC_Black_F";
					_unit addPrimaryWeaponItem "acc_pointer_IR";
					_unit addPrimaryWeaponItem "optic_Hamr";
					_unit addWeapon "hgun_P07_F";
					_unit addWeapon "Rangefinder";

					comment "Add items";
					_unit linkItem "ItemMap";
					_unit linkItem "ItemCompass";
					_unit linkItem "ItemWatch";
					_unit linkItem "ItemRadio";
					_unit linkItem "B_UavTerminal";
					_unit linkItem "NVGoggles";

			};
			case 2:{		//для командира звена второго отделения
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					_unit forceAddUniform "U_B_CTRG_3";
					for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
					_unit addItemToUniform "Chemlight_blue";
					_unit addItemToUniform "Chemlight_red";
					_unit addItemToUniform "SmokeShellBlue";
					_unit addItemToUniform "SmokeShellRed";
					_unit addItemToUniform "SmokeShell";
					_unit addVest "V_PlateCarrierGL_rgr";
					_unit addItemToVest "16Rnd_9x21_Mag";
					for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
					_unit addItemToVest "MiniGrenade";
					_unit addItemToVest "SmokeShell";
					_unit addItemToVest "SmokeShellPurple";
					_unit addItemToVest "B_IR_Grenade";
					_unit addItemToVest "APERSBoundingMine_Range_Mag";
					for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
					for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
					_unit addBackpack "B_UAV_01_backpack_F";
					_unit addHeadgear "H_HelmetSpecB_paint1";

					comment "Add weapons";
					_unit addWeapon "arifle_MXC_Black_F";
					_unit addPrimaryWeaponItem "acc_pointer_IR";
					_unit addPrimaryWeaponItem "optic_Hamr";
					_unit addWeapon "hgun_P07_F";
					_unit addWeapon "Rangefinder";

					comment "Add items";
					_unit linkItem "ItemMap";
					_unit linkItem "ItemCompass";
					_unit linkItem "ItemWatch";
					_unit linkItem "ItemRadio";
					_unit linkItem "B_UavTerminal";
					_unit linkItem "NVGoggles";

			};
			case 3:{ // для простого оператора БПА
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					_unit forceAddUniform "U_B_CombatUniform_mcam";
					for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
					_unit addItemToUniform "Chemlight_blue";
					_unit addItemToUniform "Chemlight_red";
					_unit addItemToUniform "SmokeShell";
					_unit addItemToUniform "SmokeShellRed";
					_unit addItemToUniform "SmokeShellBlue";
					_unit addItemToUniform "16Rnd_9x21_Mag";
					_unit addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
					_unit addItemToVest "B_IR_Grenade";
					for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
					for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
					_unit addItemToVest "SmokeShellPurple";
					_unit addItemToVest "APERSBoundingMine_Range_Mag";
					_unit addBackpack "I_UAV_01_backpack_F";
					_unit addHeadgear "H_HelmetSpecB_paint2";

					comment "Add weapons";
					_unit addWeapon "arifle_MXC_F";
					_unit addPrimaryWeaponItem "acc_pointer_IR";
					_unit addPrimaryWeaponItem "optic_Hamr";
					_unit addWeapon "hgun_P07_F";
					_unit addWeapon "Rangefinder";

					comment "Add items";
					_unit linkItem "ItemMap";
					_unit linkItem "ItemCompass";
					_unit linkItem "ItemWatch";
					_unit linkItem "ItemRadio";
					_unit linkItem "B_UavTerminal";
					_unit linkItem "NVGoggles";			
					};
		};//конец switch(_nabor)
		
	};//конец с БПА
	
	case "B_medic_F":{//Медик, медиков 2 типа в 2 отделения. Итого 4 набора!
		switch (_nabor) do{
			case 11:{
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					_unit forceAddUniform "U_B_CombatUniform_mcam";
					for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
					_unit addItemToUniform "Chemlight_blue";
					_unit addItemToUniform "Chemlight_red";
					_unit addItemToUniform "SmokeShell";
					_unit addItemToUniform "SmokeShellRed";
					_unit addItemToUniform "SmokeShellBlue";
					_unit addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
					for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
					for "_i" from 1 to 3 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
					_unit addItemToVest "B_IR_Grenade";
					_unit addBackpack "B_TacticalPack_mcamo";
					_unit addItemToBackpack "Medikit";
					for "_i" from 1 to 11 do {_unit addItemToBackpack "FirstAidKit";};
					_unit addItemToBackpack "MiniGrenade";
					_unit addItemToBackpack "B_IR_Grenade";
					_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";
					for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShell";};
					_unit addHeadgear "H_HelmetSpecB_paint2";

					comment "Add weapons";
					_unit addWeapon "arifle_MX_SW_Black_F";
					_unit addPrimaryWeaponItem "acc_pointer_IR";
					_unit addPrimaryWeaponItem "optic_Hamr";
					_unit addWeapon "hgun_P07_F";
					_unit addWeapon "Rangefinder";

					comment "Add items";
					_unit linkItem "ItemMap";
					_unit linkItem "ItemCompass";
					_unit linkItem "ItemWatch";
					_unit linkItem "ItemRadio";
					_unit linkItem "ItemGPS";
					_unit linkItem "NVGoggles";

			};
			case 12:{
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					_unit forceAddUniform "U_B_CombatUniform_mcam_vest";
					for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
					_unit addItemToUniform "Chemlight_blue";
					_unit addItemToUniform "Chemlight_red";
					_unit addItemToUniform "SmokeShellRed";
					_unit addItemToUniform "SmokeShell";
					_unit addItemToUniform "SmokeShellBlue";
					_unit addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
					for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
					_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
					_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
					_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
					_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
					_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
					_unit addItemToVest "HandGrenade";
					for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
					_unit addItemToVest "16Rnd_9x21_Mag";
					_unit addBackpack "B_AssaultPack_mcamo";
					for "_i" from 1 to 10 do {_unit addItemToBackpack "FirstAidKit";};
					_unit addItemToBackpack "Medikit";
					_unit addHeadgear "H_HelmetSpecB_paint1";

					comment "Add weapons";
					_unit addWeapon "arifle_MXC_F";
					_unit addPrimaryWeaponItem "muzzle_snds_H";
					_unit addPrimaryWeaponItem "acc_pointer_IR";
					_unit addPrimaryWeaponItem "optic_Hamr";
					_unit addWeapon "hgun_P07_F";
					_unit addWeapon "Rangefinder";

					comment "Add items";
					_unit linkItem "ItemMap";
					_unit linkItem "ItemCompass";
					_unit linkItem "ItemWatch";
					_unit linkItem "ItemRadio";
					_unit linkItem "ItemGPS";
					_unit linkItem "NVGoggles";

			};
			case 21:{
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					_unit forceAddUniform "U_B_CTRG_1";
					for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
					_unit addItemToUniform "Chemlight_blue";
					_unit addItemToUniform "Chemlight_red";
					_unit addItemToUniform "SmokeShell";
					_unit addItemToUniform "SmokeShellRed";
					_unit addItemToUniform "SmokeShellBlue";
					_unit addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
					for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
					for "_i" from 1 to 3 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
					_unit addItemToVest "B_IR_Grenade";
					_unit addBackpack "B_TacticalPack_mcamo";
					_unit addItemToBackpack "Medikit";
					for "_i" from 1 to 11 do {_unit addItemToBackpack "FirstAidKit";};
					_unit addItemToBackpack "MiniGrenade";
					_unit addItemToBackpack "B_IR_Grenade";
					_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";
					for "_i" from 1 to 3 do {_unit addItemToBackpack "SmokeShell";};
					_unit addHeadgear "H_HelmetSpecB_paint2";

					comment "Add weapons";
					_unit addWeapon "arifle_MX_SW_Black_F";
					_unit addPrimaryWeaponItem "acc_pointer_IR";
					_unit addPrimaryWeaponItem "optic_Hamr";
					_unit addWeapon "hgun_P07_F";
					_unit addWeapon "Rangefinder";

					comment "Add items";
					_unit linkItem "ItemMap";
					_unit linkItem "ItemCompass";
					_unit linkItem "ItemWatch";
					_unit linkItem "ItemRadio";
					_unit linkItem "ItemGPS";
					_unit linkItem "NVGoggles";

			};
			case 22:{
					comment "Exported from Arsenal by [BB]Al Nazir";

					comment "Add containers";
					_unit forceAddUniform "U_B_CTRG_3";
					for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
					_unit addItemToUniform "Chemlight_blue";
					_unit addItemToUniform "Chemlight_red";
					_unit addItemToUniform "SmokeShellRed";
					_unit addItemToUniform "SmokeShell";
					_unit addItemToUniform "SmokeShellBlue";
					_unit addVest "V_PlateCarrierGL_rgr";
					for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
					for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
					_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
					_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
					_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
					_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
					_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
					_unit addItemToVest "HandGrenade";
					for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
					_unit addItemToVest "16Rnd_9x21_Mag";
					_unit addBackpack "B_AssaultPack_mcamo";
					for "_i" from 1 to 10 do {_unit addItemToBackpack "FirstAidKit";};
					_unit addItemToBackpack "Medikit";
					_unit addHeadgear "H_HelmetSpecB_paint1";

					comment "Add weapons";
					_unit addWeapon "arifle_MXC_F";
					_unit addPrimaryWeaponItem "muzzle_snds_H";
					_unit addPrimaryWeaponItem "acc_pointer_IR";
					_unit addPrimaryWeaponItem "optic_Hamr";
					_unit addWeapon "hgun_P07_F";
					_unit addWeapon "Rangefinder";

					comment "Add items";
					_unit linkItem "ItemMap";
					_unit linkItem "ItemCompass";
					_unit linkItem "ItemWatch";
					_unit linkItem "ItemRadio";
					_unit linkItem "ItemGPS";
					_unit linkItem "NVGoggles";

			};
		};
	};
	
	case "B_engineer_F":{//инженер-подрывник
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CombatUniform_mcam";
				for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
				_unit addItemToUniform "Chemlight_blue";
				_unit addItemToUniform "Chemlight_red";
				_unit addItemToUniform "B_IR_Grenade";
				_unit addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
				for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
				_unit addItemToVest "SmokeShellRed";
				_unit addItemToVest "SmokeShellPurple";
				_unit addItemToVest "SmokeShellBlue";
				_unit addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 6 do {_unit addItemToVest "20Rnd_762x51_Mag";};
				_unit addItemToVest "MiniGrenade";
				_unit addBackpack "B_Carryall_khk";
				_unit addItemToBackpack "MineDetector";
				_unit addItemToBackpack "ToolKit";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};
				_unit addItemToBackpack "B_IR_Grenade";
				_unit addItemToBackpack "APERSBoundingMine_Range_Mag";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
				_unit addItemToBackpack "APERSTripMine_Wire_Mag";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
				for "_i" from 1 to 2 do {_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";};
				_unit addHeadgear "H_HelmetB_camo";

				comment "Add weapons";
				_unit addWeapon "srifle_EBR_F";
				_unit addPrimaryWeaponItem "muzzle_snds_B";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_DMS";
				_unit addWeapon "hgun_P07_F";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CTRG_1";
				for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
				_unit addItemToUniform "Chemlight_blue";
				_unit addItemToUniform "Chemlight_red";
				_unit addItemToUniform "B_IR_Grenade";
				_unit addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
				for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
				_unit addItemToVest "SmokeShellRed";
				_unit addItemToVest "SmokeShellPurple";
				_unit addItemToVest "SmokeShellBlue";
				_unit addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 6 do {_unit addItemToVest "20Rnd_762x51_Mag";};
				_unit addItemToVest "MiniGrenade";
				_unit addBackpack "B_Carryall_cbr";
				_unit addItemToBackpack "MineDetector";
				_unit addItemToBackpack "ToolKit";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "20Rnd_762x51_Mag";};
				_unit addItemToBackpack "B_IR_Grenade";
				_unit addItemToBackpack "APERSBoundingMine_Range_Mag";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";};
				_unit addItemToBackpack "APERSTripMine_Wire_Mag";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
				for "_i" from 1 to 2 do {_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";};
				_unit addHeadgear "H_HelmetB_camo";

				comment "Add weapons";
				_unit addWeapon "srifle_EBR_F";
				_unit addPrimaryWeaponItem "muzzle_snds_B";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_DMS";
				_unit addWeapon "hgun_P07_F";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
		};
	};
	
	case "B_soldier_exp_F":{//сапер-подрывник
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CombatUniform_mcam_vest";
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

				comment "Add weapons";
				_unit addWeapon "arifle_MX_SW_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "hgun_P07_F";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CTRG_3";
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
				_unit addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				_unit addWeapon "arifle_MX_SW_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "hgun_P07_F";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";			
			};
		};
	};
	
	case "B_soldier_AA_F":{//стрелок ПВО
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CombatUniform_mcam";
				for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
				_unit addItemToUniform "Chemlight_blue";
				_unit addItemToUniform "Chemlight_red";
				_unit addItemToUniform "SmokeShell";
				_unit addItemToUniform "SmokeShellBlue";
				_unit addItemToUniform "SmokeShellRed";
				_unit addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
				_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
				_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
				_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				_unit addItemToVest "SmokeShellBlue";
				_unit addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 2 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
				for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
				_unit addBackpack "B_Carryall_khk";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
				_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AA";};
				_unit addHeadgear "H_HelmetSpecB_paint2";

				comment "Add weapons";
				_unit addWeapon "arifle_MX_SW_Black_F";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "launch_B_Titan_F";
				_unit addWeapon "hgun_P07_F";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CTRG_1";
				for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
				_unit addItemToUniform "Chemlight_blue";
				_unit addItemToUniform "Chemlight_red";
				_unit addItemToUniform "SmokeShell";
				_unit addItemToUniform "SmokeShellRed";
				_unit addItemToUniform "SmokeShellBlue";
				_unit addVest "V_PlateCarrierGL_rgr";
				for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
				_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
				_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
				_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				_unit addItemToVest "SmokeShellRed";
				_unit addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 2 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
				for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
				_unit addBackpack "B_Carryall_khk";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
				_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AA";};
				_unit addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				_unit addWeapon "arifle_MX_SW_Black_F";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "launch_B_Titan_F";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
		};
	};
	
	case "B_soldier_AT_F":{//стрелок ПТ
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CombatUniform_mcam";
				for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
				_unit addItemToUniform "Chemlight_blue";
				_unit addItemToUniform "Chemlight_red";
				_unit addItemToUniform "SmokeShell";
				_unit addItemToUniform "SmokeShellRed";
				_unit addItemToUniform "SmokeShellBlue";
				_unit addVest "V_PlateCarrierGL_rgr";
				_unit addItemToVest "SmokeShell";
				for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
				_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
				_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
				_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				_unit addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 2 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
				for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
				_unit addBackpack "B_Carryall_khk";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
				_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AT";};
				_unit addHeadgear "H_HelmetSpecB_paint2";

				comment "Add weapons";
				_unit addWeapon "arifle_MX_SW_Black_F";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "launch_B_Titan_short_F";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CTRG_1";
				for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
				_unit addItemToUniform "Chemlight_blue";
				_unit addItemToUniform "Chemlight_red";
				_unit addItemToUniform "SmokeShell";
				_unit addItemToUniform "SmokeShellRed";
				_unit addItemToUniform "SmokeShellBlue";
				_unit addVest "V_PlateCarrierGL_rgr";
				_unit addItemToVest "SmokeShell";
				for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
				_unit addItemToVest "3Rnd_UGL_FlareWhite_F";
				_unit addItemToVest "1Rnd_Smoke_Grenade_shell";
				for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
				_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
				_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
				_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
				_unit addItemToVest "B_IR_Grenade";
				for "_i" from 1 to 2 do {_unit addItemToVest "100Rnd_65x39_caseless_mag_Tracer";};
				_unit addBackpack "B_Carryall_khk";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "100Rnd_65x39_caseless_mag_Tracer";};
				for "_i" from 1 to 2 do {_unit addItemToBackpack "Titan_AT";};
				_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
				_unit addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				_unit addWeapon "arifle_MX_SW_Black_F";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "launch_B_Titan_short_F";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
		};
	};
	
	case "B_Soldier_TL_F":{//командир звена
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
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

				comment "Add weapons";
				_unit addWeapon "arifle_MX_GL_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CTRG_2";
				for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
				_unit addItemToUniform "Chemlight_blue";
				_unit addItemToUniform "Chemlight_red";
				_unit addItemToUniform "SmokeShell";
				_unit addItemToUniform "SmokeShellRed";
				_unit addItemToUniform "SmokeShellBlue";
				_unit addVest "V_PlateCarrierGL_rgr";
				_unit addItemToVest "SmokeShell";
				_unit addItemToVest "MiniGrenade";
				for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
				_unit addItemToVest "HandGrenade";
				for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
				_unit addItemToVest "UGL_FlareCIR_F";
				_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";
				_unit addBackpack "B_AssaultPack_mcamo";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "FirstAidKit";};
				for "_i" from 1 to 2 do {_unit addItemToBackpack "3Rnd_UGL_FlareWhite_F";};
				for "_i" from 1 to 3 do {_unit addItemToBackpack "30Rnd_65x39_caseless_mag";};
				_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";
				_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";
				_unit addItemToBackpack "1Rnd_SmokePurple_Grenade_shell";
				_unit addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";
				for "_i" from 1 to 3 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
				_unit addItemToBackpack "UGL_FlareRed_F";
				_unit addItemToBackpack "3Rnd_UGL_FlareCIR_F";
				_unit addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				_unit addWeapon "arifle_MX_GL_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
		};		
	};
	
	case "B_Soldier_GL_F":{//стрелок ГП
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CombatUniform_mcam_tshirt";
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

				comment "Add weapons";
				_unit addWeapon "arifle_MX_GL_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CTRG_2";
				for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
				_unit addItemToUniform "Chemlight_blue";
				_unit addItemToUniform "Chemlight_red";
				_unit addItemToUniform "SmokeShell";
				_unit addItemToUniform "SmokeShellRed";
				_unit addItemToUniform "SmokeShellBlue";
				_unit addVest "V_PlateCarrierGL_rgr";
				_unit addItemToVest "SmokeShell";
				_unit addItemToVest "MiniGrenade";
				for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
				_unit addItemToVest "HandGrenade";
				for "_i" from 1 to 3 do {_unit addItemToVest "16Rnd_9x21_Mag";};
				_unit addItemToVest "UGL_FlareCIR_F";
				_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";
				_unit addBackpack "B_AssaultPack_mcamo";
				for "_i" from 1 to 2 do {_unit addItemToBackpack "FirstAidKit";};
				for "_i" from 1 to 2 do {_unit addItemToBackpack "3Rnd_UGL_FlareWhite_F";};
				for "_i" from 1 to 3 do {_unit addItemToBackpack "30Rnd_65x39_caseless_mag";};
				_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";
				_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";
				_unit addItemToBackpack "1Rnd_SmokePurple_Grenade_shell";
				_unit addItemToBackpack "1Rnd_SmokeBlue_Grenade_shell";
				for "_i" from 1 to 3 do {_unit addItemToBackpack "3Rnd_HE_Grenade_shell";};
				_unit addItemToBackpack "UGL_FlareRed_F";
				_unit addItemToBackpack "3Rnd_UGL_FlareCIR_F";
				_unit addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				_unit addWeapon "arifle_MX_GL_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
		};		
	};
	
	case "B_soldier_AR_F":{//пулеметчик
		switch (_nabor) do{
			case 1:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CombatUniform_mcam_vest";
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

				comment "Add weapons";
				_unit addWeapon "LMG_Mk200_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H_MG";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
			case 2:{
				comment "Exported from Arsenal by [BB]Al Nazir";

				comment "Add containers";
				_unit forceAddUniform "U_B_CTRG_3";
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
				_unit addHeadgear "H_HelmetSpecB_paint1";

				comment "Add weapons";
				_unit addWeapon "LMG_Mk200_F";
				_unit addPrimaryWeaponItem "muzzle_snds_H_MG";
				_unit addPrimaryWeaponItem "acc_pointer_IR";
				_unit addPrimaryWeaponItem "optic_Hamr";
				_unit addWeapon "hgun_P07_F";
				_unit addHandgunItem "muzzle_snds_L";
				_unit addWeapon "Rangefinder";

				comment "Add items";
				_unit linkItem "ItemMap";
				_unit linkItem "ItemCompass";
				_unit linkItem "ItemWatch";
				_unit linkItem "ItemRadio";
				_unit linkItem "ItemGPS";
				_unit linkItem "NVGoggles";

			};
		};			
	};
		
	// Слоты вне основных отделений
	case "B_sniper_F": {	//снайпер
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		_unit forceAddUniform "U_B_GhillieSuit";
		for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
		_unit addItemToUniform "SmokeShellRed";
		_unit addItemToUniform "SmokeShellBlue";
		_unit addVest "V_PlateCarrierGL_rgr";
		for "_i" from 1 to 7 do {_unit addItemToVest "7Rnd_408_Mag";};
		_unit addItemToVest "HandGrenade";
		_unit addItemToVest "APERSTripMine_Wire_Mag";
		_unit addItemToVest "16Rnd_9x21_Mag";
		_unit addHeadgear "H_CrewHelmetHeli_B";

		comment "Add weapons";
		_unit addWeapon "srifle_LRR_camo_F";
		_unit addPrimaryWeaponItem "optic_SOS";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles";

	};
	
	case "B_spotter_F": {	//корректировщик
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		_unit forceAddUniform "U_B_GhillieSuit";
		for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
		_unit addItemToUniform "16Rnd_9x21_Mag";
		_unit addItemToUniform "SmokeShellRed";
		_unit addItemToUniform "SmokeShellBlue";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "HandGrenade";
		_unit addItemToVest "APERSTripMine_Wire_Mag";
		_unit addItemToVest "APERSBoundingMine_Range_Mag";
		_unit addItemToVest "ClaymoreDirectionalMine_Remote_Mag";
		for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addHeadgear "H_CrewHelmetHeli_B";

		comment "Add weapons";
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "muzzle_snds_H";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Laserdesignator";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles";

	};
		
	case "B_Helipilot_F": {//Пилот боевого вертолета
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		_unit forceAddUniform "U_B_HeliPilotCoveralls";
		_unit addItemToUniform "FirstAidKit";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_mag";};
		_unit addHeadgear "H_PilotHelmetHeli_B";

		comment "Add weapons";
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
	case "B_helicrew_F": {//пилот транспортного вертолета
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		_unit forceAddUniform "U_B_HeliPilotCoveralls";
		_unit addItemToUniform "FirstAidKit";
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_mag";};
		_unit addHeadgear "H_CrewHelmetHeli_B";

		comment "Add weapons";
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
	case "B_Pilot_F": {//пилот истребителя
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		_unit forceAddUniform "U_B_PilotCoveralls";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_65x39_caseless_mag";};
		for "_i" from 1 to 2 do {_unit addItemToUniform "16Rnd_9x21_Mag";};
		_unit addItemToUniform "SmokeShellPurple";
		_unit addBackpack "B_Parachute";
		_unit addHeadgear "H_PilotHelmetFighter_B";

		comment "Add weapons";
		_unit addWeapon "arifle_MXC_Black_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addWeapon "Binocular";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";

	};
	
	//Экипажи
	
	case "B_soldier_repair_F": { //Механик водитель
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 2 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		_unit addItemToUniform "30Rnd_65x39_caseless_mag";
		_unit addItemToUniform "SmokeShellRed";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "MineDetector";
		for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
		_unit addItemToVest "MiniGrenade";
		_unit addItemToVest "SmokeShell";
		_unit addItemToVest "SmokeShellRed";
		_unit addItemToVest "SmokeShellPurple";
		_unit addItemToVest "SmokeShellBlue";
		_unit addItemToVest "B_IR_Grenade";
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "Chemlight_red";
		_unit addItemToVest "Chemlight_blue";
		_unit addBackpack "B_AssaultPack_mcamo";
		_unit addItemToBackpack "ToolKit";
		_unit addItemToBackpack "SLAMDirectionalMine_Wire_Mag";
		_unit addItemToBackpack "ClaymoreDirectionalMine_Remote_Mag";
		_unit addHeadgear "H_HelmetCrew_B";
		_unit addGoggles "G_Goggles_VR";

		comment "Add weapons";
		_unit addWeapon "arifle_MXC_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles_OPFOR";
	};
	
	case "B_support_Mort_F": { //стрелок экипажа
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
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

		comment "Add weapons";
		_unit addWeapon "arifle_MX_SW_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles_OPFOR";

	};
	
	case "B_crew_F": { //командир экипажа
		comment "Exported from Arsenal by [BB]Al Nazir";

		comment "Add containers";
		_unit forceAddUniform "U_B_CombatUniform_mcam";
		for "_i" from 1 to 3 do {_unit addItemToUniform "FirstAidKit";};
		_unit addItemToUniform "Chemlight_red";
		_unit addItemToUniform "Chemlight_blue";
		_unit addItemToUniform "SmokeShell";
		_unit addItemToUniform "SmokeShellRed";
		_unit addItemToUniform "SmokeShellBlue";
		_unit addVest "V_PlateCarrierGL_rgr";
		_unit addItemToVest "HandGrenade";
		_unit addItemToVest "Chemlight_blue";
		for "_i" from 1 to 2 do {_unit addItemToVest "30Rnd_65x39_caseless_mag";};
		_unit addItemToVest "Chemlight_red";
		_unit addItemToVest "3Rnd_UGL_FlareCIR_F";
		for "_i" from 1 to 2 do {_unit addItemToVest "3Rnd_HE_Grenade_shell";};
		for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_65x39_caseless_mag_Tracer";};
		_unit addItemToVest "1Rnd_SmokePurple_Grenade_shell";
		_unit addItemToVest "1Rnd_SmokeBlue_Grenade_shell";
		_unit addItemToVest "UGL_FlareRed_F";
		_unit addItemToVest "MiniGrenade";
		for "_i" from 1 to 2 do {_unit addItemToVest "UGL_FlareCIR_F";};
		for "_i" from 1 to 2 do {_unit addItemToVest "UGL_FlareWhite_F";};
		_unit addHeadgear "H_HelmetCrew_B";

		comment "Add weapons";
		_unit addWeapon "arifle_MX_GL_F";
		_unit addPrimaryWeaponItem "acc_pointer_IR";
		_unit addPrimaryWeaponItem "optic_Hamr";
		_unit addWeapon "hgun_P07_F";
		_unit addWeapon "Rangefinder";

		comment "Add items";
		_unit linkItem "ItemMap";
		_unit linkItem "ItemCompass";
		_unit linkItem "ItemWatch";
		_unit linkItem "ItemRadio";
		_unit linkItem "ItemGPS";
		_unit linkItem "NVGoggles_OPFOR";

	};
	
};
waitUntil {sleep 1.217; !alive player};
};