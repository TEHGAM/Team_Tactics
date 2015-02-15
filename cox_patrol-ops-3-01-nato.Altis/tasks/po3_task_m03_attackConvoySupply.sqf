private["_location","_position","_locaname"];
// =========================================================================================================
//	Define Random Location
// =========================================================================================================

	_location = "town" call PO3_fnc_getNewPos;

	PO3_TASK__DIF	= PO3_param_missionskill;
	PO3_TASK__POS	= _location select 0;
	PO3_TASK__IDD	= format["%1%2:%3",round(PO3_TASK__POS select 0),round(PO3_TASK__POS select 1),(round random 99)];

	_position = [ [PO3_TASK__POS,[0,(1000*PO3_TASK__DIF)],random 360,false],50,10,0,0.3] call PO3_fnc_getSafePos;
	_locaname = _location select 1;
	_locRadis = _location select 2;

// =========================================================================================================
//	Create Targets
// =========================================================================================================
	PO3_TOTAL_UNITS = [];
	PO3_TOTAL_VEHICLES = [];

//	_b = 2*(PO3_TASK__DIF*3);
	_b = (8*(playersNumber(PO3_side_1 select 0)/40)*PO3_TASK__DIF) max 1;

	_nearlocations = [_position,3000] call PO3_fnc_getNearbylocations;

	_fullGroup = createGroup (PO3_side_3 select 0);
	for "_i" from 0 to _b do {
		_class = [3] call PO3_fnc_getVehicleTypes;
		if(count _class > 0) then {
			_veh = ([ [_position,50,10,0,0.3] call PO3_fnc_getSafePos,_class call PO3_fnc_getArrayRandom,random 360,100,(PO3_side_3 select 0)] call PO3_fnc_createVehicle) select 0;
			if !(isNil "_veh") then {
				PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
				PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
				(units _veh) joinSilent _fullGroup; deleteGroup _veh;
			};
		};
	};

	{
		_wp = _fullGroup addWaypoint [position _x,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointCompletionRadius 20;
		_wp setWaypointTimeout [0,5,15];
		if(_forEachIndex == 0) then {
			_wp setWaypointSpeed "LIMITED";
			_wp setWaypointBehaviour "SAFE";
			_wp setWaypointFormation "COLUMN";
		};

		if(PO3_debug) then {
			_marker = createMarkerlocal [format["PO3_temp_ap%1",_x],position _x];
			_marker setMarkerTypelocal "mil_dot";
			_marker setMarkersizelocal [0.3,0.3];
			_marker setMarkerTextlocal str _forEachIndex;
		};
	} foreach _nearlocations;

	if!(isNil "_wp") then { _wp setWaypointType "CYCLE" };

// =========================================================================================================
//	Create Tasks
// =========================================================================================================
	[ format["TASK%1",PO3_TASK__IDD],
		format[localize "STR_PO3_M03_TITLE",_locaname],
		format[localize "STR_PO3_M03_DESCR",PO3_TASK__IDD,_locaname],
		(PO3_side_1 select 0),
		[format["MRKR%1",PO3_TASK__IDD],_position,"mil_objective","ColorOPFOR",""],
		"assigned",
		(_position),
		format[localize "STR_PO3_M03_TITLE",_locaname]
	] call PO3_fnc_addTask;

	["PO3",format["Task: %1 %2 Generated at %3","AttackConvoyArmoured",PO3_TASK__IDD,_location],true] spawn PO3_fnc_log;

// =========================================================================================================
//	WAIT UNTIL COMPLETE/FAIL
// =========================================================================================================
	waitUntil{ sleep 1; { canMove _x } count PO3_TOTAL_VEHICLES == 0 };
	sleep 1;
	if( { canMove _x } count PO3_TOTAL_VEHICLES == 0 ) then {
		[format["TASK%1",PO3_TASK__IDD],"succeeded"] call PO3_fnc_updateTask;
	}else{
		[format["TASK%1",PO3_TASK__IDD],"failed"] call PO3_fnc_updateTask;
	};

// =========================================================================================================
//	Cleanup
// =========================================================================================================
	[_position,PO3_TOTAL_UNITS,PO3_TOTAL_VEHICLES] spawn {
		private["_target","_units","_vehicles"];

		_target = _this select 0;
		_units = _this select 1;
		_vehicles = _this select 2;

		waitUntil { count ([_target,500,(PO3_side_1 select 0),["CAManBase"]] call PO3_fnc_getNearbyPlayers) == 0 };

		{ if(alive _x) then { _x setDamage 1 }; }forEach _units;
		{ if( {isPlayer _x} count (crew _x) == 0 ) then { _x setDamage 1 }; }forEach _vehicles;
	};

if(true) exitWith {};