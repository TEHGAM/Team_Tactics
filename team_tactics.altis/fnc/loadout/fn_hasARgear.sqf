private["_unit","_hasARGear"];

_unit = _this select 0;

_hasARGear = false;

if(
	   (goggles player) IN ["G_Tactical_Black","G_Tactical_Clear"]
	|| (headgear player) IN [
		"H_HelmetCrew_B","H_HelmetCrew_I","H_HelmetCrew_O",
		"H_CrewHelmetHeli_B","H_CrewHelmetHeli_I","H_CrewHelmetHeli_O",
		"H_PilotHelmetFighter_B","H_PilotHelmetFighter_I","H_PilotHelmetFighter_O",
		"H_PilotHelmetHeli_B","H_PilotHelmetHeli_I","H_PilotHelmetHeli_O",
		"H_HelmetSpecO_blk","H_HelmetSpecO_ocamo","H_HelmetLeaderO_ocamo","H_HelmetLeaderO_oucamo","H_HelmetO_ocamo","H_HelmetO_oucamo"
	]
) then {
	_hasARGear = true;
};

_hasARGear