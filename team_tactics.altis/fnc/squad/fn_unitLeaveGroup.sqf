private["_unit","_side","_newGroup"];

_unit = _this select 0;

_side = side _unit;

_newGroup = [_side] call PO3_fnc_createNewGroup;
[_unit,_newGroup] call PO3_fnc_unitJoinGroup;

true;