/*
	Author: Eightysix

	Description:
	Creates a chute and attaches the payload for decent

	Syntax:
	[<aircraft>,<object>] call PO3_fnc_createChute

	Returns: Nothing
*/
private["_position","_payload","_chuteType"];

_vehicle = _this select 0;
_payload = _this select 1;

_position = (_this select 0) call PO3_fnc_getPos;
_position set [2, (_position select 2) - 40];
if((_position select 2) < 50 ) exitWith { [true,"HINT",format[localize "STR_PO3_LOGIST_SUPPLYDROPFAIL0",[_payload] call PO3_fnc_getCfgText] ] call PO3_fnc_hint; false };

if!(local _vehicle) then {
	_local = [_vehicle, player] call PO3_fnc_requestOwnership;
	if(!_local) then { ["Unable to assign locality to you"] call PO3_fnc_hint };
};

[_vehicle,_position,_payload] spawn {
	private["_position","_payload","_chuteType","_pilot"];

	_pilot = driver (_this select 0);
	_position = _this select 1;
	_payload = _this select 2;

	_chuteType = ['B_Parachute_02_F', 'O_Parachute_02_F', 'I_Parachute_02_F'] select ([WEST, EAST, RESISTANCE] find side _pilot);

	_chute = createVehicle [_chuteType, _position, [], 0, 'FLY'];
	_chute setPos [position _pilot select 0, position _pilot select 1, (position _pilot select 2) - 50];
	_payload attachTo [_chute, [0, 0, -1.3]];

	sleep 1;
	waitUntil{ ( (position _payload) select 2) < 0.5 || isNull _chute || isTouchingGround _payload };

	detach _payload;
};

[side (driver _vehicle),"SIDE",format [localize "STR_PO3_LOGIST_SUPPLYDROP0",name (driver _vehicle),[_payload] call PO3_fnc_getCfgText,mapGridPosition _position] ] call PO3_fnc_sendChat;

true;
