//На каждую из групп вешаем модуль с установкой позывного
//Скрипт для восстановления дефолта
private ["_unit","_gid"];

_unit = _this select 1;
_gid = groupID(group _unit);
if (_unit == player) then 
{
	switch (_gid) do
	{
		case "GROUP_1": {[player] execVM "scripts\Rearm\otd_1.sqf"};
		case "GROUP_2": {[player] execVM "scripts\Rearm\otd_2.sqf"};
		case "GROUP_3": {[player] execVM "scripts\Rearm\otd_3.sqf"};
		case "GROUP_4": {[player] execVM "scripts\Rearm\otd_4.sqf"};
		default {[player] execVM "scripts\Rearm\def.sqf";};
	};
};