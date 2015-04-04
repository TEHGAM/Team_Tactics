//На каждую из групп вешаем модуль с установкой позывного
//Скрипт для восстановления дефолта
private ["_unit","_otd"];

_unit = _this select 1;

if (_unit == player) then 
{
	_otd = player getVariable "GROUP";
	switch (_otd) do
	{
		case 1: {[player] execVM "scripts\Rearm\otd_1.sqf"};
		case 2: {[player] execVM "scripts\Rearm\otd_2.sqf"};
		case 3: {[player] execVM "scripts\Rearm\otd_3.sqf"};
		case 4: {[player] execVM "scripts\Rearm\otd_4.sqf"};
		default {[player] execVM "scripts\Rearm\def.sqf";};
	};
};