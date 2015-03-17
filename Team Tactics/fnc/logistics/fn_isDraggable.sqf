/*
	Author: Eightysix

	Description:
	checks if an object can be dragged

	Syntax:
	<object> call PO3_fnc_isDraggable

	Returns: BOOLEAN
*/
private["_dragger","_object","_draggerSize","_objectSize"];

_dragger = _this select 0;
_object = _this select 1;

_draggerSize = 0;
if( _dragger isKindOf "CaManBase" )then { _draggerSize = 5 }else{
	{ if( _dragger isKindOf (_x select 0) ) exitWith { _draggerSize = _x select 1 } }forEach PO3_CfgLogistics_Loadable;
};

_objectSize = 0;
{ if( _object isKindOf (_x select 0) ) exitWith { _objectSize = _x select 1 } }forEach PO3_CfgLogistics_Liftable;

if( _objectSize == 0 || _draggerSize == 0 ) exitWith { false };
if( _draggerSize >= _objectSize || _object getVariable ["PO3_draggable",false] ) exitWith { true };

false;