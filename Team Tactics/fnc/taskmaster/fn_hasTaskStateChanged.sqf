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
	if ((_this select 0) == (_x select 0)) then {
		if ((_this select 1) != (_x select 1)) exitwith {
			_b = true;
		};
	};
} foreach PO3_tasks_TasksLocal;

_b;