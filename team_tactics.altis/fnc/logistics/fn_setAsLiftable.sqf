/*
	Author: Eightysix

	Description:
	Enables an array of object(s) to be liftable

	Syntax:
	<Object(s)> call PO3_fnc_setLoadable

	Returns: Nothing
*/
private["_objects"];

_objects= _this;

if(typeName _objects != typeName []) then { _objects = [_objects] };

{
	_x setVariable ["PO3_liftable",true,isServer];
	_x setVariable ["PO3_lifted",objNull,isServer];
}forEach _objects;

true;