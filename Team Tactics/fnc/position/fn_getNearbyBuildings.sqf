private ["_position","_radius","_nearByObjects"];

_position = _this select 0;
_radius = _this select 1;

_nearByObjects = nearestObjects  [_position,["House","Ruins","Church","FuelStation"],_radius];

_nearByObjects