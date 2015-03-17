/*
	Author: Shuko Modified by Eightysix

	{COMPRESSED}

	Description:
	Do Not Call Directly
*/
private ["_area","_water","_blist","_pos","_shape"];

_area	= _this select 0;
_dst	= if (count _this > 1) then { _this select 1 } else { 0 };
_dir	= if (count _this > 2) then { _this select 2 } else { random 360 };
_water	= if (count _this > 3) then { _this select 3 } else { true };
_road	= if (count _this > 4) then { _this select 4 } else { 0 };
_blist	= if (count _this > 5) then { _this select 5 } else { [] };

_pos	= getmarkerpos _area;
if( _pos distance [0,0,0] == 0 ) exitWith { _pos };

_shape = _area call PO3_fnc_getMarkerShape;
if (typename _blist == "STRING") then { _blist = [_blist] };

if (_shape == "ICON") then {
	if( !(_water) && surfaceIsWater _pos ) then {
		_pos = [0,0,0];
	}else{
		_pos = if(_dst != 0) then {
			[_pos,_dst,_dir] call PO3_fnc_getPosRadius
		}else{
			_pos
		};
	};
}else{
	private ["_i","_exit"];

	_exit = false;
	for [{_i = 0}, {_i < 1000 && !_exit}, {_i = _i + 1}] do {
		if (_shape in ["SQUARE","RECTANGLE"]) then {
			_pos = _area call PO3_fnc_getPosFromRectangle
		}else{
			_pos = _area call PO3_fnc_getPosFromEllipse
		};

		if !(_water) then {
			if !(surfaceIsWater _pos) then { _exit = true };
		}else{
			_exit = true
		};

		if(count _blist > 0 && _exit) then {
			{
				if ([_pos,_x] call PO3_fnc_isBlacklisted) exitwith { _exit = false };
			}foreach _blist;
		};
	};
};

if (_road > 0) then {
	private ["_range","_roads","_cnt","_p","_p2"];
	_range = _road;
	_roads = _pos nearroads _range;
	_cnt = count _roads;
	_p = [];

	if (_cnt > 0) then {
		_p = getpos (_roads select 0);
		if (_cnt > 1) then {
			for "_i" from 1 to (_cnt - 1) do {
				_p2 = getpos (_roads select _i);
				if ((_p2 distance _pos) < (_p distance _pos)) then { _p = _p2 };
			};
		};
	};

	_pos = if (count _p > 0) then { _p }else{ [0,0,0] };
};

_pos