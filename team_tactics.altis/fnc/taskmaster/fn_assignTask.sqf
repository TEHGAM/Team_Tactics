/*
	Author: Shuko
	Modified: Eightysix

	Description:


	Syntax:


	Example:


*/

if (!isserver) ExitWith {};

private "_task";

for "_i" from 0 to (count PO3_tasks_Tasks - 1) do {
	if (_this == ((PO3_tasks_Tasks select _i) select 0)) then {
		_task =+ PO3_tasks_Tasks select _i;
		_task set [5,"assigned"];
		PO3_tasks_Tasks set [_i,_task];
	};
};

publicvariable "PO3_tasks_Tasks";

if (!isdedicated && PO3_tasks_initDone) then {
	PO3_tasks_Tasks spawn PO3_fnc_handleTaskEvent;
};