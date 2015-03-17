/*
	Author: Eightysix

	Description:
	Enables an array of objects to be loadable

	Syntax:
	<array of Objects> call PO3_fnc_setLoadable

	Returns: Nothing
*/
private["_objects"];

_objects= _this;

if(typeName _objects != typeName []) then { _objects = [_objects] };

{
	_x setVariable ["PO3_loadable",true,isServer];
	_x setVariable ["PO3_loaded",objNull,isServer];
}forEach _objects;

true;