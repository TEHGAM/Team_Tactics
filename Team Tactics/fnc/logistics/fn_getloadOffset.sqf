private["_loader","_object","_dimension_max"];

_loader = _this select 0;
_object = _this select 1;

_varY = 0;
switch (true) do {
	case (_loader isKindOf "Truck_01_base_F") : {
		switch (true) do {
			case (_object isKindOf "Cargo_base_F") : { _varY = 0.8 };
			default { _varY = 0 };
		};
	};
	case (_loader isKindOf "Truck_02_base_F") : {
		switch (true) do {
			case (_object isKindOf "APC_Tracked_02_base_F") : { _varY = 0 };
			default { _varY = 1.4 };
		};
	};
	case (_object isKindof "B_supplyCrate_F") : { _varZ = -20; };
	default { _varY = 0 };
};

_varZ = 0;
switch (true) do {
	case (_object isKindof "B_supplyCrate_F") : { _varZ = -11.8; };
	default { _varZ = 0 };
};

_Size = _object call PO3_fnc_boundingBoxLWH;
_length = (_Size select 0);
_height = (_Size select 2);
_offset = [0,(_length/2*(-1))+(_varY),(_height/2)-0.7+(_varZ)];
//hintc format["[0,(%1/2*(-1))+(%3),(%2/2)-0.7+(%5)]\n\nSize: %6\n Offset: %4",_length,_height,_varY,_offset,_varZ,_Size];

_offset;