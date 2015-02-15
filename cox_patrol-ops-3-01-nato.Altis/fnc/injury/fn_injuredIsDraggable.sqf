private["_injured","_return"];

_injured = _this select 0;

_return = if(
	{_injured getVariable ["PO3_injury_inAgony",false]} &&
	isNull {_injured getVariable ["PO3_injury_dragger",objNull]} &&
	isNull {_injured getVariable ["PO3_injury_healer", objNull]}
) then { true }else{ false };

_return