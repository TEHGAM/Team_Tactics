/*
	Author: Eightysix

	Description:
	checks if an object is loadable

	Syntax:
	[<OBJECT>,<OBJECT>] call PO3_fnc_isLoadable

	Returns: BOOLEAN
*/
private["_loader","_object","_loaderSize","_objectSize"];

_loader = _this select 0;
_object = _this select 1;

if( _object getVariable ["PO3_loadable",false] && count(crew _object) == 0 ) exitWith { true };

_loaderSize = 0;
{ if( _loader isKindOf (_x select 0) ) exitWith { _loaderSize = _x select 1 } }forEach PO3_CfgLogistics_Loadable;

_objectSize = 0;
{ if( _object isKindOf (_x select 0) ) exitWith { _objectSize = _x select 1 } }forEach PO3_CfgLogistics_Liftable;

if( _objectSize == 0 || _loaderSize == 0 ) exitWith { false };
if( _loaderSize >= _objectSize && count(crew _object) == 0 ) exitWith { true };

false;