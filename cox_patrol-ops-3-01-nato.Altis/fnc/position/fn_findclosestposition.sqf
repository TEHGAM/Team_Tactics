/*
	Author: Shuko Modified by Eightysix

	{COMPRESSED}

	Description:
	Do Not Call Directly
*/
private ["_ref","_positions","_closest","_pos"];

_ref = _this select 0;
_positions = _this select 1;
_closest = _positions select 0;

{
	_pos = _x;
	if ((_pos distance _ref) < (_closest distance _ref)) then { _closest = _pos };
}forEach _positions;

_closest