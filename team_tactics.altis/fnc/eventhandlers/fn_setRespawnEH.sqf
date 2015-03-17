/*
	Author: Eightysix

	Description:


	Syntax:

*/
player addEventHandler ["Respawn",{
	[] spawn {
		waitUntil {!(isNull player)};
		waitUntil {alive player};
		_leader = (group player) getVariable ["PO3_var_groupLeader",objNull];
		if !(isNull _leader) then {
			if(_leader != leader group player) then {
				[_leader,group player,true] spawn PO3_fnc_assignGroupLeader;
			};
		};
	};
}];

