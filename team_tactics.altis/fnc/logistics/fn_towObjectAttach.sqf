private["_towVeh","_object","_dimension_max"];

_towVeh = _this select 0;
_object = _this select 1;

_loadable = ["Towable",_object,_towVeh] call PO3_fnc_logisticsCheck;
if !(_loadable) exitWith { [true,"HINT",format[ localize "STR_PO3_LOGIST_TOOHEAVY",[_object] call PO3_fnc_getCfgText,[_towVeh] call PO3_fnc_getCfgText] ] call PO3_fnc_hint; false };

//Make Vehicle Local
if!(local _object) then {
	_local = [_object, player] call PO3_fnc_requestOwnership;
	if(!_local) then { [true,"HINT","Warning: Unable to assign locality to you!"] call PO3_fnc_hint };
};

_towVehSize = _towVeh call PO3_fnc_boundingBoxLWH;
_objectSize = _object call PO3_fnc_boundingBoxLWH;

_towVehL = (_towVehSize select 0) max (_towVehSize select 1);
_towVehH = (_towVehSize select 2);
_objectL = (_towVehSize select 0) max (_towVehSize select 1);
_objectH = (_objectSize select 2);

_OffsetZ = _objectH - _towVehH;
_offsetT = [0,(_towVehL/2*(-1)),0];
_offsetO = [0,(_objectL/2*(-1)),_OffsetZ];

_towAxis = "Sign_Sphere25cm_F" createvehicle (position _towVeh);
_towAxis attachto [_towVeh,_offsetT];
_objAxis = "Sign_Sphere25cm_F" createvehicle (position _towVeh);
_objAxis attachto [_towAxis,_offsetO];
_object attachto [_objAxis,[0,0,0]];

_objWheel = "Sign_Sphere25cm_F" createvehicle (position _towVeh);
_objWheel setPosATL (_object modelToWorld _offsetO);

_towVeh setVariable ["PO3_isTowingObj",_object,false];
_object setVariable ["PO3_isTowingObj",_towVeh,false];
_action = _towVeh addAction [ format["<t color='#ffc600'>Unhook %1</t>",[_object] call PO3_fnc_getCfgText],{ [(vehicle player)] spawn PO3_fnc_towObjectRelease; },[],100,false,true,"","!isNull (_target getVariable [""PO3_isTowingObj"",objNull]) && speed _target < 1"];

if !(PO3_debug) then {
	hideObject _towAxis;
	hideObject _objAxis;
	hideObject _objWheel;
};

[_towVeh,_object] spawn PO3_fnc_towRope;

_objAxisPos = position _objWheel;
while {
	alive _towVeh &&
	alive _object &&
	([_towVeh,_object] call PO3_fnc_isTowed) &&
	{alive _x} count (crew _object) == 0
}do{
	if(abs (speed _towVeh) > 0) then {
		_towAxisPos = position _towAxis;
		_dx_axis = (_towAxisPos select 0) - (_objAxisPos select 0);
		_dy_axis = (_towAxisPos select 1) - (_objAxisPos select 1);
		_d_axis = sqrt(_dx_axis^2 + _dy_axis^2);

		if(_d_axis > 0.05) then {
			_dirdeg = ([_towAxis,_objWheel] call BIS_fnc_dirTo);
			_directionDiff = (180 + _dirdeg) - (direction _towVeh);
		//	_towAxis setdir (_directionDiff*(10/( abs(speed _towVeh) max 10)));

			if (PO3_debug) then {
hintsilent format["
daxis: %1\n
dxy: %2\n
directionDiff: %3\n
d_axis: %4\n
dirdeg: %5\n
speed _towVeh: %6\n
speed P: %7\n
pitchbank: %8\n",

_d_axis,
(_directionDiff*(1/speed _towVeh)),
_directionDiff,
[_dx_axis,_dy_axis],
_dirdeg,
abs(speed _towVeh),
abs(speed _object),
(_directionDiff*(10/(speed _towVeh max 10)))
];
			};
		};
	};
	_objWheel setPosATL (_object modelToWorld _offsetO);
	_objAxisPos = position _objWheel;
	sleep 0.01;
};

_towVeh removeaction _action;

deletevehicle _towAxis;
deletevehicle _objAxis;
deletevehicle _objWheel;

/*
_towAxis_offset = (_towVeh getvariable ["dll_tow_back_axis_offset",[0,-6]]) + [0];
_objAxis_offset = (_object getvariable ["dll_tow_front_axis_offset",[0,5]]) + [0];
_objWheel_offset = (_object getvariable ["dll_tow_wheel_offset",[0,0]]) + [0];
_towfromrear = ((_objAxis_offset select 1) < 0);
_static = false;
_towImpVelocity = false;

}do{
	//get global coordinates
	_aTpos = _towVeh modelToWorld _offsetT;
	_aPpos = _towAxis modelToWorld [0,0,_OffsetZ];
	_wheelPpos = (_objWheel) call PO3_fnc_getPos;

	//get the x and y length of the difference vector
	_dx_axis = (_aTpos select 0) - (_aPpos select 0);
	_dy_axis = (_aTpos select 1) - (_aPpos select 1);
	_d_axis = sqrt(_dx_axis^2 + _dy_axis^2); //absolute length of diff vector

	if(_d_axis > 0.05) then {
		//get global distance between the T axis and P wheelpos
		_dx = (_aTpos select 0) - (_wheelPpos select 0);
		_dy = (_aTpos select 1) - (_wheelPpos select 1);
		_dirdeg = _dx atan2 _dy;//convert to direction in deg
		if(_towfromrear) then { _dirdeg = _dirdeg + 180 };

		//set the direction of P, preserving pitch and bank
		_object_pb = _object call BIS_fnc_getpitchbank;
		_object setdir _dirdeg;
		[_object, _object_pb select 0, _object_pb select 1] call BIS_fnc_setpitchbank;

		if (_static) then {
			//setpos implementation (safe but ugly)
			_xP = (_aTpos select 0) - ((_objAxis_offset select 1)*sin _dirdeg);
			_yP = (_aTpos select 1) - ((_objAxis_offset select 1)*cos _dirdeg);
			_object setpos [_xP, _yP, 0];
		}else{
			if(_towImpVelocity) then { //velocity implementation (smoother but elastic)
				_dirdeg_axis = _dx_axis atan2 _dy_axis;	//get the direction of the difference vector
				_speed = _d_axis*8;		//control the speed needed to make this distance smaller TWEAK HERE	Higher value means less elasticty, but more choppy.
				_speed = _speed min 50;		//set max speed for safety.
				_object_vel = velocity _object;
				_object setVelocity [(sin _dirdeg_axis*_speed),(cos _dirdeg_axis*_speed),(_object_vel select 2)-0.3]; //set the velocity in the correct direction
			}else{ //acceleration implementation doesnt work verry well with "trains"
				_Tvel = velocity _towVeh;
				_object_dir = vectordir _object;
				_dot =  [_object_dir, _Tvel] call BIS_fnc_dotProduct;
				_newvel = [_object_dir, _dot] call BIS_fnc_vectorMultiply;
				_dirdeg_axis = _dx_axis atan2 _dy_axis;	//get the direction of the difference vector
				_acc = _d_axis*5; //control the acc to make this distance smaller TWEAK HERE
				_acc = _acc min 5; //set max acc for safety.
				_object_vel = velocity _object;
				_object setVelocity [(_newvel select 0)+(sin _dirdeg_axis*_acc),(_newvel select 1)+(cos _dirdeg_axis*_acc),(_object_vel select 2)-0.1]; //set the velocity in the correct direction
			};
		};
		if (PO3_debug) then {
	//		hintsilent format["dx: %1\ndy: %2\ndirdeg: %3\nd_axis: %4\ndirdeg: %5\n_speed: %6\nspeed P: %7\nspeed T: %8\npitch: %9\nbank: %10\n",_dx,_dy,_dirdeg,_d_axis,_dirdeg,speed _towVeh,(speed _object)/3.6,speed _towVeh,_object_pb select 0,_object_pb select 1];
		};
	};

	sleep 0.01;
};*/