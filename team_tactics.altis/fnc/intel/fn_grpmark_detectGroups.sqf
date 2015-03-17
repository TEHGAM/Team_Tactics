private["_iconID","_iconSize","_groupUniqueID","_groupIcons","_displayAlive","_displayFriend","_displayHidden"];

if(isnil "PO3_grpmark_groupList") then { PO3_grpmark_groupList = [] };

{
	if ( !(_x IN PO3_grpmark_groupList) && {_x IN (playableUnits+switchableUnits) || PO3_debug } count (units _x) > 0) then {
		_iconID = _x addGroupIcon  [(_x call PO3_fnc_getObjectMarkerType),[0,0]];
		_iconSize = _x addGroupIcon  [(_x call PO3_fnc_getGroupSizeMarkerType),[0,0]];
		_groupUniqueID = _x setVariable ["PO3_groupIconID",[_iconID,_iconSize],false];
		PO3_grpmark_groupList set [count PO3_grpmark_groupList, _x];
	};

	if(_x IN PO3_grpmark_groupList) then {
		_groupIcons = _x getVariable ["PO3_groupIconID",nil];
		if !(isNil "_groupIcons") then {
			_displayAlive = if( {alive _x} count (units _x) > 0 ) then { true }else{ false };
			_displayFriend = if( (side _x) getFriend PlayerSide > 0.6 ) then { true }else{ false };
			_displayHidden = if !((leader _x) getVariable ["PO3_hideGroup",false]) then { true }else{ false };

			_x setGroupIcon [(_groupIcons select 0),(_x call PO3_fnc_getObjectMarkerType)];
			_x setGroupIcon [(_groupIcons select 1),(_x call PO3_fnc_getGroupSizeMarkerType)];
			_x setGroupIconParams [(_x call PO3_fnc_getGroupColour),(_x call PO3_fnc_getGroupName),1,if(_displayAlive && _displayFriend && _displayHidden) then { true }else{ false }];
		};
	};
}forEach allgroups;

PO3_grpmark_groupList;