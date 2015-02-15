/*
	Author: Eightysix

	Description:
	Creates a Group of Units

	Syntax:
	[<position>,<side>,<type>,<radius>,<stance>,<strength>] spawn PO3_fnc_createGroup

		position - ARRAY/OBJECT/STRING - the same requirements supplied to PO3_fnc_getPos
		side	 - SIDE - the side the units will be created for (west/east/resistance)
		type	 - ARRAY/STRING - An array of unit types or a string referencing a PreConfigured unit array
		radius	 - Number - (OPTIONAL) The maximum radius from the position they will be spawned at.
		stance	 - STRING - (OPTIONAL) The stance of the group (Aware/Combat/Safe)
		strength - NUMBER - (OPTIONAL) The maximum units in that squad ( default is the count of the array of types)

	Returns: Group ID of units
*/
if(!PO3SRV) exitWith {};

/* COMMAND REDUNDANT
_hc = call PO3_fnc_getHLCID;

if( typeName _hc == "ARRAY" ) then {
	PO3_HLC_pubVar_spawn_inf = [_hc,_this,random 999];
	(_hc select 0) publicVariableClient "PO3_HLC_pubVar_spawn_inf";

	["Infantry ObjectSpawner",format["Server Detected HLC, Sending %1 to HLC for creation",_this] ] call PO3_fnc_log;

	waitUntil { !isNil "PO3_SRV_HLC_grp_recieved" };

	_return = PO3_SRV_HLC_grp_recieved;
	PO3_SRV_HLC_grp_recieved = nil;

	["Infantry ObjectSpawner",format["Server Detected HLC has created %1",_return] ] call PO3_fnc_log;

	_return;
}else{*/
	// MOVED OUT OF IF STATEMENT TO BELOW
/*};*/

_return = _this call PO3_fnc_squadSpawner;
_return;
