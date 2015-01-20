private "_unit";

_unit = _this;

if( vehicle _unit != _unit ) exitWith { [typeof vehicle _x] call PO3_fnc_getCfgIcon };

if(_unit getVariable ["PO3_injury_inAgony",false]) exitWith {
	"\A3\ui_f\data\IGUI\Cfg\Cursors\unitinjured_ca.paa";
};

if (getNumber(configFile >> "CfgVehicles" >> typeOf(_unit) >> "attendant") == 1) exitWith {
	"\A3\ui_f\data\map\vehicleicons\iconmanmedic_ca.paa";
};

if (getNumber(configFile >> "CfgVehicles" >> typeOf(_unit) >> "engineer") == 1) exitWith {
	"\A3\ui_f\data\map\vehicleicons\iconmanengineer_ca.paa";
};

if (getNumber(configFile >> "CfgVehicles" >> typeOf(_unit) >> "candeactivatemines") == 1) exitWith {
	"\A3\ui_f\data\map\vehicleicons\iconManExplosive_ca.paa";
};

if (leader(_unit) == _unit) exitWith {
	"\A3\ui_f\data\map\vehicleicons\iconManLeader_ca.paa";
};

if (getText(configFile >> "CfgWeapons" >> primaryWeapon(_unit) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa") exitWith {
	"\A3\ui_f\data\map\vehicleicons\iconManMG_ca.paa";
};

if (getText(configFile >> "CfgWeapons" >> secondaryWeapon(_unit) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa") exitWith {
	"\A3\ui_f\data\map\vehicleicons\iconManAT_ca.paa";
};

"\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa";