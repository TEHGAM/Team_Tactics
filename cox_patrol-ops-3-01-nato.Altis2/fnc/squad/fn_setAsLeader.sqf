private["_unit","_group"];

_unit = switch (typeName (_this) ) do {
	case (typeName []) : { _this select 0 };
	case (typeName grpNull) : { (units _this) select 0 };
	case (typeName objNull) : { _this };
	default { nil };
};
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;
_display = [_this,2,true,[true]] call BIS_fnc_param;

if(isNil "_unit" || typename _group != typeName grpNull ) exitWith { [true,"HINT","ERROR IN assignGroupLeader"] call PO3_fnc_hint };

if !(_unit IN (units _group)) then {
	[_unit,_group] call PO3_fnc_unitJoinGroup;
	sleep 0.1;
};

if(player == _unit) then {
	_group setVariable ["PO3_var_groupLeader",_unit,true];
};

{ if(_x == _unit) then { _x setUnitRank "SERGEANT" }else{ _x setUnitRank "PRIVATE" }; }forEach (units _group);
_group selectLeader _unit;

if(_display) then {
	[ _unit, "GROUP", format[localize "STR_PO3_DIALOG_ASSIGNLEADERGROUP", str _group] ] call PO3_fnc_sendChat;
	[side _group, "SIDE", format[localize "STR_PO3_DIALOG_NEWGROUPLEADER", name (leader _group),str _group] ] call PO3_fnc_sendChat;
};

true
