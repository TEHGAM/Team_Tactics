PO3_fnc_animalSpawner = {
	if !(PO3SRV) exitWith {};

		private["_site","_animalList","_genDist","_sitePos","_active","_animalCount","_radius","_siteAnimals","_dist","_checkDist","_animal","_unit","_group","_pos"];

	_site = _this select 0;
	_animalList = _this select 1;
	_genDist = _this select 2;		//creation distance

	_sitePos = getPos _site;
	_active = false;
	_animalCount = 3 + (round random 5);
	_radius = 5 + (round random 10);

	_siteAnimals = [];
	waitUntil {
		_dist = 10000;
		{
			if (isPlayer _x) then {
				_checkDist = (_x distance _site) - _radius;
				if (_dist > _checkDist) then {_dist = _checkDist};
			};
		} forEach allUnits;

		if !(_active) then {
			if (_dist < _genDist) then {
				_count = round ((_animalCount - (_animalCount/5) + (random (_animalCount/2.5))));
				_i = 0;
				while {_i < _animalCount} do {
					_animal = _animalList select (round ((random ((count _animalList) - 0.01)) - 0.499));
					_group = createGroup Civilian;
					_pos = [((_sitePos select 0) - _radius + random (_radius * 2)), ((_sitePos select 1) - _radius + random (_radius * 2)), 0];
					_unit = createAgent [_animal,_pos,[],0,"NONE"];
					_unit setVariable ["inSite",_site];
					_unit setDir (random 360);
					_siteAnimals = _siteAnimals + [_unit];
					_i = _i + 1;
					sleep 0.05
				};
				_active = true
			}
		} else {
			if (_dist > (_genDist + _genDist/10)) then {
				{_grp = group _x; deleteVehicle _x; deleteGroup _grp; } forEach _siteAnimals;
				_siteAnimals = [];
				_active = false;
			}
		};
		sleep (2.5 + random 1);
		false;
	};
};

// Dogs Nearby Houses

	_animalList = ["Fin_random_F","Alsatian_random_F"];
	[_position,_animalList,_radius] call PO3_fnc_animalSpawner;

// Goats n Fields

	_animalList = ["Goat_random_F"];
	[_position,_animalList,_radius] call PO3_fnc_animalSpawner;

// Chickens near farms

	_animalList = ["Hen_random_F","Hen_random_F","Hen_random_F"]; //todo: add rooster
	[_position,_animalList,_radius] call PO3_fnc_animalSpawner;

// Sheep near farms

	_animalList = ["Sheep_random_F"];
	[_position,_animalList,_radius] call PO3_fnc_animalSpawner;

