if(PO3_mod_STHud_enabled && isMultiplayer) exitWith {};

private ["_unit"];

if (leader(player) == player) then {
	{
		_unit = _x;
		if ( assignedTeam(_unit) != (_unit getVariable ["ST_STHud_assignedTeam", "MAIN"]) ) then {
			_unit setVariable ["ST_STHud_assignedTeam", assignedTeam(_unit), true];
		};
	} forEach(units(player));
};

while {true} do {
	waitUntil {sleep 2; leader(player) == player};

	{
		private "_unit";
		_unit = _x;
		_unit assignTeam (_unit getVariable ["ST_STHud_assignedTeam", "MAIN"]);
	} forEach(units(player));

	while {leader(player) == player} do {
		{
			private "_unit";
			_unit = _x;

			if( assignedTeam(_unit) != (_unit getVariable ["ST_STHud_assignedTeam", "MAIN"]) ) then {
				_unit setVariable ["ST_STHud_assignedTeam", assignedTeam(_unit), true];
			};
		} forEach (units player);
		sleep 5;
	};
};