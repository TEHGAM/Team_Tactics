/*
	Author: Shuko Modified by Eightysix

	{COMPRESSED}

	Description:
	Do Not Call Directly
*/
private ["_pos1","_pos2","_return"];

_pos1 = _this select 0;
_pos2 = _this select 1;

_return = if( (_pos1 select 0) == (_pos2 select 0) && (_pos1 select 1) == (_pos2 select 1) ) then { true } else { false };

_return