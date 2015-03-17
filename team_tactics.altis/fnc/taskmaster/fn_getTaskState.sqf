/*
	Author: Shuko
	Modified: Eightysix

	Description:


	Syntax:


	Example:


*/

private "_s";

{
	if (_this == (_x select 0)) exitwith {
		_s = (_x select 5);
	};
} foreach PO3_tasks_Tasks;

_s;