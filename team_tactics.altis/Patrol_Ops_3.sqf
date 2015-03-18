// =========================================================================================================
// MPSF PO3 Edition - MultiPlayer Scripting Framework by EightySix
// Version Release 3.1.1
// PERMITTED FOR PUBLIC RELEASE WITHOUT MODIFICATION
// =========================================================================================================
["INIT",format["Executing Patrol_Ops_3.sqf"],true] call PO3_fnc_log;
enableSaving [false, false];
PO3_debug = false;
PO3_debug_log = false;

// =========================================================================================================
// !!  DO NOT MODIFY THIS FILE  !!
// =========================================================================================================
["INIT",format["Debug set: %1, Debug Log set: %2",PO3_debug,PO3_debug_log],true] call PO3_fnc_log;
if(PO3_debug) then {
	OnMapSingleClick "vehicle player SetPos [_pos select 0, _pos select 1, if( (vehicle player) isKindof ""AIR"" && isEngineOn (vehicle player) ) then { 100 }else{ 0 } ]";
	player allowDamage false;
};
#include "Patrol_Ops_3_Configuration.hpp"
[] call PO3_fnc_init;
[] call PO3_fnc_processParams;
[] call PO3_fnc_taskmaster;
[] call PO3_fnc_syncMPEnv;
[] spawn PO3_fnc_cleanup;
if(PO3SRV) then {
	PO3_SRV_HLC_grp_recieved = nil;
	{ switch (side _x) do { case west : { PO3_active_side_west = true }; case east : { PO3_active_side_east = true }; case resistance : { PO3_active_side_guer = true }; case civilian : { PO3_active_side_civ = true }; case sidelogic : { PO3_active_side_logic = true }; }; }forEach allunits;
	if(isNil "PO3_active_side_west") then { createCenter west };
	if(isNil "PO3_active_side_east") then { createCenter east };
	if(isNil "PO3_active_side_guer") then { createCenter resistance };
	if(isNil "PO3_active_side_civ")  then { createCenter civilian };
	if(isNil "PO3_active_side_logic") then { createCenter sideLogic };
	west setFriend [civilian, 1]; west setFriend [east, 0];// west setFriend [resistance, 0];
	east setFriend [civilian, 1]; east setFriend [west, 0];// east setFriend [resistance, 0];
//	resistance setFriend [civilian,0]; resistance setFriend [east,0]; resistance setFriend [west,0];
	civilian setFriend [east,1]; civilian setFriend [west,1];// civilian setFriend [resistance, 1];
	["Centers","All Centers Created and Friendships set"] call PO3_fnc_log;

	PO3_respawn_positions_global = PO3_CfgRespawn_PreDefinedPositions; publicVariable "PO3_respawn_positions_global";
	["Redeploy",format["Initilised with points: %1",PO3_CfgRespawn_PreDefinedPositions] ] call PO3_fnc_log;

	PO3_playerskilled = []; publicVariable "PO3_playerskilled";
	PO3_death_group = createGroup civilian; publicVariable "PO3_death_group";
	["DeathGroup",format["Created %1 for dead players to join",PO3_death_group] ] call PO3_fnc_log;

	PO3_logistics_referencepoint = PO3_reference_heliempty createVehicle [0, 0, 0]; publicVariable "PO3_logistics_referencepoint";
	[] spawn PO3_fnc_objectrespawn;
};
if(PO3CLI) then {
	[] call PO3_fnc_diary;
	PO3_respawn_rallypoint_active = false;
	[] spawn {
		waituntil {!isnull player};
		PO3_player_body = player;
//		player call PO3_fnc_setHealEH;
//		player call PO3_fnc_setDamageEH;
		player call PO3_fnc_setKilledEH;
		player call PO3_fnc_setRespawnEH;
	};
	[] spawn { /* Handle TK */
		private["_score"];
		while {true} do {
			waitUntil { alive player && rating player < 0 };
			if( rating player < 0 ) then {
				_score = (-1*(rating player));
				player addrating _score;
				_score = rating player;
			};
		};
	};
};
// Headless Client Script
[] spawn PO3_fnc_hlc_sendKeepAlive;

PO3_core_init = true;
["Init",format["Completed Initilise of %1",missionName],true] call PO3_fnc_log;

sleep 1;

//if (PO3_mod_acre_enabled) then { [] execVM "scripts\Radios\PO3_setupACRE.sqf"; };
//if (PO3_mod_tfr_enabled) then { [] execVM "scripts\Radios\PO3_setupTFR.sqf"; };

[PO3_param_missionhour,0] spawn PO3_fnc_setTime;

if(PO3SRV) then {
	[] spawn PO3_fnc_registerLocations;
	PO3_worldsize = call PO3_fnc_worldsize;
	if(PO3_param_ambientpatrolair) then { [] spawn PO3_fnc_ambientAirPatrols; };
	if(PO3_param_ambientpatrolgnd) then { [] spawn PO3_fnc_ambientGroundPatrols; };
//	if(PO3_param_ambientIEDs) then { [] call PO3_fnc_ambientIEDs; };
//	if(PO3_param_ambient_civs_enable) then { [300,8,6] spawn PO3_fnc_ambientCivs; };
//	if(PO3_param_ambient_civtraffic_enable) then { [800,15,9] spawn PO3_fnc_ambientTraffic; };
};
if(PO3CLI) then {
	(findDisplay 46) displayAddEventHandler ["KeyDown","_this call PO3_fnc_keypress"];
	[] spawn PO3_fnc_camera_Restrict3rdPerson;
	[] spawn PO3_fnc_display_init;
	[] spawn PO3_fnc_grpmark_draw;
	[] spawn PO3_fnc_interaction_else;
	[] spawn PO3_fnc_interaction_self;
	player enableFatigue PO3_param_player_fatigue;
	if(PO3_param_respawn_halo_allow) then { ["halo"] call PO3_fnc_addRespawnPosLocal; };

	_preAssignedRole = player setVariable ["PO3_VAR_roleAttribute",nil];
	if(isNil "_preAssignedRole") then {
		switch (true) do {
			case ( getText(configFile >> "CfgWeapons" >> primaryWeapon(player) >> "UIPicture" ) == "\a3\weapons_f\data\ui\icon_mg_ca.paa") : { player setVariable ["PO3_VAR_roleAttribute","MachineGunner",true] };
			case ( getText(configFile >> "CfgWeapons" >> secondaryWeapon(player) >> "UIPicture" ) == "\a3\weapons_f\data\ui\icon_at_ca.paa") : { player setVariable ["PO3_VAR_roleAttribute","MissileSpecialist",true] };
			case ( (typeOf player) IN ["B_soldier_repair_F","O_soldier_repair_F","I_soldier_repair_F"] ) : {
				player setVariable ["PO3_VAR_roleAttribute","Support",true];
				[player] call PO3_fnc_setAsCrewman; // Automatically Assign Drivers License
				[player] call PO3_fnc_setAsPilot; // Automatically Assign Pilots License
			};
			default { player setVariable ["PO3_VAR_roleAttribute","Rifleman",true] };
		};
	};
	//[player] spawn PO3_fnc_vehicleRestrict;

	/*if([group player,player] call PO3_fnc_isTeamLeader && isNull ((group player) getVariable ["PO3_var_groupLeader",objNull])) then {
		[player,group player,false] call PO3_fnc_assignGroupLeader;
	}else{
		_leader = (group player) getVariable ["PO3_var_groupLeader",objNull];
		if !(isNull _leader) then {
			if(_leader != leader group player) then {
				[_leader,group player,false] call PO3_fnc_assignGroupLeader;
			};
		};
	};*/
};
[] spawn PO3_fnc_protector;
