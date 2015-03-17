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

_towVeh setVariable ["PO3_isTowingObj",_object,false];
_object setVariable ["PO3_isTowingObj",_towVeh,false];

_action = _towVeh addAction [ format["<t color='#ffc600'>Detach %1</t>",[_object] call PO3_fnc_getCfgText],{ [(vehicle player)] spawn PO3_fnc_towObjectRelease; },[],100,false,true,"","!isNull (_target getVariable [""PO3_isTowingObj"",objNull]) && speed _target < 1"];

_towAxis_offset = (_towVeh getvariable ["dll_tow_back_axis_offset",[0,-6]]) + [0];
_objAxis_offset = (_object getvariable ["dll_tow_front_axis_offset",[0,5]]) + [0];
_objWheel_offset = (_object getvariable ["dll_tow_wheel_offset",[0,0]]) + [0];
_towfromrear = ((_objAxis_offset select 1) < 0);
_static = false;
_towImpVelocity = false;

_towAxis = objNull;
_objAxis = objNull;
_objWheel = objNull;
if(PO3_debug) then {
	_axisclass = "Sign_Sphere25cm_F";
	_towAxis = _axisclass createvehicle (position _towVeh);
	_objAxis = _axisclass createvehicle (position _towVeh);
	_objWheel = _axisclass createvehicle (position _towVeh);
	_towAxis attachto [_towVeh,[_towAxis_offset select 0, _towAxis_offset select 1, 1]];
	_objAxis attachto [_object,[_objAxis_offset select 0, _objAxis_offset select 1, 1.5]];
	_objWheel attachto [_object,[_objWheel_offset select 0, _objWheel_offset select 1, 3]];

//	titletext [format["%1 (%2) attached", [_object] call PO3_fnc_getCfgText, typeof(_object)], "PLAIN DOWN"];
};

[_towVeh,_object] spawn PO3_fnc_towRope;

while {
	alive _towVeh &&
	alive _object &&
	([_towVeh,_object] call PO3_fnc_isTowed) &&
	{alive _x} count (crew _object) == 0
}do{
	//get global coordinates
	_aTpos = _towVeh modelToWorld _towAxis_offset;
	_aPpos = _object modelToWorld _objAxis_offset;
	_wheelPpos = _object modelToWorld _objWheel_offset;

	//get the x and y length of the difference vector
	_dx_axis = (_aTpos select 0) - (_aPpos select 0);
	_dy_axis = (_aTpos select 1) - (_aPpos select 1);
	_d_axis = sqrt(_dx_axis^2 + _dy_axis^2);//absolute length of diff vector

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
};

_towVeh removeaction _action;

if (PO3_debug) then {
	deletevehicle _towAxis;
	deletevehicle _objAxis;
	deletevehicle _objWheel;
};