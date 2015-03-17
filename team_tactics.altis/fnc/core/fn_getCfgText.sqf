scriptName "PO3\fnc\config\fn_getCfgText.sqf";
/*
	Author: Eightysix

	Description:


	Syntax:


	Example:
*/
private["_object","_class","_text"];

_object = switch (typeName (_this select 0)) do {
	case "OBJECT"	: { typeOf (_this select 0) };
	default { (_this select 0) };
};

_class = switch (true) do {
	case ( isClass ( configFile >> "CfgWeapons"	>> _object ) ) : { "CfgWeapons" };
	case ( isClass ( configFile >> "CfgMagazines"	>> _object ) ) : { "CfgMagazines" };
	case ( isClass ( configFile >> "CfgAmmo"	>> _object ) ) : { "CfgAmmo" };
	case ( isClass ( configFile >> "CfgVehicles"	>> _object ) ) : { "CfgVehicles" };
	case ( isClass ( configFile >> "CfgGlasses"	>> _object ) ) : { "CfgGlasses" };
	case ( isClass ( configFile >> "CfgItems"	>> _object ) ) : { "CfgItems" };
	case ( isClass ( configFile >> "cfgGroupIcons"	>> _object ) ) : { "cfgGroupIcons" };
	case ( isClass ( configFile >> "CfgMarkers"	>> _object ) ) : { "CfgMarkers" };
	default { nil };
};

if(isNil "_class") exitWith { ["fnc_getCfgIcon",format["Detect Config TEXT Error of %1",_object]] call PO3_fnc_log; "" };
if(typeName _class != "STRING") exitWith { ["fnc_getCfgIcon",format["Detect Config TEXT Error of %1",_object]] call PO3_fnc_log; "" };

_text  = switch (_class) do {
	case "CfgGlasses";
	case "CfgItems";
	case "CfgWeapons";
	case "CfgVehicles";
	case "CfgVehicles"	: { getText(configFile >> _class >> _object >> "displayName") };
	case "cfgGroupIcons"	: { getText(configFile >> _class >> _object >> "picture") };
	default { nil };
};

_text;