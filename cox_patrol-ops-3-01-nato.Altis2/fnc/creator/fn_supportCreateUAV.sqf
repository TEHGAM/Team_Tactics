private ["_UAVOp","_uavClass","_uavTerminal","_position","_uav","_hasUavTerminal"];

_UAVOp = _this select 0;
_uavClass    = (PO3_CfgSupport_UASVehicles select 1) select ([WEST, EAST, RESISTANCE] find (side _UAVOp));
_uavTerminal = (PO3_CfgSupport_UASVehicles select 0) select ([WEST, EAST, RESISTANCE] find (side _UAVOp));
_position = [_UAVOp,3000,180] call PO3_fnc_getPos;
_position set [2,500];

_uav = createVehicle [_uavClass, _position, [], 0, "FLY"];
createVehicleCrew _uav;
_uav setPos _position;
_uav setVelocity [0,100,10];

group(driver _uav) addWaypoint [_position,0];
PO3_support_ActiveUAV = _uav; publicVariable "PO3_support_ActiveUAV";

_hasUavTerminal = _uavTerminal in assignedItems _UAVOp;
if !(_hasUavTerminal) then {
	_UAVOp addWeapon _uavTerminal;
};

if !(isNull _uav) then {
	_UAVOp connectTerminalToUav _uav;
};
