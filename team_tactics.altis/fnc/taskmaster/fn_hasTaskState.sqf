/*
	Author: Shuko
	Modified: Eightysix

	Description:
		Returns if the task has the required state

	Syntax:
		- Uniques Task ID
		- Task State to check

	Example:
		_lose = ["TASK1","failed"] call PO3_fnc_hasTaskState;
		_win = ["TASK1","succeeded"] call PO3_fnc_hasTaskState;
*/

private "_b";

_b = false;

{
	if ((_this select 0) == (_x select 0)) then {
		if (((_this select 0) call PO3_fnc_getTaskState) == (_this select 1)) then {
			_b = true;
		};
	};
} foreach PO3_tasks_Tasks;

_b;