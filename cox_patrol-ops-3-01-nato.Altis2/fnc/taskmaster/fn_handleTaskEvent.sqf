/*
	Author: Shuko
	Modified: Eightysix

	Description:


	Syntax:


	Example:


*/

waituntil {alive player};

private "_name";

{
	_name = _x select 0;
	if (_name call PO3_fnc_hasLocalTask) then {
		if ([_name,(_x select 5)] call PO3_fnc_hasTaskStateChanged) then {
			_x call PO3_fnc_updateLocalTask;
		};
	} else {
		_x call PO3_fnc_addLocalTask;
	};
} foreach _this;