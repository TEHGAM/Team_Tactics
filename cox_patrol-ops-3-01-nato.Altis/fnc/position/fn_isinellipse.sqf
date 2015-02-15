/*
	Author: Shuko Modified by Eightysix

	{COMPRESSED}

	Description:
	Do Not Call Directly
*/
private ["_pos","_area","_return","_size","_sizeX","_sizeY","_dir","_c","_cX","_cY","_posX","_posY","_dstX","_dstY","_sum"];

_pos = _this select 0;
_area = _this select 1;

_size = getMarkerSize _area;
_c = getMarkerPos _area;
_dir = (markerDir _area) % 360;

_sizeX = _size select 0;
_sizeY = _size select 1;

_cX = _c select 0;
_cY = _c select 1;

if (_dir % 90 != 0) then {
	private ["_orgX","_orgY","_shiftedX","_shiftedY"];

	_orgX = _pos select 0;
	_orgY = _pos select 1;

	_shiftedX = _orgX - _cX;
	_shiftedY = _orgY - _cY;

	_pos = [[_shiftedX,_shiftedY],_dir] call PO3_fnc_rotatePosition;
	_pos set [0,(_pos select 0) + _cX];
	_pos set [1,(_pos select 1) + _cY];
};

_posX = _pos select 0;
_posY = _pos select 1;

_dstX = abs(_posX - _cX);
_dstY = abs(_posY - _cY);

_sum = ((_dstX * _dstX)/(_sizeX * _sizeX)) + ((_dstY * _dstY)/(_sizeY * _sizeY));

_return = if (_sum <= 1) then { true }else { false };

_return