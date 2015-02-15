["INIT",format["Executing %1 init.sqf",missionName],true] call PO3_fnc_log;

[] execVM "Patrol_Ops_3.sqf";
[] execVM "tags.sqf";


if(!isDedicated) then {
	Receiving_finish = false;
	onPreloadFinished { Receiving_finish = true; onPreloadFinished {}; };
	WaitUntil{ !(isNull player) && !isNil "PO3_core_init" && Receiving_finish };
}else{
	WaitUntil{!isNil "PO3_core_init"};
};

if(!isDedicated && !PO3_debug) then {
	/*playMusic "LeadTrack01a_F";
	0 fadeMusic 1;
	[5,""] spawn PO3_fnc_camera_fadein;
	if!(PO3_debug) then { [270,900,150] call PO3_fnc_introsequence };
	[] spawn { sleep 20; 8 fadeMusic 0; };*/

//External Injury system (Future Mod Support)
	//TCB_AIS_PATH = "scripts\ais_injury\";
	//{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits});		// execute for every playable unit
//External Logistics (Future Mod Support)
	[] execVM "scripts\IgiLoad\IgiLoadInit.sqf";
};

["PO3_taskmaster"] call PO3_fnc_runTaskSequence;

[] call PO3_fnc_outrosequence;
