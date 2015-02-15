/*
	Author: Joris-Jan van 't Land
	Modified: Eightsix

	Description:
		Function to fill all crew positions in a vehicle, including turrets.

	Parameter(s):
		_this select 0: the vehicle (Object)
		_this select 1: the crew's group (Group)
		_this select 2: (optional) dummy mode toggle (Boolean)
		_this select 3: (optional) dummy mode type (String)
		_this select 4: (optional) crew type (String)

	Returns:
		Array of Objects or Scalars - newly created crew or crew count
*/
private ["_vehicle", "_grp","_crewType","_dummy","_dummyType","_type", "_entry", "_crew","_hasDriver","_crewType", "_unit"];

if ((count _this) < 2) exitWith { ["Spawn Crew","Function requires at least 2 parameters"] call PO3_fnc_log; [] };

_vehicle	= _this select 0;
_grp		= _this select 1;
_crewType	= if ((count _this) > 2) then { _this select 2 }else{ nil };
_entry		= configFile >> "CfgVehicles" >> (typeOf _vehicle);
_hasDriver	= getNumber (_entry >> "hasDriver");
_crew		= [];

if(isNil "_crewType") then {
	_crewType = getText (_entry >> "crew");
};

//Spawn a driver if needed
if ((_hasDriver == 1) && (isNull (driver _vehicle))) then {
	_unit = _grp createUnit [_crewType, position _vehicle, [], 0, "NONE"];
	_crew = _crew + [_unit];
	_unit moveInDriver _vehicle;
};

//Search through all turrets and spawn crew for these as well.
_turrets = [_entry >> "turrets"] call BIS_fnc_returnVehicleTurrets;

_funcSpawnTurrets = {
	private ["_turrets", "_path"];
	_turrets = _this select 0;
	_path = _this select 1;

	private ["_i"];
	_i = 0;
	while {_i < (count _turrets)} do {
		private ["_turretIndex", "_thisTurret"];
		_turretIndex = _turrets select _i;
		_thisTurret = _path + [_turretIndex];

		if (isNull (_vehicle turretUnit _thisTurret)) then {
			_unit = _grp createUnit [_crewType, position _vehicle, [], 0, "NONE"];
			_crew = _crew + [_unit];

			_unit moveInTurret [_vehicle, _thisTurret];
		};

		[_turrets select (_i + 1), _thisTurret] call _funcSpawnTurrets;

		_i = _i + 2;
	};
};

[_turrets, []] call _funcSpawnTurrets;
(_crew) spawn PO3_fnc_handleDamageAI;

_crew