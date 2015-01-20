private["_location","_position","_locaname","_numIntel"];
// =========================================================================================================
//	Define Random Location
// =========================================================================================================

	_location = ["town","POI","base"] call PO3_fnc_getNewPos;

	PO3_TASK__DIF	= PO3_param_missionskill;
	PO3_TASK__POS	= _location select 0;
	PO3_TASK__IDD	= format["%1%2:%3",round(PO3_TASK__POS select 0),round(PO3_TASK__POS select 1),(round random 99)];

	_position = [PO3_TASK__POS,[0,(500*PO3_TASK__DIF)],random 360,false] call PO3_fnc_getPos;
	_locaname = _location select 1;
	_locRadis = _location select 2;

// =========================================================================================================
//	Create Target(s)
// =========================================================================================================

	_targetclass = PO3_target_intel_types call PO3_fnc_getArrayRandom;
	_numIntel = 1 + floor (random 5);
	_intelPieces = [];

// =========================================================================================================
//	Create Hostiles
// =========================================================================================================
	PO3_TOTAL_UNITS = [];
	PO3_TOTAL_VEHICLES = [];

//	_b = 4*(PO3_TASK__DIF*3);
	_b = (12*(playersNumber(PO3_side_1 select 0)/40)*PO3_TASK__DIF) max 1;

	for "_i" from 1 to _b do {
		_grp = nil;
		_grp = [ _position, (PO3_side_3 select 0), format["EN_GroupForce_%1",round random 4], 200 ] call PO3_fnc_createGroup;
		if !(isNil "_grp") then {
			[ _position, _grp, (50 * _i) ] spawn PO3_fnc_groupPatrolArea;
			PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
			sleep 1;
		};
	};

	for "_i" from 1 to 2 do {
		_grp = nil;
		_grp = [ _position, (PO3_side_3 select 0), format["EN_GroupForce_%1",round random 4], 100 ] call PO3_fnc_createGroup;
		if !(isNil "_grp") then {
			[ _position, _grp ] spawn PO3_fnc_groupDefendPos;
			PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
			sleep 1;
		};
	};

// ========
//	Assign Intel to enemies
// ========
	_inteUnitList = PO3_TOTAL_UNITS;
	for "_i" from 1 To (_numIntel + 4) do {
		_targetUnit = _inteUnitList call PO3_fnc_getArrayRandom;
		_targetclass = PO3_target_intel_types call PO3_fnc_getArrayRandom;
		intel = _targetclass createVehicle position _targetUnit;

		PO3_hideObject = [true,intel];
		publicVariable "PO3_hideObject";
		intel attachTo [_targetUnit,[0.5,0,0.2]];
		intel setVariable ["PO3_intel_capture",true,true];

		[_targetUnit,intel] spawn {
			_targetUnit = _this select 0;
			_intel = _this select 1;
			waitUntil {sleep 1; !(alive _targetUnit)};
			detach _intel;
			PO3_hideObject = [false,_intel];
			publicVariable "PO3_hideObject";
		};
		_intelPieces = _intelPieces + [intel];
	};

	_vehClass = [];
	if(_b <= 2) then { _vehClass set [count _vehClass,4]; };
	if(_b >= 3)  then { _vehClass set [count _vehClass,5]; };
	if(_b >= 4) then { _vehClass set [count _vehClass,3]; };

	for "_i" from 0 to (_b/2) do {
		if(random 1 > 0.5 || _b >= 8) then {
			_class = _vehClass call PO3_fnc_getVehicleTypes;
			if(count _class > 0) then {
				_veh = ([ _position,_class call PO3_fnc_getArrayRandom,random 360,100,(PO3_side_3 select 0)] call PO3_fnc_createVehicle) select 0;
				if !(isNil "_veh") then {
					[ _position, _veh, 100 + round(random 300) ] spawn PO3_fnc_groupPatrolArea;
					PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
					PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
				};
			};
		};
	};

	_statics = [_position,4,50,[10] call PO3_fnc_getVehicleTypes,(PO3_side_3 select 0)] call PO3_fnc_createStaticDefense;
	if( count _statics > 0 ) then {
		{ PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _x); }forEach _statics;
	};

// =========================================================================================================
//	Create Tasks
// =========================================================================================================

	[ format["TASK%1",_taskid],
		localize "STR_PO3_M04_TITLE",
		format[localize "STR_PO3_M04_DESCR",_taskid,_locaname,_numIntel,(PO3_side_3 select 2)],
		(PO3_side_1 select 0),
		[format["MRKR%1",_taskid],_position,"mil_objective","ColorOPFOR",localize "STR_PO3_M04_TITLE"],
		"assigned",
		(_position),
		localize "STR_PO3_M04_TITLE"
	] call PO3_fnc_addTask;

// =========================================================================================================
//	WAIT UNTIL COMPLETE/FAIL
// =========================================================================================================
/*
	{
		waitUntil{ sleep 1; _x distance ("return_point" call PO3_fnc_getPos) < 10 };
	}forEach _intelPieces;
*/
	_returnPointLoc = "return_point" call PO3_fnc_getPos;
	waitUntil {
		sleep 3;
		({ _x distance _returnPointLoc < 15 } count _intelPieces) >= _numIntel;
	};

	sleep 1;
	[format["TASK%1",_taskid],"succeeded"] call PO3_fnc_updateTask;


// =========================================================================================================
//	Cleanup
// =========================================================================================================

	_target action ["eject",vehicle _target];

	sleep 2;
	deleteVehicle _target;
	deleteGroup _target_grp;

	{
		detach _x;
		deleteVehicle _x;
	}forEach _intelPieces;

	{
		if(alive _x && !(isPlayer _x) ) then { _x setDamage 1 };
	}forEach _Tunits+_Tvehicles;

if(true) exitWith {};