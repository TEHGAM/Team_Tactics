scriptName "PO3\fnc\config\fn_getCfgWeaponMags.sqf";
/*
	Author: Eightysix

	Description:

	Syntax:

	Example:
*/
private["_object","_mags","_EGLM","_return"];

_object = switch (typeName (_this select 0)) do {
	case "OBJECT" : { typeOf (_this select 0) };
	default { (_this select 0) };
};

_mags = if( isClass(configFile >> "CfgWeapons" >> _object) ) then {
	getArray(configFile >> "CfgWeapons" >> _object >> "magazines");
}else{
	[];
};

_EGLM = if( isClass(configFile >> "CfgWeapons" >> _object >> "EGLM") ) then {
	getArray(configFile >> "CfgWeapons" >> _object >> "EGLM" >> "magazines");
}else{
	[];
};

_return = _mags + _EGLM;
_return