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
	if (_this == (_x select 0)) then {
		if ((_x select 5) in ["succeeded","failed","canceled"]) then {
			_b = true;
		};
	};
} foreach PO3_tasks_Tasks;

_b;