/*
	Author: Eightysix

	Description:
	Do Not Call Directly

	ArmA 2: CfgLocationTypes @ https://community.bistudio.com/wiki/ArmA_2:_CfgLocationTypes
	Strategic		StrongpointArea 	FlatArea 		FlatAreaCity
	FlatAreaCitySmall 	CityCenter 		Airport 		NameMarine
	NameCityCapital 	NameCity 		NameVillage 		NameLocal
	Hill 			ViewPoint 		RockArea 		BorderCrossing
	VegetationBroadleaf 	VegetationFir 		VegetationPalm 		VegetationVineyard
*/
private["_position","_types","_radius","_locations","_location"];

_locations = [];

_position	= (_this select 0) call PO3_fnc_getPos;
_types		= if(count _this > 1) then { _this select 1 }else{ ["NameCityCapital","NameCity","NameVillage","NameLocal"] };
_radius		= 100;

While { count _locations == 0 } do {
	_locations = nearestLocations [_position,_types,_radius];
	_radius = _radius + 100;
};

_location = _locations select 0;

_location