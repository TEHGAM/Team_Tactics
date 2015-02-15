PO3_VAR_w2s_array = [];
PO3_VAR_w2s_data = [];

PO3_fnc_getZoom = {[0.5,0.5] distance (worldToScreen (positionCameraToWorld [1,0.484,1]))}; // <!-- KillZoneKid ;)

[] spawn PO3_fnc_hud_assignedTeamWatcher;

[] spawn {
	waitUntil{
		sleep 1;
		waitUntil{alive player};
		{
			private["_pos","_pos2D","_distance","_divsor","_alpha","_display","_colour","_text"];

			_alpha = 1;
			_colour = [1,0.2,0.2,0.8];
			_pos = visiblePosition _x;
			_distance = round(player distance _pos);
			if !(_x getVariable ["tcb_ais_agony",false]) then {
				_pos2D = worldtoscreen _pos;
				_divsor = switch (true) do {
					case ( vehicle player isKindof "Air" ) : { 30 };
					case ( vehicle player isKindof "LandVehicle" ) : { 20 };
					default { 15 };
				};
				_alpha = (0 max (1 - log(_distance/_divsor) ) ) min 1;
				_colour = if(_x IN (units group player) ) then { _x call PO3_fnc_hud_getTeamColour }else{ [0.6784,0.7490,0.5137,1] };
				_colour set [3,_alpha];
			};

			_display = false;
			if( [player] call PO3_fnc_hasARgear || !(PO3_param_hud_requireGlasses) ) then {
				if( _alpha > 0 ) then{
					if !( vehicle _x != _x && driver (vehicle _x ) != _x ) then { _display = true };
				};
			};

			_text = switch (true) do {
				case (format["%1", name _x] == "" || format["%1", name _x] == "Error: No unit") : {"Unit KIA"};
				case ([] call PO3_fnc_getZoom > 2 && _distance > 8 ) : { format ["%1 %2 - %3m", toupper localize format ["STR_SHORT_%1",rank _x],toupper (name _x),_distance] };
				case (_distance <= 8) : { format ["%1 %2", toupper localize format ["STR_SHORT_%1",rank _x],toupper (name _x)] };
				default {""};
			};

			_x setVariable ["PO3_squad3DAR_data",[_display,_x call PO3_fnc_hud_getUnitIcon,_colour,([player, _x] call BIS_fnc_dirTo) - direction _x,_text],false];
		}forEach (playableUnits + switchableUnits + (units group player));
		false
	};
};

addMissionEventHandler ["Draw3D", {
	private["_data","_pos"];
	if(PO3_hud_worldtoscreen_display) then {
		{
			_data = _x getVariable ["PO3_squad3DAR_data",[false]];
			if(_data select 0) then {
				_pos = ASLtoATL(visiblePositionASL(vehicle(_x)));
				_height_adjust = 0.5;
				if ((vehicle _x) isKindof "CaManBase") then {
					_height_adjust = _height_adjust + (_x selectionPosition "head" select 2);
				}else{
					_height_adjust = _height_adjust + 2.7;
				};
				_pos set [2, (_pos select 2) + _height_adjust];
				[
					_data select 1,
					_data select 2,
					_pos,
					0.6,0.6,
					_data select 3,
					_data select 4
				] call PO3_fnc_drawIcon3D;
			};
		}forEach (playableUnits + switchableUnits + (units group player) - [player]);
	};

	{
		if(count _x == 2) then {
			_point1 = (_x select 0) call PO3_fnc_getPos;
			_point2 = (_x select 1) call PO3_fnc_getPos;
			drawLine3D [_point1, _point2, [0,0,0,1] ];
			drawLine3D [_point1, _point2, [0,0,0,1] ];
			drawLine3D [_point1, _point2, [0,0,0,1] ];
		};
	}forEach PO3_logistics_liftCables;
}];

addMissionEventHandler ["Draw3D", {
	if(PO3_hud_cursortoscreen_display) then {
		{
			if(_forEachIndex > 11) exitWith {};
			if(_x IN (playableUnits + switchableUnits) && _x != player && !PO3_hud_worldtoscreen_display) then {
				_pos = visiblePosition _x;
				_pos set [2,(_pos select 2) + 1.2];
				_alpha = (0 max (1 - log((round(player distance _pos))/2) ) ) min 1;
				[
					"",
					[1,1,1,if(_x == cursorTarget) then {1}else{_alpha}],
					_pos,
					0,0,
					0,
					format ["                                        %1 %2", toupper localize format ["STR_SHORT_%1",rank _x],toupper (name _x)],
					(0.04*(_alpha*3) min 0.04)
				] call PO3_fnc_drawIcon3D;
			};
		}forEach nearestObjects [player,["CaManBase"],20];
	};
}];