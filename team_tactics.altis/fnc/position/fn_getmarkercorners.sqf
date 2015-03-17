/*
	Author: Shuko Modified by Eightysix

	Description:
	Do Not Call Directly
*/
private ["_marker","_corners","_center","_centerX","_centerY","_dir","_dirCos",
	"_dirSin","_size","_sizeX","_sizeY","_cosX","_sinX","_cosY","_sinY",
	"_addX","_addY","_subX","_subY","_posX","_posY"];

_marker = _this;

_corners = [];

_center = getMarkerPos _marker;
_centerX = _center select 0;
_centerY = _center select 1;
_dir = (markerDir _marker) * -1;
_dir = _dir % 360;

_dirCos = cos _dir;
_dirSin = sin _dir;

_size  = getMarkerSize _marker;
_sizeX = _size select 0;
_sizeY = _size select 1;

_cosX = _dirCos * _sizeX;
_sinX = _dirSin * _sizeX;
_cosY = _dirCos * _sizeY;
_sinY = _dirSin * _sizeY;

_addX = _cosX + _sinY;
_addY = _sinX + _cosY;

_subX = _cosX - _sinY;
_subY = _sinX - _cosY;

_posX = _centerX - _subX;
_posY = _centerY - _addY;
_corners set [0,[_posX,_posY]];

_posX = _centerX - _addX;
_posY = _centerY - _subY;
_corners set [1,[_posX,_posY]];

_posX = _centerX + _subX;
_posY = _centerY + _addY;
_corners set [2,[_posX,_posY]];

_posX = _centerX + _addX;
_posY = _centerY + _subY;
_corners set [3,[_posX,_posY]];

_corners