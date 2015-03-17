/*
	Author: Shuko
	Modified: Eightysix

	Description:
		Initilises the mission taskmaster

	Syntax:
		- Preconfigured Tasks

	Example:
		[] call PO3_fnc_taskmaster;

*/

PO3_tasks_initDone = false;
PO3_tasks_showHints = false;

if(PO3SRV) then {
	PO3_tasks_Tasks = [];
	if (!isnil "PO3_CfgTasks_PreDefinedTasks") then {
		if (count PO3_CfgTasks_PreDefinedTasks > 0) then {
			{ _x call PO3_fnc_addTask }forEach PO3_CfgTasks_PreDefinedTasks;
		};
	};
	publicvariable "PO3_tasks_Tasks";
	["Taskmaster",format["Initilised with tasks: %1",PO3_tasks_Tasks]] call PO3_fnc_log;
};

if(PO3CLI) then {
	PO3_tasks_TasksLocal = [];
	waituntil {!isnil "PO3_tasks_Tasks"};

	private "_sh";
	_sh = PO3_tasks_Tasks spawn PO3_fnc_handleTaskEvent;
	waituntil {scriptdone _sh};

	PO3_tasks_showHints = true;
	PO3_tasks_initDone = true;

	"PO3_tasks_Tasks" addPublicVariableEventHandler { (_this select 1) spawn PO3_fnc_handleTaskEvent; };
};