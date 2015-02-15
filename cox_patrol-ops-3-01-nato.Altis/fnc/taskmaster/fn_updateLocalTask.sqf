/*
	Author: Shuko
	Modified: Eightysix

	Description:
		DO NOT CALL DIRECTLY
*/

private ["_task","_name","_state","_handle","_marker"];

for "_i" from 0 to (count PO3_tasks_TasksLocal - 1) do {
	_task =+ PO3_tasks_TasksLocal select _i;
	_name = _task select 0;

	if (_name == (_this select 0)) then {
		_marker = _this select 4;
		_state = _this select 5;
		_task set [1,_state];
		PO3_tasks_TasksLocal set [_i,_task];

		{
			_handle = _x;
			{
				if (_handle in (simpletasks _x)) then {
					_handle settaskstate _state;

					if (_x == player) then {
						if (PO3_tasks_showHints) then { [_handle,_state] call PO3_fnc_showTaskHint };
						if (count _marker > 0) then {
							if (_state in ["succeeded","failed","canceled"]) then {
								["Taskmaster",format ["PO3_Taskmaster> updateTask deleting marker: %1, state: %2",_marker,_state]] call PO3_fnc_log;
								if (typename (_marker select 0) == typename "") then {
									_marker = [_marker];
								};
								{
									deletemarkerlocal (_x select 0);
								} foreach _marker;
							};
						};
					};
				};
			} foreach (if ismultiplayer then {playableunits} else {switchableunits});
		} foreach (_task select 2);
	};
};