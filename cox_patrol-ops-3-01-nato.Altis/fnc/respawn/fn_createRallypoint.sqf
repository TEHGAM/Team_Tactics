/*
	Author: Eightysix

	Description:

*/
if(!PO3CLI) exitWith {};

if( player call PO3_fnc_checkActionBusy ) exitWith {};

private["_pos","_dir","_position","_type","_rallypoint"];

[localize "STR_PO3_RESPWN_RALLYPLACE"] call PO3_fnc_hint;
true call PO3_fnc_setActionBusy;

player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 8;
if!(alive player) exitwith {};

_pos = player call PO3_fnc_getPos;
_dir = direction player;
_position = [  (_pos select 0) + (sin _dir * 2), (_pos select 1) + (cos _dir * 2), 0];

_type = if(PO3_a3) then { if(playerside == west) then { "Land_TentDome_F"}else{ "Land_TentA_F" } }else{ "ACamp" };
_rallypoint = createVehicle [_type, _position, [], 0, "CAN_COLLIDE"];
_rallypoint setDir (_dir - 90);
_rallypoint setVariable ["PO3_rallypoint",true,true];
_rallypoint setVariable ["PO3_rallypoint_owner",name player,true];
missionNamespace setVariable ["PO3_rallypoint_deployed",_rallypoint];

player reveal _rallypoint;

[ "rally", _position ] call PO3_fnc_addRespawnPosLocal;
false call PO3_fnc_setActionBusy;

[true,"HINT","<t color='#ffc600'>Placed Rallypoint</t><br/><br/>You can recover this in the field or at the base flag"] call PO3_fnc_hint;

PO3_respawn_rallypoint_active = true;
waitUntil { sleep 1; !(_rallypoint getVariable ["PO3_rallypoint",false]) || !(alive _rallypoint) };
PO3_respawn_rallypoint_active = false;

missionNamespace setVariable ["PO3_rallypoint_deployed",objNull];
deleteVehicle _rallypoint;
[ "rally" ] call PO3_fnc_removeRespawnPosLocal;

[localize "STR_PO3_RESPWN_RALLYREMVE"] call PO3_fnc_hint;
