private["_cache","_rank","_timer"];

_cache = _this select 0;
//_data = [];

player reveal _cache;

_cache setVariable ["PO3_VAS",true,false];

while {alive _cache} do {

	//_data = call PO3_fnc_getCfgPO3Loadout;

	//if(isNil "_data") exitWith{};

	_rank = rank player;
	_timer = 30;

	{deleteVehicle _x} foreach nearestObjects [position _cache,["WeaponHolder"],50];

	clearMagazineCargo _cache;
	clearWeaponCargo _cache;
	clearItemCargo _cache;
	clearBackpackCargo _cache;
	
	//Задаем экипировку!!!
	//_cache addMagazineCargo ["",];
	_cache addMagazineCargo ["100Rnd_65x39_caseless_mag_Tracer",30];
	_cache addMagazineCargo ["100Rnd_65x39_caseless_mag",20];
	_cache addMagazineCargo ["7Rnd_408_Mag",20];
	_cache addMagazineCargo ["30Rnd_65x39_caseless_mag_Tracer",50];
	_cache addMagazineCargo ["30Rnd_65x39_caseless_mag",50];
	_cache addMagazineCargo ["200Rnd_65x39_cased_Box",10];
	_cache addMagazineCargo ["200Rnd_65x39_cased_Box_Tracer",12];
	_cache addMagazineCargo ["NLAW_F",10];
	
	_cache addMagazineCargo ["16Rnd_9x21_Mag",20];
	_cache addMagazineCargo ["30Rnd_9x21_Mag",10];
	
	_cache addMagazineCargo ["Titan_AA",8];
	_cache addMagazineCargo ["Titan_AT",10];
	_cache addMagazineCargo ["Titan_AP",4];
	
	_cache addMagazineCargo ["3Rnd_HE_Grenade_shell",20];
	_cache addMagazineCargo ["1Rnd_HE_Grenade_shell",30];
	_cache addMagazineCargo ["1Rnd_Smoke_Grenade_shell",20];
	_cache addMagazineCargo ["3Rnd_Smoke_Grenade_shell",10];
	_cache addMagazineCargo ["1Rnd_SmokeRed_Grenade_shell",10];
	_cache addMagazineCargo ["3Rnd_SmokeRed_Grenade_shell",5];
	_cache addMagazineCargo ["1Rnd_SmokeGreen_Grenade_shell",10];
	_cache addMagazineCargo ["3Rnd_SmokeGreen_Grenade_shell",5];
	_cache addMagazineCargo ["1Rnd_SmokeYellow_Grenade_shell",10];
	_cache addMagazineCargo ["3Rnd_SmokeYellow_Grenade_shell",5];
	_cache addMagazineCargo ["1Rnd_SmokePurple_Grenade_shell",10];
	_cache addMagazineCargo ["3Rnd_SmokePurple_Grenade_shell",5];
	_cache addMagazineCargo ["3Rnd_SmokeBlue_Grenade_shell",5];
	_cache addMagazineCargo ["3Rnd_SmokeOrange_Grenade_shell",5];
	_cache addMagazineCargo ["1Rnd_SmokeBlue_Grenade_shell",10];
	_cache addMagazineCargo ["1Rnd_SmokeOrange_Grenade_shell",10];
	
	_cache addMagazineCargo ["HandGrenade",40];
	_cache addMagazineCargo ["MiniGrenade",30];
	_cache addMagazineCargo ["B_IR_Grenade",20];
	_cache addMagazineCargo ["Chemlight_green",5];
	_cache addMagazineCargo ["Chemlight_red",5];
	_cache addMagazineCargo ["Chemlight_blue",5];
	_cache addMagazineCargo ["UGL_FlareWhite_F",15];
	_cache addMagazineCargo ["3Rnd_UGL_FlareWhite_F",10];
	_cache addMagazineCargo ["UGL_FlareGreen_F",15];
	_cache addMagazineCargo ["3Rnd_UGL_FlareGreen_F",10];
	_cache addMagazineCargo ["UGL_FlareRed_F",15];
	_cache addMagazineCargo ["3Rnd_UGL_FlareRed_F",10];
	_cache addMagazineCargo ["UGL_FlareYellow_F",15];
	_cache addMagazineCargo ["3Rnd_UGL_FlareYellow_F",10];
	_cache addMagazineCargo ["UGL_FlareCIR_F",15];
	_cache addMagazineCargo ["3Rnd_UGL_FlareCIR_F",10];
	_cache addMagazineCargo ["FlareWhite_F",10];
	_cache addMagazineCargo ["FlareGreen_F",10];
	_cache addMagazineCargo ["FlareRed_F",10];
	_cache addMagazineCargo ["FlareYellow_F",10];
	_cache addMagazineCargo ["20Rnd_762x51_Mag",30];
	
	_cache addItemCargo ["B_UavTerminal",2];
	_cache addItemCargo ["NVGoggles",3];
	_cache addItemCargo ["Rangefinder",2];
	_cache addItemCargo ["ToolKit",5];
	_cache addItemCargo ["Medikit",5];
	_cache addItemCargo ["FirstAidKit",50];
	_cache addItemCargo ["optic_Hamr",20];
	_cache addItemCargo ["acc_flashlight",10];
	_cache addItemCargo ["acc_pointer_IR",10];
	_cache addItemCargo ["optic_NVS",35];
	
	_cache addBackpackCargo ["B_B_Parachute_02_F",20];
	_cache addBackpackCargo ["B_AT_01_weapon_F",5];
	_cache addBackpackCargo ["B_AA_01_weapon_F",5];
	_cache addBackpackCargo ["B_GMG_01_high_weapon_F",5];
	_cache addBackpackCargo ["B_GMG_01_weapon_F",5];
	_cache addBackpackCargo ["B_HMG_01_high_weapon_F",5];
	_cache addBackpackCargo ["B_HMG_01_weapon_F",5];
	_cache addBackpackCargo ["B_HMG_01_support_high_F",15];
	_cache addBackpackCargo ["B_HMG_01_support_F",15];
	_cache addBackpackCargo ["B_Mortar_01_weapon_F",5];
	_cache addBackpackCargo ["B_Mortar_01_support_F",5];
	

//	{ _cache addWeaponCargo [_x, 1]; } foreach (_data select 0);
//	{ _cache addMagazineCargo [_x, 12]; } foreach (_data select 1);
//	{ _cache addItemCargo [_x, 2]; } foreach (_data select 2);
//	{ _cache addBackpackCargo [_x, 1]; } foreach (_data select 3);
//	{ _cache addItemCargo [_x, 1]; } foreach (_data select 4);
//	{ _cache addItemCargo [_x, 1]; } foreach (_data select 5);

	waitUntil { sleep 10; _timer = _timer - 1; !(rank player == _rank && _timer > 0) };
};
