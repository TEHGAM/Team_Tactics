/*
	Author: Eightysix

	Description:
	Returns marker type of the size of the group.

	Syntax:
	_colour = (unit/group) call PO3_fnc_getGroupSizeMarkerType;

	Example:
	_colour = (player) call PO3_fnc_getGroupSizeMarkerType;
	_colour = (group player) call PO3_fnc_getGroupSizeMarkerType;
*/
private["_count","_value","_size"];

_count = { alive _x } count (units _this);

_size = switch (true) do {
//	case (_count > 120000) : { "group_11" };	// Army		Group 120k+
//	case (_count > 100000) : { "group_10" };	// Army		100k
//	case (_count > 30000) : { "group_9" };		// Corps	30k-60k
//	case (_count > 10000) : { "group_8" };		// Division	10k-20k
//	case (_count > 2000) : { "group_7" };		// Brigade	2k-10k
//	case (_count > 500) : { "group_6" };		// Regiment	500-2k
//	case (_count > 300) : { "group_5" };		// Battalion	300-1k
	case (_count > 60) : { "group_4" };		// Company	60-250
	case (_count > 10) : { "group_3" };		// Platoon	20-60
	case (_count > 5) : { "group_2" };		// Section	5-20
	case (_count > 3) : { "group_1" };		// Patrol	3-5
	default { "group_0" };				// FireTeam	0-2
};

_size;