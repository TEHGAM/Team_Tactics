/*
	Author: Shuko
	Modified: Eightysix

	Description:
	Creates a task and broadcasts to all clients

	Syntax:
		TaskName      string     Name used to refer to the task
		Title         string     Task name shown in the in/game task list
		Description   string     Task description, the actual text body

	Optional:
		Condition	boolean/side/faction/unit/group/string   Units the task is added to. Default is everyone
		Marker		array     Marker related to the task. It will be created only for the units who have the task. Marker will be hidden after task is completed. Can be an array of marker arrays, if you want to create multiple markers.
			Name		string    Name of the marker to create.
			Position	string    Position of the marker.
			Type		string    Marker type. Optional, default is "selector_selectedMission".
			Color		string    Marker color. Optional, default is red.
			Text		string    Marker text.
		State		string    Task state of the newly created task. Default is "created".
		Destination	object/position/marker   Place to create task destination (game's built-in waypoint/marker). If an object is given, setSimpleTaskTarget command is used, attaching the destination to it.


	Example:
		["Task1","Task1Title","Task1Desc"] call PO3_fnc_addTask
		["Task2","Task2Title","Task2Desc",true,["markerTask2",getpos obj2]] call PO3_fnc_addTask
*/
if (!PO3SRV) exitWith{};
private ["_name","_short","_long","_cond","_marker","_state","_dest","_chev"];

_name = _this select 0;
_short = _this select 1;
_long = _this select 2;

if (count _this > 3) then { _cond = _this select 3 } else { _cond = true };
if (count _this > 4) then { _marker = _this select 4 } else { _marker = [] };
if (count _this > 5) then { _state = _this select 5 } else { _state = "created" };
if (count _this > 6) then { _dest = _this select 6 } else { _dest = 0 };
if (count _this > 7) then { _chev = _this select 7 } else { _chev = "" };

PO3_tasks_Tasks set [count PO3_tasks_Tasks, [_name,_short,_long,_cond,_marker,_state,_dest,_chev]];
publicvariable "PO3_tasks_Tasks";

["Taskmaster",format["Added task: %1",[_name,_short,_long,_cond,_marker,_state,_dest,_chev]]] call PO3_fnc_log;

if (PO3CLI && PO3_tasks_initDone) then {
	PO3_tasks_Tasks spawn PO3_fnc_handleTaskEvent;
};
