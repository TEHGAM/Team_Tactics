// Written by Eightysix

if (!PO3SRV) exitWith {};

private["_data","_vehicle","_objdata","_pos","_dir","_class","_name","_countR","_timeD","_timeA","_limR","_dead","_destroyed","_empty","_abandoned","_isMHQ"];

if(isNil "PO3_param_removeVehicleWrecks") then { PO3_param_removeVehicleWrecks = true };

waitUntil {
	{
		_data = _x getVariable ["PO3_respawn",nil];

		if(!isNil "_data") then {

			_vehicle = _x;

			_objdata = _vehicle getVariable ["PO3_object_data",nil];

			_pos	= if(!isNil "_objdata") then { _objdata select 0 }else{ _vehicle call PO3_fnc_getPos };
			_dir	= if(!isNil "_objdata") then { _objdata select 1 }else{ direction _vehicle };
			_class	= if(!isNil "_objdata") then { _objdata select 2 }else{ typeOf _vehicle };
			_name	= if(!isNil "_objdata") then { _objdata select 3 }else{ vehicleVarName _vehicle };
			_dead	= if(!isNil "_objdata") then { _objdata select 4 }else{ time };
			_empty	= if(!isNil "_objdata") then { _objdata select 5 }else{ time };
			_countR	= if(!isNil "_objdata") then { _objdata select 6 }else{ 0 };
			_timeD	= if( count _data > 0 ) then { _data select 0 }else{ 600 };
			_timeA	= if( count _data > 1 ) then { _data select 1 }else{ 600 };
			_limR	= if( count _data > 2 ) then { _data select 2 }else{ -1  };

			// Check if Vehicle Destroyed
			_dead = if( !(canMove _vehicle) || !(_vehicle getVariable ["ace_canmove", true]) || damage _vehicle == 1 ) then { _dead }else{ time };
			_destroyed = if( time - _dead > _timeD ) then { true }else{ false };

			// Check if Vehicle Abandoned
			_empty = if( {alive _vehicle} count (crew _vehicle) == 0 && _pos distance (_vehicle call PO3_fnc_getPos) > 10 ) then { _empty }else{ time };
			_abandoned = if( time - _empty > _timeA ) then { true }else{ false };

			// Get PO3 Variables
			_isMHQ = _vehicle getVariable ["PO3_mhq",nil];
			_isLCH = _vehicle getVariable ["PO3_liftchopper",nil];
			_isLFT = _vehicle getVariable ["PO3_liftable",nil];
			_isRSP = _vehicle getVariable ["PO3_resupply",nil];

			// MHQ can not be abandoned
			if(!isNil "_isMHQ") then { _abandoned = false };

			if(_destroyed || _abandoned) then {
				_vehicle setVariable ["PO3_respawn",nil,false];
				_vehicle setVariable ["PO3_object_data",nil,false];

				if(PO3_param_removeVehicleWrecks) then { deleteVehicle _vehicle; sleep 5; };

				_vehicle = nil;

				if( _countR < _limR || _limR < 0 ) then {

					_countR	= _countR + 1;

					_vehicle = createVehicle [_class, _pos, [], 0, "CAN_COLLIDE"];
					_vehicle setDir _dir;

					if(!isNil "_isMHQ") then { _vehicle setVariable ["PO3_mhq",_isMHQ,true] };
					if(!isNil "_isLCH") then { _vehicle setVariable ["PO3_liftchopper",_isLCH,true] };
					if(!isNil "_isLFT") then { _vehicle setVariable ["PO3_liftable",_isLFT,true] };
					if(!isNil "_isRSP") then { _vehicle setVariable ["PO3_resupply",_isRSP,true] };
				};
			};

			if(!isNil "_vehicle") then {
				_vehicle setVariable ["PO3_respawn",[_timeD,_timeA,_limR],false];
				_vehicle setVariable ["PO3_object_data",[_pos,_dir,_class,_name,_dead,_empty,_countR],false];
			};
		};
	}forEach vehicles;

	sleep 30;

	false;
};