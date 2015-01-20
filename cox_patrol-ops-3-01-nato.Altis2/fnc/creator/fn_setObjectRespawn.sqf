/*
	Author: Eightysix

	Description:
	Enables an array of object(s) to be dragable

	Syntax:
	[<Object(s)>,<number>,<number>,<number>] call PO3_fnc_setObjectRespawn

	Returns: Nothing
*/
private["_objs","_dead","_empty","_limit"];

_objs	= _this select 0;
_dead	= if( count _this > 1 ) then { _this select 1 }else{ 600 };
_empty	= if( count _this > 2 ) then { _this select 2 }else{ 600 };
_limit	= if( count _this > 3 ) then { _this select 3 }else{ -1 };

if(typeName _objs != typeName []) then { _objs = [_objs] };

{
	_x setVariable ["PO3_respawn",[_dead,_empty,_limit],isServer];
}forEach _objs;

true;