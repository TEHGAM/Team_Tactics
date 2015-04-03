//На каждую из групп вешаем модуль с установкой позывного
//Скрипт для восстановления дефолта
private ["_unit","_otd"];
_otd1=[sq1_1,sq1_2,sq1_3,sq1_4,sq1_5,sq1_6,sq1_7,sq1_8];//heavy
_otd2=[sq2_1,sq2_2,sq2_3,sq2_4,sq2_5,sq2_6,sq2_7,sq2_8];//light
_otd3=[sq3_1,sq3_2,sq3_3,sq3_4];						//recon
_otd4=[sq4_1,sq4_2,sq4_3,sq4_4,sq4_5,sq4_6];			//spec ops
_unit = _this select 1;

if (_unit == player) then 
{
	if (player in _otd1) then {_otd = 1;};
	if (player in _otd2) then {_otd = 2;};
	if (player in _otd3) then {_otd = 3;};
	if (player in _otd4) then {_otd = 4;};
	switch (_otd) do
	{
		case 1: {[player] execVM "scripts\Rearm\otd_1.sqf"};
		case 2: {[player] execVM "scripts\Rearm\otd_2.sqf"};
		case 3: {[player] execVM "scripts\Rearm\otd_3.sqf"};
		case 4: {[player] execVM "scripts\Rearm\otd_4.sqf"};
		default {[player] execVM "scripts\Rearm\def.sqf";};
	};
};