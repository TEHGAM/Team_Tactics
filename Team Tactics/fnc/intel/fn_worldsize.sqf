private ["_config", "_entryName","_entry", "_value"];

_config = configfile >> "cfgworlds" >> worldname;
_entryName = "mapSize";

_entry = _config >> _entryName;

if (((configName (_config >> _entryName)) == "") && (!((configName _config) in ["CfgVehicles", "CfgWeapons", ""]))) then {
	[inheritsFrom _config, _entryName] call BIS_fnc_returnConfigEntry;
}else{
	if (isNumber _entry) then {
		_value = getNumber _entry;
	}else{
		if (isText _entry) then {
			_value = getText _entry;
		}else{
			if (isArray _entry) then {
				_value = getArray _entry;
			};
		};
	};
};

if (isNil "_value") exitWith { 10000 };
 
_value