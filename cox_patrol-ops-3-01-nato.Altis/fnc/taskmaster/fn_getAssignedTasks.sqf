/*
	Author: Shuko
	Modified: Eightysix

	Description:


	Syntax:


	Example:


*/

private "_l";

_l = [];

{
	if ((_x select 5) == "assigned") then {
		_l set [count _l,(_x select 0)];
	};
} foreach PO3_tasks_Tasks;

_l;