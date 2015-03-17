//[] execVM "proba.sqf";
//кривой скрипт на поджопник из техники, ибо много повторяющегося кода, нужно писать через функции. Интересно, а перезгрузки функций наверно в арме нет?

private ["_pilots","_crews","_cp","_warhelis","_helis","_allhelis","_planes","_air","_teh","_all","_top"];

_crews = ["B_crew_F","B_soldier_repair_F","B_support_Mort_F"]; 	// массив разрешенных водителей
_pilots = ["B_Helipilot_F","B_helicrew_F","B_Pilot_F"];			//массив разрешенных пилотов 
_cp = _crews + _pilots;
//массив запрещенных для обычных солдат вертолетов
_warhelis = ["B_Heli_Attack_01_F"];
_helis = ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F","B_Heli_Transport_03_F"];
_allhelis = _warhelis + _helis;
//-/- самолетов
_planes =["B_Plane_CAS_01_F"];
// общий массив пилотируемых ЛА
_air = _warhelis + _helis + _planes;
_teh = ["B_MBT_01_arty_F","B_MBT_01_TUSK_F","B_APC_Tracked_01_CRV_F","B_MBT_01_mlrs_F"];		//массив запрещенной для обычных солдат бронетехники

_all = _air + _teh;//общий массив запрещенной техники для обычных солдат
_top = typeof player;

//если игрок не обладает ни одной специальностью, пинка под зад из любой особой техники!
if !(_top in _cp) then
{
	private "_veh";
	while {alive player} do
	{
		waituntil {vehicle player != player};
		_veh = vehicle player;
		if ((typeof _veh) in _all) then 
			{
				if (driver _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (gunner _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (commander _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if ((_veh turretUnit [0])== player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
			};
		sleep 1;
	};
};
//если игрок пилот
if (_top in _pilots) then
{
	private "_veh";
	while {alive player} do
	{
		waituntil {vehicle player != player};
		_veh = vehicle player;
		//выкидываем из особой наземной, ибо пилот!
		if ((typeof _veh) in _teh) then
			{
				if (driver _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (gunner _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (commander _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if ((_veh turretUnit [0])== player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
			};
		//Пинок из воздушной техники
		if (_top == "B_Pilot_F") then {
			if ((typeof _veh) in _allhelis) then
			{
				if (driver _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (gunner _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (commander _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if ((_veh turretUnit [0])== player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
			};
		};
		
		//Если пилот боевого вертолета, то выбрасываем из самолета
		if (_top == "B_Helipilot_F") then{
			if ((typeof _veh) in _planes) then
			{
				if (driver _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (gunner _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (commander _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if ((_veh turretUnit [0])== player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
			};
		};
			
		//Если пилот простого вертолета, выбрасываем из самолета и боевого вертолета
		if (_top == "B_helicrew_F") then{
			if (((typeof _veh) in _planes) or ((typeof _veh) in _warhelis))then
			{
				if (driver _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (gunner _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (commander _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if ((_veh turretUnit [0])== player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
			};
		};
		sleep 1;
	};
	
};
//если игрок водила
if (_top in _crews) then
{
	private "_veh";
	
	while {alive player} do
	{
		waituntil {vehicle player != player};
		_veh = vehicle player;
		if ((typeof _veh) in _air) then
		{
			if (driver _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if (gunner _veh == player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
				if ((_veh turretUnit [0])== player) then 
				{
					player action["getOut",_veh];
					waituntil {vehicle player == player};
					player groupChat "У меня нет прав на использование этой техники!";
				};
			
		};
		sleep 1;
	};
};

