private["_injured","_return"];

_injured = _this select 0;

_return = if(
	alive _injured &&
	(_injured getVariable ["PO3_injury_inAgony",false]) &&
	isNull (_injured getVariable ["PO3_injury_dragger",objNull]) &&
	isNull (_injured getVariable ["PO3_injury_healer", objNull])
) then { true }else{ false };

if(PO3CLI) then {
	if !(alive _injured) then { [ format[localize "STR_PO3_INJURY_CHECKDEAD",name _injured] ] call PO3_fnc_hint };
};

_return