private["_index"];

_index = _this select 0;

if (_index in (actionkeys 'nightvision') || _key < 0) then {
	if(isNil "PO3_VAR_camVision_index") then { PO3_VAR_camVision_index = 0 };
	PO3_VAR_camVision_index = PO3_VAR_camVision_index + 1;
	_vision = PO3_VAR_camVision_index % 9;
	switch (_vision) do {
		case 0: {
			camusenvg false;
			call compile 'false SetCamUseTi 0';
		};
		case 1: {
			camusenvg true;
			call compile 'false SetCamUseTi 0';
		};
		case 2: {
			camusenvg false;
			call compile 'true SetCamUseTi 0';
		};
		case 3: {
			camusenvg false;
			call compile 'true SetCamUseTi 1';
		};
		case 4: {
			camusenvg false;
			call compile 'true SetCamUseTi 2';
		};
		case 5: {
			camusenvg false;
			call compile 'true SetCamUseTi 3';
		};
		case 6: {
			camusenvg false;
			call compile 'true SetCamUseTi 4';
		};
		case 7: {
			camusenvg false;
			call compile 'true SetCamUseTi 5';
		};
		case 8: {
			camusenvg false;
			call compile 'true SetCamUseTi 6';
		};
		case 9: {
			camusenvg false;
			call compile 'true SetCamUseTi 7';
		};
	};
};