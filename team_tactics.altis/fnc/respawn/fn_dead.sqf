/*
	Author: Eightysix

	Description:

*/
if !(PO3CLI) exitWith {};

if !(getPlayerUID player IN PO3_playerskilled) then {
	PO3_playerskilled = [ count PO3_playerskilled, getPlayerUID player ];
	publicVariable "PO3_playerskilled";
};

KEGs_can_exit_spectator = false;

waitUntil {alive player};

switch (playerside) do {
	case east : { player setPosATL ("respawn_east" call PO3_fnc_getPos) };
	case west : { player setPosATL ("respawn_west" call PO3_fnc_getPos) };
	case resistance : { player setPosATL ("respawn_guerrila" call PO3_fnc_getPos) };
	case civilian : { player setPosATL ("respawn_civilian" call PO3_fnc_getPos) };
};

[player] joinSilent PO3_death_group;
setplayerRespawnTime 0;
removeAllItems player;
removeAllWeapons player;
removeBackpack player;

[player,player,player] spawn PO3_spectate_start;