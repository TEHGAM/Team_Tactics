/*
	Author: Shuko
	Modified: Eightysix

	Description:


	Syntax:


	Example:


*/

private "_b";

_b = false;

{
	if (_this == (_x select 0)) exitwith { _b = true };
} foreach PO3_tasks_TasksLocal;

_b;