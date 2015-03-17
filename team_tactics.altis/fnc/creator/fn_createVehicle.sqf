/*
	Author: Eightysix

	Description:
	Creates a Vehicle and if required, the crew and cargo as well

	Syntax:
	[<position>,<type>,<direction>,<radius>,<side>,<cargo>,<state>] spawn PO3_fnc_createVehicle

		position - ARRAY/OBJECT/STRING - the same requirements supplied to PO3_fnc_getPos
		type	 - STRING - The vehicle class name to be created
		direction- NUMBER - (OPTIONAL) The direction the vehicle is to face
		radius	 - Number - (OPTIONAL) The radius from the position they vehicle will be spawned at.
		side	 - SIDE	  - (OPTIONAL) the side the crew will be created for (west/east/resistance). If none, no crew will be created
		cargo	 - ARRAY/STRING - (OPTIONAL) This is the same as PO3_fnc_createGroup but the units are placed inside the empty cargo spaces
		state	 - STRING - (OPTIONAL) Default NONE, FLY will create any air class in the air.

	Returns:
		if no crew: vehicle
		if crew: [groupID,vehicle]

	Examples:
		_position = [ [X,Y,Z], [0,300], [0,90], false ] call PO3_fnc_getPos; // Return a position up to 300m distance somewhere to the NE of XYZ
		// Use position as the spawn point
		[ _position, "O_MRAP_02_F" ] call PO3_fnc_createVehicle; // Create Empty MRAP
		[ _position, "O_MRAP_02_F", random 360, 10, east ] call PO3_fnc_createVehicle; // Create Active MRAP in 10m radius
		[ _position, "O_MRAP_02_F", random 360, 10, east, "EnemyPredefinedConfigGroup_1" ] call PO3_fnc_createVehicle; // Create Active Full MRAP in 10m radius
		[ _position, "O_Heli_Attack_02_F", random 360, 1000, east, [], "FLY"] call PO3_fnc_createVehicle; // Create Active Flying Helicopter in 1000m radius
*/
if(!PO3SRV) exitWith {};

/* COMMAND REDUNDANT
_hc = call PO3_fnc_getHLCID;
if( typeName _hc == "ARRAY" ) then {
	PO3_HLC_pubVar_spawn_veh = [_hc,_this,random 999];
	(_hc select 0) publicVariableClient "PO3_HLC_pubVar_spawn_veh";

	["Vehicle ObjectSpawner",format["Server Detected HLC, Sending %1 to HLC for creation",_this] ] call PO3_fnc_log;

	waitUntil { !isNil "PO3_SRV_HLC_grp_recieved" };

	_return = PO3_SRV_HLC_grp_recieved;
	PO3_SRV_HLC_grp_recieved = nil;

	["Vehicle ObjectSpawner",format["Server Detected HLC has created %1",_return] ] call PO3_fnc_log;

	_return;
}else{*/
	// MOVED OUT OF IF STATEMENT TO BELOW
/*};*/

_return = _this call PO3_fnc_vehicleSpawner;
_return;
