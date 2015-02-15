private ["_ugvOp","_ugvClass","_ugvTerminal","_position","_ugv","_hasUavTerminal"];

_ugvOp = _this select 0;
_ugvClass    = (PO3_CfgSupport_UASVehicles select 2) select ([WEST, EAST, RESISTANCE] find (side _ugvOp));
_ugvTerminal = (PO3_CfgSupport_UASVehicles select 0) select ([WEST, EAST, RESISTANCE] find (side _ugvOp));
_position = [_ugvOp,200,random 360] call PO3_fnc_getPos;
_position set [2,400];

_ugv = createVehicle [_ugvClass, _position, [], 0, "NONE"];
_ugv setPos _position;
_ugv setVelocity [0,0,-1];

[_position,_ugv,_ugvOp] call PO3_fnc_supportCreateChute;

_hasUavTerminal = _ugvTerminal in assignedItems _ugvOp;
if !(_hasUavTerminal) then {
	_ugvOp addWeapon _ugvTerminal;
};

waitUntil { /*isTouchingGround _ugv ||*/((_ugv call PO3_fnc_getPos) select 2) < 2};

createVehicleCrew _ugv;
group(driver _ugv) addWaypoint [position _ugvOp,0];

if !(isNull _ugv) then {
	_ugvOp connectTerminalToUav _ugv;
};