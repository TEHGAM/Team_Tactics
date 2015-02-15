scriptName "PO3\fnc\arrays\fn_arrayShuffle.sqf";
/*
	Author: Nelson Duarte

	Description:
	This returns a new array with randomized order of elements from input array

	Parameters:
	_this: ARRAY

	Returns:
	ARRAY

	Example:
	[1, 2, 3] call BIS_fnc_arrayShuffle
	Returns: [2, 3, 1] (For example)
*/
private ["_array","_copy","_result","_index","_randomElement"];

_array	= _this;

_copy	= [];
{
	_copy set [count _copy, _x];
} forEach _array;

_result	= [];
for "_i" from 0 to (count _copy - 1) do {
	_index = round (random (count _copy - 1));
	_randomElement = _copy select _index;
	_result set [count _result, _randomElement];

	_copy set [_index, "REMOVE"];
	_copy = _copy - ["REMOVE"];
};

_result;
