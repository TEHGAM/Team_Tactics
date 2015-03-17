/*
	Author: Shuko
	Modified: Eightysix

	Description:


	Syntax:


	Example:


*/

private "_cond";

if (count _this > 2) then { _cond = _this select 2 } else { _cond = true };

{
	if ( [_x,_cond] call PO3_fnc_checkObjCondition ) then {
		_x creatediaryrecord ["Tasks",[_this select 0,_this select 1]];

		if (time > 10) then{ ["Diary note added."] call PO3_fnc_hint };

	};
} foreach (if ismultiplayer then {playableunits} else {switchableunits});
