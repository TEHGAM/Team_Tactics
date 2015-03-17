/*
	Author: Shuko Modified by Eightysix

	{COMPRESSED}

	Description:
	Do Not Call Directly
*/
private ["_pos","_corners","_return","_dotX","_dotY","_sw","_w","_s","_ne","_e","_n"];

_pos = _this select 0;
_corners = _this select 1;

_dotX = _pos select 0;
_dotY = _pos select 1;

_sw = _corners select 0;
_ne = _corners select 2;
_e  = _ne select 0;
_n  = _ne select 1;
_w  = _sw select 0;
_s  = _sw select 1;

_return = if (_dotX >= _w && _dotX < _e && _dotY >= _s && _dotY < _n) then { true }else{ false };

_return