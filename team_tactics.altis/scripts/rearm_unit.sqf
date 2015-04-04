//На каждую из групп вешаем модуль с установкой позывного
waitUntil {player == player};
waitUntil {sleep 0.1; alive player};
/* _otd1=[sq1_1,sq1_2,sq1_3,sq1_4,sq1_5,sq1_6,sq1_7,sq1_8];//heavy
_otd2=[sq2_1,sq2_2,sq2_3,sq2_4,sq2_5,sq2_6,sq2_7,sq2_8];//light
_otd4=[sq4_1,sq4_2,sq4_3,sq4_4,sq4_5,sq4_6];			//spec ops */
private ["_otd"];
_otd = player getVariable "GROUP";
switch (_otd) do
	{
		case 1: {[player] execVM "scripts\Rearm\otd_1.sqf"};
		case 2: {[player] execVM "scripts\Rearm\otd_2.sqf"};
		case 3: {[player] execVM "scripts\Rearm\otd_3.sqf"};
		case 4: {[player] execVM "scripts\Rearm\otd_4.sqf"};
		default {[player] execVM "scripts\Rearm\def.sqf";};
	};