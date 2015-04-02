//["INIT",format["Executing %1 init.sqf",missionName],true] call PO3_fnc_log;

[] execVM "Patrol_Ops_3.sqf";
if(!isDedicated) then {
	Receiving_finish = false;
	onPreloadFinished { Receiving_finish = true; onPreloadFinished {}; };
	WaitUntil{ !(isNull player) && !isNil "PO3_core_init" && Receiving_finish };
}else{
	WaitUntil{!isNil "PO3_core_init"};
};

if(!isDedicated && !PO3_debug) then {
	
	[] execVM "scripts\IgiLoad\IgiLoadInit.sqf";
	[] execVM "scripts\tags.sqf";
	[] execVM "scripts\kickass.sqf";
	[] execVM "scripts\rearm_unit.sqf";
	createDialog "HELLO_WIN";
};

["PO3_taskmaster"] call PO3_fnc_runTaskSequence;

[] call PO3_fnc_outrosequence;
