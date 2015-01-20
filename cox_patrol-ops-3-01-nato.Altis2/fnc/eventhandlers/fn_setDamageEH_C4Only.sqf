/*
	Author: Eightysix

	Description:
	Returns Marker Type of the type vehicle the unit or group is operating.

	Syntax:
	_Type = (unit/group/vehicle) call PO3_fnc_getObjectMarkerType;

	demoCharge_remote_ammo
	satchelCharge_remote_ammo

	Example:
	_Type = (player) call PO3_fnc_getObjectMarkerType;
	_Type = (vehicle player) call PO3_fnc_getObjectMarkerType;
*/
private["_objects"];

_objects = _this;
if(typeName _objects != typeName []) then { _objects = [_objects] };

{
	_x addEventHandler ["HandleDamage", {
		switch (true) do {
			case ( (_this select 4) isKindof "PipeBombBase") : { 1 };
			case ( (_this select 4) == "demoCharge_remote_ammo") : { 1 };
			case ( (_this select 4) == "satchelCharge_remote_ammo") : { 1 };
			default { 0 }
		};
	}];
} foreach _objects;
