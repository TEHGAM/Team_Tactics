/*
	Author: Eightysix

	Description:


	Syntax:


	Example:


*/

if(!isNil "PO3_tasks_sequence_complete") then { PO3_tasks_sequence_complete = nil };
if(!isServer) exitWith{ waitUntil{sleep 1; !isNil "PO3_tasks_sequence_complete"} };

private["_list","_count","_folder","_script","_mission"];

_list = if( toUpper( typename( _this select 0 )) == "ARRAY" ) then { _this select 0 }else{ _this };
_count = (count _list) - 1;
_folder = if( count _this > 1 && toUpper( typename( _this select 0 )) == "ARRAY" ) then { _this select 1 }else{ "tasks" };

for "_i" from 0 to _count do {
	sleep 2;
	_mission = _list select _i;
	_script = [] execVM format["%1\%2.sqf", _folder, _mission];
	waitUntil{sleep 0.1; scriptdone _script};
	sleep 2;
};

PO3_tasks_sequence_complete = true; publicVariable "PO3_tasks_sequence_complete";