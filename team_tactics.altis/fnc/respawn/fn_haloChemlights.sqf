private ["_chemlight","_unit","_light","_colour"];

 _unit = _this select 0;
_colour = if(count _this > 1) then { _this select 0 }else{ "None" };

_chemLight = switch (toLower _colour) do {
	case "green":	{ "Chemlight_green" };
	case "blue":	{ "Chemlight_blue" };
	case "yellow":	{ "Chemlight_yellow" };
	default			{ "Chemlight_red" };
};

_light = _chemLight createVehicle [0,0,0]; //create the chemlight

// FREEFALL
waitUntil {animationState _unit == "HaloFreeFall_non" || (getPos _unit select 2) < 1};
_light attachTo [_unit,[0,-0.07,0.06],"LeftShoulder"];

// PARACHUTE
waitUntil {animationState _unit == "para_pilot" || (getPos _unit select 2) < 1};
_light attachTo [vehicle _unit,[-0.13,-0.09,0.56],"LeftShoulder"];
_light setVectorDirAndUp [[0,0,1],[0,1,0]];

// LANDED
waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1};

detach _light;
deleteVehicle _light; //delete the chemlight
