private["_lifter","_object","_count"];

_lifter = _this select 0;
_object = _this select 1;

_count = count PO3_logistics_liftCables;
PO3_logistics_liftCables set [_count,[_lifter,_object]]; PublicVariable "PO3_logistics_liftCables";

waitUntil {
	!([_lifter,_object] call PO3_fnc_isLifted)
};

PO3_logistics_liftCables set [_count,[]]; PublicVariable "PO3_logistics_liftCables";