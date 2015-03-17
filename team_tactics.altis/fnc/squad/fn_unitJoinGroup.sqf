private["_units","_group"];

_units = switch (typeName (_this select 0) ) do {
	case "ARRAY" : { _this select 0 };
	case "GROUP" : { units (_this select 0) };
	case "OBJECT" : { [_this select 0] };
	default { nil };
};
_group = _this select 1;

if(isNil "_units" || typename _group != "GROUP") exitWith {};
if ( !([_group,player] call PO3_fnc_isTeamLeader) && !([player] call PO3_fnc_isAdministrator) ) exitWith { [true,"HTINTC","You are not authorised to change the group"] call PO3_fnc_hint };

_oldGroup = group (_units select 0);

{
	_x enableAI "MOVE";
	_x enableAI "ANIM";
}forEach _units;

_units joinSilent _group;

[ _units, "GROUP", format[localize "STR_PO3_DIALOG_JOINEDGROUP", str _group, name(leader _group)] ] call PO3_fnc_sendChat;

if( count (units _oldGroup) == 0 ) then { deleteGroup _oldGroup };

true