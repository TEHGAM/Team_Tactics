/*
	Author: Eightysix

	Description:


	Syntax:

*/
if(isNil "PO3_death_group") then { PO3_death_group = grpNull };
if(isNil "PO3_param_respawn_playertime") then { PO3_param_respawn_playertime = 10 };

if( (getPlayerUID player) IN PO3_playerskilled ) exitWith { player call PO3_fnc_dead };

setplayerRespawnTime PO3_param_respawn_playertime;

player addEventHandler ["Killed",{
	KEGs_can_exit_spectator = false;
	if(PO3_param_respawn_deathcount == 0) then {
		player spawn PO3_fnc_dead;
	}else{
		PO3_param_respawn_deathcount = round(PO3_param_respawn_deathcount - 1);
		[_this select 0, _this select 1] spawn PO3_fnc_onkilled;
	};

	[] spawn {
		WaitUntil{ alive player };
		setplayerRespawnTime PO3_param_respawn_playertime;
	};
}];