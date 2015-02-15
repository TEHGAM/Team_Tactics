/*
	Author: Eightysix

	Description:
	Returns String of the group name.

	Syntax:
	_colour = (unit/group) call PO3_fnc_getGroupName;

	Example:
	_colour = (player) call PO3_fnc_getGroupName;
	_colour = (group player) call PO3_fnc_getGroupName;
*/
private["_unit","_text","_preconfig"];

_group = switch (typename _this) do {
	case "GROUP" : { _this  };
	case "OBJECT" : { group _this };
	default { grpNull };
};

_text = groupID(_group);

_text