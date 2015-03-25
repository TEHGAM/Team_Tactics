//Создаем отделения игровых персонажей, каждому персонажу присваиваем имя в виде [тип юнита]_[номер отделения]
// Например, тип игрового персонажа B_Soldier_SL_F и он состоит в первом отделении, его имя - SL_1. Добавляем его в массив отделения 1.
_otd1 = [SL_1,EN_1,GL_1,AR_11,AR_12,ME_1,AA_1,AT_1];
_otd2 = [SL_2,EN_2,GL_2,AR_21,AR_22,ME_2,MS_2,LAT_2];
_otd3 = [ME_3,MS_3,LAT_3,EXP_3];
//_otd4 = [SOL_41,SOL_42,AR_4,GL_4,MS_41,MS_42];

waitUntil {player == player};
waitUntil {sleep 0.1; alive player};
if (player in _otd1) then	{[player] execVM "scripts\Rearm\otd_1.sqf"};
if (player in _otd2) then	{[player] execVM "scripts\Rearm\otd_2.sqf"};
if (player in _otd3) then	{[player] execVM "scripts\Rearm\otd_3.sqf"};
if ((groupID(group player))=="GROUP_4") then	{[player] execVM "scripts\Rearm\otd_4.sqf"};