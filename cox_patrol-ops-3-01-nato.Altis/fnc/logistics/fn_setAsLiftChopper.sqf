/*
	Author: Eightysix

	Description:
	Enables the helicopter as a Load Lifter

	Syntax:
	<array of Objects> call PO3_fnc_setLoadable

	Returns: Nothing
*/
private["_objects"];

_objects= _this;

if(typeName _objects != typeName []) then { _objects = [_objects] };

{
	if( _x isKindof "Helicopter") then {
		_x setVariable ["PO3_liftchopper",true,isServer];
	};
}forEach _objects;

true;