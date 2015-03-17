scriptName "PO3\fnc\config\fn_getCfgPO3.sqf";
/*
	Author: RoyEightySix (http://roy86.com.au)

	Description:

	Parameter(s):

	Returns:

*/
private["_vehicle","_check","_type","_list","_return"];

_vehicle = _this select 0;
_check = _this select 1;

if(isNil "_check") exitWith { ["Unable to define Vehicle Config"] call PO3_fnc_hint; false };

_type = if(typeName _vehicle == "OBJECT") then { typeOf _vehicle }else{ _vehicle };

_return = false;
switch toUpper(_check) do {
	case "CRV" : { if({_vehicle isKindof _x} count ["B_APC_Tracked_01_CRV_F"] > 0) then { _return = true }; };
	case "RESUPPPLY" : { _vehicle getVariable ["PO3_respply",false]; };	// Boolean
	case "LOADABLE" : {
		if( _vehicle getVariable ["PO3_loadable",false] ) then { true }else{ false };
		{
			if( _vehicle isKindof (_x select 0) ) exitWith { _return = true };
		} forEach PO3_CfgLogistics_Loadable;
	};
	case "LIFTABLE" : {
		if( _vehicle getVariable ["PO3_liftable",false] ) then { true }else{ false };
		{
			if( _vehicle isKindof (_x select 0) ) exitWith { _return = true };
		} forEach PO3_CfgLogistics_Liftable;
	};
	case "TOW" : {
		if( _vehicle getVariable ["PO3_towable",false] ) then { true }else{ false };
		{
			if( _vehicle isKindof (_x select 0) ) exitWith { _return = true };
		} forEach PO3_CfgLogistics_towable;
	};
	case "DRAG" : {
		if( _vehicle getVariable ["PO3_draggable",false] ) then { true }else{ false };
		{
			if( _vehicle isKindof (_x select 0) ) exitWith { _return = true };
		} forEach PO3_CfgLogistics_Moveable;
	};
};

_return;