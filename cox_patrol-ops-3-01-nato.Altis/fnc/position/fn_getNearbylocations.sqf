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
private["_position","_types","_radius","_locations","_exit","_round"];

_locations = [];
_position = (_this select 0) call PO3_fnc_getPos;
_radius = if(count _this > 1) then { _this select 1 }else{ 1000 };
_types = if(count _this > 2) then { _this select 2 }else{ ["NameCityCapital","NameCity","NameVillage","NameLocal"] };

_exit = false;_round = 0;
While { count _locations == 0 && !_exit} do {
	if( _round < 100 ) then { _round = _round + 1 }else{ _exit = true };
	_locations = nearestLocations [_position,_types,_radius];
	_radius = _radius + 500;
};

_locations