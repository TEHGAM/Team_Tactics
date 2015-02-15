private["_side","_group"];

if !([player] call PO3_fnc_isAdministrator) exitWith { [true,"HTINTC","You are not authorised to create a new group"] call PO3_fnc_hint };

_side = switch (typeName (_this select 0) ) do {
	case (typeName west) : { _this select 0 };
	case (typeName grpNull);
	case (typeName objNull) : { side (_this select 0) };
	default { nil };
};

_group = createGroup _side;

_group;