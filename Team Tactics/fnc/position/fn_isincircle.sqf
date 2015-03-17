/*
	Author: Shuko Modified by Eightysix

	Description:
	Do Not Call Directly
*/
private ["_pos","_area","_posX","_posY","_c","_cX","_cY","_size","_difX","_difY","_return"];

_pos = _this select 0;
_area = _this select 1;

_posX = _pos select 0;
_posY = _pos select 1;

_c = getMarkerPos _area;

_cX = _c select 0;
_cY = _c select 1;

_size = (getMarkerSize _area) select 0;

_difX = _posX - _cX;
_difY = _posY - _cY;

_return = if (sqrt((_difX * _difX) + (_difY * _difY)) < _size) then { true }else{ false };

_return