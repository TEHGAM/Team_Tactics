/*
	Author: Eightysix

	Description:
	Enables an array of object(s) to be dragable

	Syntax:
	<Object(s)> call PO3_fnc_setDragable

	Returns: Nothing
*/
private["_objects"];

_objects= _this;

if(typeName _objects != typeName []) then { _objects = [_objects] };

{
	_x setVariable ["PO3_dragable",true,isServer];
	_x setVariable ["PO3_dragged",objNull,isServer];
}forEach _objects;

true;