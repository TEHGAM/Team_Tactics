private["_towVeh","_object","_count"];

_towVeh = _this select 0;
_object = _this select 1;

_count = count PO3_logistics_liftCables;
PO3_logistics_liftCables set [_count,[_towVeh,_object]]; PublicVariable "PO3_logistics_liftCables";

waitUntil {
	!([_towVeh,_object] call PO3_fnc_isTowed)
};

PO3_logistics_liftCables set [_count,[]]; PublicVariable "PO3_logistics_liftCables";