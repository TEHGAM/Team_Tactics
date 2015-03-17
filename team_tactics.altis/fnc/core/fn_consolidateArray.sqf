scriptName "PO3\fnc\arrays\fn_consolidateArray.sqf";
/*
	Author: Jiri Wainar

	Description:
	Finds duplicities in array of strings and consolidates it to the array of sub-arrays, where:
	id 0: string
	id 1: occurrence count

	Syntax:
	_cosolidated:array = _strings:array call PO3_fnc_consolidateArray;

	Example:
	[["apple",3],["pear",2]] = ["apple","apple","pear","pear","apple"] call BIS_fnc_consolidateArray;
*/

private ["_output","_input","_string","_count"];

_input 	= _this;
_output = [];

if (typeName _input != typeName []) exitWith {
	["fnc_Group_consolidateArray","Input must be an array of strings"] call PO3_fnc_log;
	[]
};

while {count _input > 0} do {
	_string = _input select 0;

	if (typeName _string != typeName "") exitWith {
		_output = [];
	};

	_count 	= {_x == _string} count _input;
	_output set [count _output,[_string,_count]];
	_input = _input - [_string];
};

_output