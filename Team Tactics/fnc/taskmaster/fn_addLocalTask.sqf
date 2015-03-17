/*
	Author: Shuko
	Modified: Eightysix

	Description:
		DO NOT CALL DIRECTLY
*/

private ["_handle","_handles","_name","_state","_marker","_dest","_chev"];

_handles = [];
_name = _this select 0;
_marker = _this select 4;
_state = _this select 5;
_dest = _this select 6;
_chev = _this select 7;

{
	if ( [_x,(_this select 3)] call PO3_fnc_checkObjCondition ) then {

		_handle = _x createsimpletask [_name];
		_handle setsimpletaskdescription [(_this select 2),(_this select 1),_chev];
		_handle settaskstate _state;

		if (_state in ["assigned"]) then {
			_x setcurrenttask _handle;
		};

		switch (toupper(typename _dest)) do {
			case "OBJECT": { _handle setsimpletasktarget [_dest,true] };
			case "STRING": { _handle setsimpletaskdestination (_dest call PO3_fnc_getPos) };
			case "ARRAY": { _handle setsimpletaskdestination (_dest call PO3_fnc_getPos) };
		};

		_handles set [count _handles,_handle];

		if (_x == player) then {
			if (PO3_tasks_showHints) then { [_handle,_state] call PO3_fnc_showTaskHint };

			if (count _marker > 0) then {
				if !(_state in ["succeeded","failed","canceled"]) then {
					if (typename (_marker select 0) == typename "") then {
						_marker = [_marker];
					};

					private ["_m","_t","_c","_txt"];
					{
						_m = createmarkerlocal [(_x select 0),(_x select 1) call PO3_fnc_getPos];
						_m setmarkershapelocal "ICON";

						_t = "selector_selectedMission";
						if (count _x > 2) then {
							private "_tmp";
							_tmp = (_x select 2);
							if (_tmp != "") then {
								_t = _tmp;
							};
						};

						_m setmarkertypelocal _t;

						_c = "ColorRed";
						if (count _x > 3) then {
							private "_tmp";
							_tmp = (_x select 3);
							if (_tmp != "") then {
								_c = _tmp;
							};
						};
						_m setmarkercolorlocal _c;

						if (count _x > 4) then { _m setmarkertextlocal format[" %1",(_x select 4)] };
						if (count _x > 5) then { _m setMarkerSizeLocal  (_x select 5) };

					} foreach _marker;
				};
			};
		};
	};
} foreach (if ismultiplayer then {playableunits} else {switchableunits});

PO3_tasks_TasksLocal set [count PO3_tasks_TasksLocal,[_name,_state,_handles]];