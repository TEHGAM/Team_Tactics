private["_pos","_mkr","_set"];

if(isNil "PO3_grpmark_UAVList") then { PO3_grpmark_UAVList = [] };

{
	_set = false;
	_operator = (uavControl _x) select 0;

	if( (side _operator) getFriend PlayerSide > 0.6 ) then { _set = true };
	if( side(group _x) getFriend PlayerSide > 0.6 ) then { _set = true };

	if( _set && alive _x && !(_x IN PO3_grpmark_UAVList) ) then {
		_pos = getPos _x;
		_mkr = createMarkerLocal [ format["mark_UAV_%1",_x], _pos];
		_mkr setMarkerShapeLocal "ICON";
		_mkr setMarkerTypeLocal (_x call PO3_fnc_getObjectMarkerType);
		_mkr setMarkerColorLocal (_x call PO3_fnc_getUnitMarkerColour);

		PO3_grpmark_UAVList set [count PO3_grpmark_UAVList, _x];
	};

	if(!_set && _x IN PO3_grpmark_UAVList) then {
		deleteMarker format["mark_UAV_%1",_x];
		PO3_grpmark_UAVList = PO3_grpmark_UAVList - [_x];
	};
}forEach allUnitsUav;

PO3_grpmark_UAVList;