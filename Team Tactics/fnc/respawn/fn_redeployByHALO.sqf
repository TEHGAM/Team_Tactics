/*
    Author: Eightysix

    Description:

*/
private["_position","_unit"];

if(!PO3_param_respawn_halo_allow) exitWith { [localize "STR_PO3_RESPWN_CNTDEPLY6"] call PO3_fnc_hintc };
if( PO3_respawn_halo_nextAvailable > (PO3_param_respawn_halo_time + time) ) exitWith {
    [ format[localize "STR_PO3_RESPWN_CNTDEPLY7", ceil PO3_respawn_halo_nextAvailable] ] call PO3_fnc_hintc;
};

_unit = player;
_position = _this select 1;

[_unit,_position,2000] spawn PO3_fnc_halo;

PO3_player_respawned_byHALO = true;
PO3_player_respawned = true;
true call PO3_fnc_setActionBusy;

// FREEFALL or Die
waitUntil {animationState _unit == "HaloFreeFall_non" || (getPos _unit select 2) < 1};
PO3_respawn_halo_nextAvailable = time + PO3_param_respawn_halo_time;

// PARACHUTE or Die
waitUntil {animationState _unit == "para_pilot" || (getPos _unit select 2) < 1};

// LANDED or Die
waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1};
false call PO3_fnc_setActionBusy;
