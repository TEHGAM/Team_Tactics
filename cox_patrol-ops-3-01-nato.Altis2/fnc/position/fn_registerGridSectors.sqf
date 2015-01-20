private["_sectorWidth","_worldSize","_sectors","_sector","_pos","_posNW","_posNE","_posSW","_posSE"];

_sectorWidth = 1000;

_worldSize = [] call PO3_fnc_worldsize;
_pos = [_sectorWidth/2,_sectorWidth/2];

_sectors = [];
for "_gridY" from (_sectorWidth/2) to _worldSize step (_sectorWidth) do {
	_pos = [_sectorWidth/2,_gridY];
	for "_gridX" from (_sectorWidth/2) to _worldSize step (_sectorWidth) do {
		_pos = [_gridX,(_pos select 1)];
		_posNW = [(_pos select 0) - (_sectorWidth/2),(_pos select 1) + (_sectorWidth/2)];
		_posNE = [(_pos select 0) + (_sectorWidth/2),(_pos select 1) + (_sectorWidth/2)];
		_posSW = [(_pos select 0) - (_sectorWidth/2),(_pos select 1) - (_sectorWidth/2)];
		_posSE = [(_pos select 0) + (_sectorWidth/2),(_pos select 1) - (_sectorWidth/2)];
		if( {!(surfaceIsWater _x)} count [_posNW,_posNE,_posSW,_posSE] >= 2 ) then {
			_sector = createMarker [format["PO3_GRID_%1%2",_gridX,_gridY],_pos];
			_sector setMarkerShape "RECTANGLE";
			_sector setMarkerBrush "SolidBorder";
			_sector setMarkerColor "ColorBlack";
			_sector setMarkerSize [_sectorWidth/2.1,_sectorWidth/2.1];
			_sector setMarkerAlpha 0.3;

			// Register Military Buildings in Sector
			_reg_Mil = [];
			{
				if([position _x,[_posSW,_posSE,_posNE,_posNW]] call PO3_fnc_isInRectangle) then {
					_reg_Mil set [count _reg_Mil,_x];
					_marker = createMarker [format["PO3_OBJ_%1",_x],position _x];
					_marker setMarkerShape "ICON";
					_marker setMarkerType "mil_dot";
					_marker setmarkercolor "ColorRed";
					_marker setmarkersize [0.5,0.5];
					_marker setMarkerAlpha 0.3;
				};
			}forEach (nearestObjects [_pos,["Cargo_HQ_base_F","Cargo_House_base_F","Cargo_Tower_base_F","Cargo_Patrol_base_F"],_sectorWidth]);

			// Register Shed Buildings in Sector
			_reg_build = [];
			{
				if([position _x,[_posSW,_posSE,_posNE,_posNW]] call PO3_fnc_isInRectangle) then {
					_reg_build set [count _reg_build,_x];
					_marker = createMarker [format["PO3_OBJ_%1",_x],position _x];
					_marker setMarkerShape "ICON";
					_marker setMarkerType "mil_dot";
					_marker setmarkercolor "ColorGreen";
					_marker setmarkersize [0.5,0.5];
					_marker setMarkerAlpha 0.3;
				};
			}forEach (nearestObjects [_pos,["Land_i_Shed_Ind_F"],_sectorWidth]);

			_sectors set [count _sectors,([_sector,format["PO3_GRID_%1%2",_gridX,_gridY],_pos,[_posSW,_posSE,_posNE,_posNW],_sectorWidth])];
		};
	};
};

_sectors spawn {
	waitUntil {
		for "_i" from 1 to (count _this) do {
			_sector = _this select (_i - 1);
			if( { [position _x,_sector select 3] call PO3_fnc_isInRectangle } count allUnits > 0 ) then {
				(_sector select 0) setMarkerColor "ColorGreen";
			}else{
				(_sector select 0) setMarkerColor "ColorBlack";
			};
		};
		sleep 1; false;
	};
};

_sectors;