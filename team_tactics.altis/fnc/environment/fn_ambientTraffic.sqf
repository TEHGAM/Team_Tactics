if (!PO3SRV) exitWith {};
private ["_civlist","_carlist","_sqname","_centree","_centrew","_centrec","_centrer"];

_radius = _this select 0;
_num = 4;

_carlist = ["C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_SUV_01_F","C_Van_01_box_F"];

_fnc_getCarSpawnPos = {
	private["_position","_rndVal"];
	_position = [];
	_rndVal = round random 1;
	if(_rndVal > 0) then {
		// Garage
	}else{
		// Road
	};
	_position;
};

_fnc_getPlayerPositions = {
	//
};

_fnc_checkNearbyCars = {
	_return = false;
	_return;
};

_fnc_initiliseCar = {
	private ["_car"];
	_car = _this select 0;
	waitUntil {sleep 10; false};
	deleteVehicle _car;
};


// SPAWN CIV/CAR INTO EMPTY GROUP
tpw_car_fnc_carspawn =
	{
	private ["_civ","_car","_roadseg","_spawnpos","_spawndir","_i","_ct","_sqname"];

	// Pick a random road segment to spawn car and civ
	[] call tpw_car_fnc_roadpos;
	_roadseg = tpw_car_farroads select (floor (random (count tpw_car_farroads)));
	_spawnpos = getposasl _roadseg;
	_spawndir = getdir _roadseg;
	_civ = _civlist select (floor (random (count _civlist)));
	_car = _carlist select (floor (random (count _carlist)));

	//Find the first empty civ squad to spawn into
	for "_i" from 1 to (count tpw_car_squadarray) do
		{
		_ct = _i - 1;
		_sqname = tpw_car_squadarray select _ct;
		if (count units _sqname == 0) exitwith
			{

			_spawncar = _car createVehicle _spawnpos;
			_spawncar setdir _spawndir;
			_civ createunit [_spawnpos,_sqname,"this moveindriver _spawncar;this setbehaviour 'CARELESS'"];

			//Add car to the array of spawened civs
			tpw_car_cararray set [count tpw_car_cararray,_spawncar];

			//Assign waypoints
			for "_i" from 1 to tpw_car_waypoints do
				{
				0 = [_sqname] call tpw_car_fnc_waypoint;
				};
			[_sqname, (tpw_car_waypoints - 1)] setWaypointType "CYCLE";
			};
		};
	};

// POOL OF ROAD POSTIONS NEAR PLAYER
tpw_car_fnc_roadpos =
{

		tpw_car_roadlist = (position player) nearRoads tpw_car_radius;
		tpw_car_farroads = [];
			{
			if (vehicle player distance position _x > 250) then
				{
				tpw_car_farroads set [count tpw_car_farroads,_x];
				};
			} foreach tpw_car_roadlist;

};
