/*
	Author: Eightysix with thanks to Mattar_Tharkari for velocity correction

	Description:
	create a flare at a position/object/marker

	Syntax:
	[<position>,<type>] call PO3_fnc_craeteFlare

		position - Array, String, Object
		type - Class name Summarized

	Returns: flare object
*/
private["_position","_class","_flare"];

_position = (_this select 0) call PO3_fnc_getPos;
_type = if( typeName (_this select 0) == typeName objNull) then {
	(_this select 0) getVariable ["PO3_VehicleCfg_IllumClass",(_this select 1)];
}else{
	(_this select 1);
};

_class = switch (toLower _type) do {
	case "20_green" :	{ "F_20mm_Green" };
	case "20_red" :		{ "F_20mm_Red" };
	case "20_white" :	{ "F_20mm_White" };
	case "20_yellow" :	{ "F_20mm_Yellow" };
	case "40_green" :	{ "F_40mm_Green" };
	case "40_ir" :		{ "F_40mm_Cir" };
	case "40_red" :		{ "F_40mm_Red" };
	case "40_white" :	{ "F_40mm_White" };
	case "40_yellow" :	{ "F_40mm_Yellow" };
	default { nil };
};

if(isNil "_class") exitWith { ["Flare","Incorrect Class Type Requested",true] call PO3_fnc_log };

_flare = createVehicle [_class,_position,[],0,"FLY"];
_flare setVelocity [0,0,-0.01];

[true,"HINT",format[localize "STR_PO3_LOGIST_ILLUMFLARE0",_class,mapGridPosition _position] ] call PO3_fnc_hint;
["Flare",format["%1 Flare created at %2",_class,_position] ] call PO3_fnc_log;

_flare;