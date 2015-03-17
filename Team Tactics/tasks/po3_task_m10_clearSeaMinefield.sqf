private["_location","_position","_locaname"];
// =========================================================================================================
//	Define Random Location
// =========================================================================================================

	_location = "bay" call PO3_fnc_getNewPos;

	PO3_TASK__DIF	= PO3_param_missionskill;
	PO3_TASK__POS	= _location select 0;
	PO3_TASK__IDD	= format["%1%2:%3",round(PO3_TASK__POS select 0),round(PO3_TASK__POS select 1),(round random 99)];

	_position = [PO3_TASK__POS,[10,300],1,2,10] call PO3_fnc_getSafePos;
	_locaname = _location select 1;
	_locRadis = _location select 2;

	_depthTest = "Sign_Sphere25cm_F" createVehicle _position;
	while { (getPosASL _depthTest select 2) > -5 } do
	{
		deleteVehicle _depthTest;
		_position = [_position,[10,300],1,2,10] call PO3_fnc_getSafePos;
		_depthTest = "Sign_Sphere25cm_F" createVehicle _position;
	};
	deleteVehicle _depthTest;

// =========================================================================================================
//	Create Target
// =========================================================================================================
	PO3_TOTAL_UNITS = [];
	PO3_TOTAL_VEHICLES = [];

	_minePositions = [];
	_mineCountMax = round ((PO3_TASK__DIF*3 + 1) + random (PO3_TASK__DIF*6));
	for "_i" from 0 to 1000 do {
		_testPos = [ [_position,[0,150],random 360],[8,15],7,2,10] call PO3_fnc_getSafePos;
		_testPos set [2,0];
		if(surfaceIsWater _testPos) then {
			_depthTest = "Sign_Sphere25cm_F" createVehicle _testPos;
			if( ((getPosASL _depthTest) select 2) < (-5) ) then {
				_minePositions set [count _minePositions, _testPos];
			};
			deleteVehicle _depthTest;
		};

		if(count _minePositions >= _mineCountMax) exitWith {};
	};

	_mines = [];
	{
		_mine = createMine ["UnderwaterMine", [_x select 0,_x select 1], [], 0];
		_mine setPosATL [_x select 0,_x select 1,(getPosATL _mine select 2) - 2];
		(PO3_side_3 select 0) revealMine _mine;
		_mines set [count _mines,_mine];
	} forEach _minePositions;

	{
		if(PO3_debug) then {
			_marker = createmarkerlocal [format["%2%1",_x,random 999],(_x call PO3_fnc_getPos)];
			_marker setmarkershapelocal "ICON";
			_marker setmarkertypelocal "mil_dot";
			_marker setmarkercolorlocal "ColorRed";
		};
	}forEach _mines;

	_targets = [];
	_mineTruck = if(random 1 > 0.5) then {true} else {false};
	if(_mineTruck) then {
		_shorePos = [_position,[10,300],5,0,1] call PO3_fnc_getSafePos;
		for "_i" from 1 to (PO3_TASK__DIF*3) do {
			_grp = nil;
			_grp = [_shorePos , (PO3_side_3 select 0), "EN_PatrolGroup0", 100 ] call PO3_fnc_createGroup;
			if !(isNil "_grp") then {
				[ _shorePos, _grp, 100 ] spawn PO3_fnc_groupDefendPos;
				PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
				sleep 1;
			};

			_grp = nil;
			_grp = [ _shorePos, (PO3_side_3 select 0), format["EN_GroupForce_%1",round random 4], 100 ] call PO3_fnc_createGroup;
			if !(isNil "_grp") then {
				[ _shorePos, _grp, (50 * _i) ] spawn PO3_fnc_groupPatrolArea;
				PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
				sleep 1;
			};

			_class = [9,14] call PO3_fnc_getVehicleTypes;
			if(count _class > 0) then {
				_veh = ([ _shorePos,_class call PO3_fnc_getArrayRandom,random 360,20,(PO3_side_3 select 0)] call PO3_fnc_createVehicle) select 0;
				if !(isNil "_veh") then {
					PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
					PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
					_targets set [ count _targets, vehicle (leader _veh) ];
				};
			};
		};
	};

// =========================================================================================================
//	Create Hostiles
// =========================================================================================================

	_b = (12*(playersNumber(PO3_side_1 select 0)/40)*PO3_TASK__DIF) max 1;

	// Boats
	_numBoats = ceil(round(_b/3) max 1);
	for "_i" from 1 to _numBoats do {
		_class = [11,15] call PO3_fnc_getVehicleTypes;
		if(count _class > 0) then {
			_veh = ([ [_position,[200,500],5,2,10] call PO3_fnc_getSafePos,_class call PO3_fnc_getArrayRandom,random 360,10,(PO3_side_3 select 0),"EN_Squad_Divers"] call PO3_fnc_createVehicle) select 0;
			if !(isNil "_veh") then {
				[ position(leader _veh), _veh, 500 + (random 1000)] spawn PO3_fnc_groupPatrolArea;
				PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
				PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
			};
			sleep 1;
		};
	};

	// Helicopters
	for "_i" from 1 to (PO3_TASK__DIF*3) do {
		_class = [7] call PO3_fnc_getVehicleTypes;
		if(count _class > 0) then {
			_veh = ([ _position,_class call PO3_fnc_getArrayRandom,random 360,(750 + random 250),(PO3_side_3 select 0),[],"FLY"] call PO3_fnc_createVehicle) select 0;
			if !(isNil "_veh") then {
				[ _position, _veh, 1000 + round(random 2000) ] spawn PO3_fnc_groupPatrolArea;
				PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
				PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
			};
		};
	};

	// Divers
	for "_i" from 1 to ceil(round(_b/2) max 1) do {
		_grp = nil;
		_grp = [ _position, (PO3_side_3 select 0), "EN_Squad_Divers", 400 ] call PO3_fnc_createGroup;
		if !(isNil "_grp") then {
			[ _position, _grp, 50 + round(random 350) ] spawn PO3_fnc_groupPatrolArea;
			{
				_depth = (getPosATL _x select 2);
				_patrolDepthMin = (_depth * 0.15);
				_patrolDepth = _patrolDepthMin + (random ((_depth * 0.7) - _patrolDepthMin));
				_x swimInDepth (-1 * _patrolDepth);
			}forEach units _grp;
			PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
			sleep 1;
		};
	};

// =========================================================================================================
//	Create Tasks
// =========================================================================================================

	[ format["TASK%1",PO3_TASK__IDD],
		localize "STR_PO3_M10_TITLE",
		if!(_mineTruck) then {
			format[localize "STR_PO3_M10_DESCR_1",PO3_TASK__IDD,(PO3_side_3 select 2),_locaname,count _mines]
		}else{
			format[localize "STR_PO3_M10_DESCR_2",PO3_TASK__IDD,(PO3_side_3 select 2),_locaname,count _mines]
		},
		(PO3_side_1 select 0),
		[format["MRKR%1",PO3_TASK__IDD],PO3_TASK__POS,"mil_unknown",(PO3_side_3 select 0) call PO3_fnc_getUnitMarkerColour," SeaMines"],
		"assigned",
		(PO3_TASK__POS),
		localize "STR_PO3_M10_TITLE"
	] call PO3_fnc_addTask;

// =========================================================================================================
//	WAIT UNTIL COMPLETE/FAIL
// =========================================================================================================

	waitUntil { sleep 3; ({mineActive _x} count _mines <= 0) && ({alive _x} count _targets <= 0) };

	[format["TASK%1",PO3_TASK__IDD],"succeeded"] call PO3_fnc_updateTask;

// =========================================================================================================
//	Cleanup
// =========================================================================================================
	sleep 2;
	{ deleteVehicle _x }forEach _mines;

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