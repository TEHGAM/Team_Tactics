private ["_object","_cond","_factions","_return"];

_object = _this select 0;
_cond = _this select 1;

if (isNil "_cond") exitWith { false };

_factions = [
	"USMC","CDF","RU","INS","GUE","CIV","CIV_RU","BIS_US","BIS_CZ","BIS_GER","BIS_TK",
	"BIS_TK_INS","BIS_TK_GUE","BIS_UN","BIS_TK_CIV","BIS_CIV_special","BIS_BAF","PMC_BAF",
	"BLU_F","OPF_F","IND_F","IND_G_F","CIV_F"
];

_return = switch (typename _cond) do {
	case "ARRAY" : { _object IN _cond };
	case "BOOL" : { _cond };
	case "GROUP" : { (_object in (units _cond)) };
	case "LOCATION" : { _object distance _cond <= ((size _cond select 0)+(size _cond select 1))/2 };
	case "OBJECT" : { _object == _cond };
	case "SIDE" : { (side _object == _cond) };
	case "STRING" : {
		if (_cond in _factions) then {
			(faction _object == _cond)
		} else {
			(call compile format ["%1",_cond])
		};
	};
	default { false };
};

_return;
