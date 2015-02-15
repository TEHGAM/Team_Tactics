private["_unit","_qual","_curr","_return"];

_unit = _this select 0;
_qual = _this select 1;
_curr = _unit getVariable ["PO3_VAR_roleAttribute","Rifleman"];

_return = switch (toLower _qual) do {
	case "fly";
	case "pilot" : {_unit getVariable ["PO3_VAR_PilotLicense",false]};
	case "crew";
	case "driver";
	case "crewman" : {_unit getVariable ["PO3_VAR_DriverLicense",false]};
	case "healer";
	case "medic" : { if( _curr == "Medic") then { true }else{ false }; };
	default { if( toLower(_qual) == tolower(_curr) ) then { true }else{ false }; };
};

_return;