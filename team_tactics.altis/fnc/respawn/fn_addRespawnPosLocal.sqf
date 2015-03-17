/*
	Author: Eightysix

	Description:

*/
_varName = "PO3_respawn_positions_";

switch (toLower (_this select 0)) do {
	case "rally" : { missionnamespace setvariable [_varName + "rallypoints",[ [playerside, (_this select 1), "mil_flag", format[localize "STF_PO3_RESPWN_RALLYNAME",name player] ] ] ]; };
	case "halo"  : { missionnamespace setvariable [_varName + "halo",[ [playerside, "halo", "mil_flag", localize "STF_PO3_RESPWN_HALO"] ] ]; };
	default {};
};