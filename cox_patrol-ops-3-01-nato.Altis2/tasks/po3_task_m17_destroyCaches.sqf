private["_location","_position","_locaname"];
// =========================================================================================================
//	Define Random Location
// =========================================================================================================

	_location = ["city","town"] call PO3_fnc_getNewPos;

	PO3_TASK__DIF	= PO3_param_missionskill;
	PO3_TASK__POS	= _location select 0;
	PO3_TASK__IDD	= format["%1%2:%3",round(PO3_TASK__POS select 0),round(PO3_TASK__POS select 1),(round random 99)];

	_position = [ [PO3_TASK__POS,[0,(50*PO3_TASK__DIF)],random 360,false],50,10,0,0.3] call PO3_fnc_getSafePos;
	_locaname = _location select 1;
	_locRadis = ((_location select 2 select 0) max (_location select 2 select 1) max 300) * PO3_TASK__DIF;

// =========================================================================================================
//	Create Target(s)
// =========================================================================================================
	PO3_TOTAL_UNITS = [];
	PO3_TOTAL_VEHICLES = [];

//	_b = 4*(PO3_TASK__DIF*3);
	_b = (12*(playersNumber(PO3_side_1 select 0)/40)*PO3_TASK__DIF) max 1;

	_nearByBuildings = [_position,_locRadis] call PO3_fnc_getNearbyBuildings;

	// create caches
	_caches = [];
	_cacheType = PO3_target_cache_types select ([west,east,resistance] find (PO3_side_3 select 0));
	for "_i" from 1 to round(_b*0.75) do {
		_cache = createVehicle [_cacheType,_position,[],0,"NONE"];
		_cache setpos ([ [PO3_TASK__POS,[50,(_locRadis*PO3_TASK__DIF)],random 360,false],15,5,0,0.3] call PO3_fnc_getSafePos);
		if( count _nearByBuildings > 0 ) then {
			_building = _nearByBuildings call PO3_fnc_getArrayRandom;
			_nearByBuildings = _nearByBuildings - [_building];
			for "_i" from 0 to 20 do {
				_bpos = _building buildingPos round(random 20);
				if( str _bpos != "[0,0,0]") exitWith { _cache setpos _bpos; };
			};
		};
		_cache spawn { waitUntil { !(alive _this) || damage _this > 0.8 }; deleteVehicle _this; };
		_caches set [count _caches, _cache];

		_grp = nil;
		_grp = [ position _cache, (PO3_side_3 select 0), "EN_PatrolGroup0", 20 ] call PO3_fnc_createGroup;
		if !(isNil "_grp") then {
			[ position _cache, _grp, 20] spawn PO3_fnc_groupDefendPos;
			PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
			sleep 1;
		};
	};
	_caches call PO3_fnc_setDamageEH_C4Only;

	{
		if(PO3_debug) then {
			_marker = createmarkerlocal [format["%2%1",_x,random 999],(_x call PO3_fnc_getPos)];
			_marker setmarkershapelocal "ICON";
			_marker setmarkertypelocal "mil_dot";
			_marker setmarkercolorlocal "ColorRed";
		};
	}forEach _caches;

// =========================================================================================================
//	Create Hostiles
// =========================================================================================================

	for "_i" from 1 to _b/2 do {
		_grp = nil;
		_grp = [ _position, (PO3_side_3 select 0), format["EN_GroupForce_%1",round random 4], 200 ] call PO3_fnc_createGroup;
		if !(isNil "_grp") then {
			[ _position, _grp, (50 * _i) ] spawn PO3_fnc_groupPatrolArea;
			PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
			sleep 1;
		};
	};

	for "_i" from 1 to _b/2 do {
		_grp = nil;
		_grp = [ _position, (PO3_side_3 select 0), format["EN_GroupForce_%1",round random 4], 100 ] call PO3_fnc_createGroup;
		if !(isNil "_grp") then {
			[ position (leader _grp), _grp ] spawn PO3_fnc_groupDefendPos;
			PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
			sleep 1;
		};
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

	[ format["TASK%1",PO3_TASK__IDD],
		localize "STR_PO3_M17_TITLE",
		format[ localize "STR_PO3_M17_DESCR",PO3_TASK__IDD,(PO3_side_3 select 2),_locaname,count _caches,[_cacheType] call PO3_fnc_getCfgIcon],
		(PO3_side_1 select 0),
		[format["MRKR%1",PO3_TASK__IDD],PO3_TASK__POS,"mil_objective",(PO3_side_3 select 0) call PO3_fnc_getUnitMarkerColour,localize "STR_PO3_M17_TITLE"],
		"assigned",
		PO3_TASK__POS,
		localize "STR_PO3_M17_TITLE"
	] call PO3_fnc_addTask;

	["PO3",format["Task: %1 %2 Generated at %3","DestroyTower",PO3_TASK__IDD,_location],true] spawn PO3_fnc_log;

// =========================================================================================================
//	WAIT UNTIL COMPLETE/FAIL
// =========================================================================================================

	_spawnAmbush = {
		private["_position","_b","_ingress","_grp"];

		_position = _this select 0;
		_b = _this select 1;
		_ingress = [_position ,[400,500],random 360,false] call PO3_fnc_getPos;

		_vehClass = [];
		if(_b <= 3) then { _vehClass set [count _vehClass,4]; };
		if(_b >= 3 && _b < 9)  then { _vehClass set [count _vehClass,5]; };
		if(_b >= 6) then { _vehClass set [count _vehClass,3]; };

		for "_i" from 0 to _b do {
			_grp = nil;
			_grp = [ _ingress, (PO3_side_3 select 0), format["EN_GroupForce_%1",round random 4], 50 ] call PO3_fnc_createGroup;
			if !(isNil "_grp") then {
				[ _position, _grp ] spawn PO3_fnc_groupAttackPos;
				PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _grp);
				sleep 1;
			};
		};

		for "_i" from 0 to (floor(_b/2)) do {
			if(random 1 > 0.5 || _b > 6) then {
				_class = _vehClass call PO3_fnc_getVehicleTypes;
				if(count _class > 0) then {
					_ingress = [_position ,[500,600],random 360,false] call PO3_fnc_getPos;
					_veh = ([ _ingress,_class call PO3_fnc_getArrayRandom,random 360,100,(PO3_side_3 select 0)] call PO3_fnc_createVehicle) select 0;
					if !(isNil "_veh") then {
						[ _position, _veh ] spawn PO3_fnc_groupAttackPos;
						PO3_TOTAL_UNITS = PO3_TOTAL_UNITS + (units _veh);
						PO3_TOTAL_VEHICLES set [ count PO3_TOTAL_VEHICLES, vehicle (leader _veh) ];
					};
				};
			};
		};
	};

	_fired1 = false;
	_fired2 = false;

	waitUntil {
		sleep 1;

		if( { alive _x && damage _x < 1 } count _caches <= (count _caches)/2 && !_fired1 ) then {
			if( { alive _x && damage _x < 1 } count _caches > 0 ) then {
				[_position,(3*PO3_TASK__DIF)] spawn _spawnAmbush;
			};
			_fired1 = true;
		};

		if( { alive _x && damage _x < 1 } count _caches <= (count _caches)/3 && !_fired2 ) then {
			if( { alive _x && damage _x < 1 } count _caches > 0 ) then {
				[_position,(3*PO3_TASK__DIF)*2] spawn _spawnAmbush;
			};
			_fired2 = true;
		};

		{ alive _x && damage _x < 1 } count _caches == 0
	};

	sleep 1;
	[format["TASK%1",PO3_TASK__IDD],"succeeded"] call PO3_fnc_updateTask;

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