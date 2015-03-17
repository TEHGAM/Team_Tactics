scriptName "PO3\fnc\arrays\fn_processParams.sqf";
/*
	Author: Eightysix

	Description:
	Processes the Mission Start Parameters

	Syntax:
	[] call PO3_fnc_processParams;

	Example:

*/
private["_pname","_pval","_pcode","_var"];

["ParamsArray",paramsArray] call PO3_fnc_log;
{
	_pname	= configName ((missionConfigFile >> "Params") select _ForEachIndex);
	_pCode	= getText (missionConfigFile >> "Params" >> _pname >> "code");
	_pval	= paramsArray select _ForEachIndex;
	_var	= format[_pCode, _pval];
	if( _pcode != "" ) then {
		call compileFinal _var;
		["ParamCompile",_var] call PO3_fnc_log;
	};
}forEach paramsArray;