/*
	Author: Eightysix

	Description:
	checks if an object is liftable by a vehicle

	Syntax:
	[<OBJECT>,<OBJECT>] call PO3_fnc_isLiftable

	Returns: BOOLEAN
*/
private["_lifter","_object","_lifterSize","_objectSize"];

_lifter = _this select 0;
_object = _this select 1;

if !(isNull (_object getVariable ["PO3_loaded",objNull]) ) exitWith { false };
if( _object getVariable ["PO3_liftable",false] && count(crew _object) == 0 ) exitWith { true };

_lifterSize = 0;
{ if( _lifter isKindOf (_x select 0) ) exitWith { _lifterSize = _x select 1 } }forEach PO3_CfgLogistics_Loadable;

_objectSize = 0;
{ if( _object isKindOf (_x select 0) ) exitWith { _objectSize = _x select 1 } }forEach PO3_CfgLogistics_Liftable;

if( _lifterSize == 0 || _objectSize == 0 ) exitWith { false };
if( _lifterSize >= _objectSize && count(crew _object) == 0 ) exitWith { true };

false;