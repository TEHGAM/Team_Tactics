/*
	Author: Shuko Modified by Eightysix

	{COMPRESSED}

	Description:
	Do Not Call Directly
*/
private ["_center","_centerX","_centerY","_dirMrk","_size","_sizeX","_sizeY","_dir","_posX","_posY","_rand","_pos"];

_center  = getMarkerPos _this;
_centerX = _center select 0;
_centerY = _center select 1;

_dirMrk = (markerDir _this) * -1;
_dirMrk = _dirMrk % 360;

_size  = getMarkerSize _this;
_sizeX = _size select 0;
_sizeY = _size select 1;

if (_sizeX < _sizeY) then {
	_sizeX = _size select 1;
	_sizeY = _size select 0;
	_dirMrk = _dirMrk + 90;
};

_dir  = random 360;
_rand = sqrt random 1;
_posX = (_sizeX * (cos _dir)) * _rand;
_posY = (_sizeY * (sin _dir)) * _rand;

_pos  = [_posX,_posY];
if (_dirMrk != 0) then { _pos = [_pos,_dirMrk] call PO3_fnc_rotatePosition };

_posX = _centerX + (_pos select 0);
_posY = _centerY + (_pos select 1);

[_posX,_posY,0]