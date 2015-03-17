/*
	Author: Eightysix

	Description:
	Checks if unit is the driver, pilot or co-pilot of a vehicle

	Syntax:
	[<unit>,<vehicle>] call PO3_fnc_isDriver

	Returns: BOOLEAN
*/
private["_vehicle","_unit","_isDriver"];

_unit = _this select 0;
_vehicle = _this select 1;

_isDriver = switch (true) do {
	case (_vehicle isKindof "Helicopter") : {
		_unit == (driver _vehicle) || _unit == (_vehicle turretUnit [0])
	};
	default { _unit == driver _vehicle };
};

_isDriver