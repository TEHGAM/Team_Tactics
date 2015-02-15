/*
	Author: Eightysix

	Description:
	Do Not Call Directly
*/
private["_position","_radius","_j","_nearRoads","_road"];

_position = (_this select 0) call PO3_fnc_getPos;
_radius = 50;
_nearRoads = [];

While { count _nearRoads == 0 } do {
	_nearRoads = _position nearRoads _radius;
	_radius = _radius + 50;
};

_j = (count _nearRoads - 1) min (round random (count _nearRoads));
_road = _nearRoads select _j;

_road