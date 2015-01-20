private ["_unit","_assignedTeam","_colour"];

_unit = _this;
_assignedTeam = _unit getVariable ["ST_STHud_assignedTeam", "MAIN"];
_colour = switch (_assignedTeam) do {
	case "MAIN":	{ [1.00,1.00,1.00,1] };
        case "RED":	{ [1.00,0.66,0.66,1] };
        case "BLUE":	{ [0.66,0.66,1.00,1] };
        case "GREEN":	{ [0.66,1.00,0.66,1] };
        case "YELLOW":	{ [1.00,1.00,0.66,1] };
	default		{ [0.67,0.74,0.51,1] };
};

_colour;



