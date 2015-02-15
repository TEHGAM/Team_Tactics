/*
	Author: Eightysix

	{COMPRESSED}

	Description:
*/
private["_position","_radius","_area","_gradient","_pos"];

_position = (_this select 0) call PO3_fnc_getPos;

_radius = if(count _this > 1) then { _this select 1 }else{ 2.0 };
_area = if(count _this > 2) then { _this select 2 }else{ 5.0 };
_clearance = if(count _this > 3) then { _this select 3 }else{ 20  };
_gradient = if(count _this > 4) then { _this select 4 }else{ 0.1 };

for "_i" from 1 to 10000 do {
	_pos = [(_position select 0) + _radius - random (2*_radius),(_position select 1) + _radius - random (2*_radius),0];
	_pos = _pos isflatempty [_clearance,1,_gradient,_area,0,false,ObjNull];

	if(count _pos == 0) then { _pos = _position };
	if(count _pos > 0) then{ _pos set [2,0]; };
	if( if(count (_pos nearRoads 20) == 0) then{ true } else{ false } ) exitWith{};
};

if(count _pos == 0) then{
	_pos = [(_position select 0) + _radius - random (2*_radius),(_position select 1) + _radius - random (2*_radius),0];
};

_pos