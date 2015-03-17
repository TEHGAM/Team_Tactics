#define PO3_PROGBAR_BG (uiNamespace getVariable "PO3_ProgressBar_gui_bg")
#define PO3_PROGBAR_FG (uiNamespace getVariable "PO3_ProgressBar_gui_fg")
#define PO3_PROGBAR_TXT (uiNamespace getVariable "PO3_ProgressBar_gui_txt")

disableSerialization;

_display = uinamespace getvariable ["PO3_ProgressBar_gui",objNull];
if(isNull _display) then {
	if (isnil "PO3_hudtext_n") then { PO3_hudtext_n = 2733;};
	PO3_hudtext_n cutrsc ["PO3_ProgressBar","plain"];
	PO3_hudtext_n = PO3_hudtext_n + 1;
	_display = uinamespace getvariable ["PO3_ProgressBar_gui",objNull];
};

_title = if(count _this > 1) then { _this select 0 }else{ "Progress" };
_value = if(count _this > 1) then { _this select 1 }else{ _this select 0 };

_sitrepArray = toarray format[" .....%1",str(round(_value * 100))+"%"];
{_sitrepArray set [_foreachindex,tostring [_x]]} foreach _sitrepArray;
_sitrep = "";
_sitrepFormat = format["<t align='left' shadow='1'>%1%2</t>", _title,":%1"];

_pos = ctrlPosition PO3_PROGBAR_FG;
_maxWidth = ctrlPosition PO3_PROGBAR_BG select 2;
_newval = (_maxWidth * (_value call PO3_fnc_roundInterger)) max 0.02;
_pos set [2, _newval];

PO3_PROGBAR_BG ctrlSetFade 0.3;
PO3_PROGBAR_BG ctrlCommit 0;
PO3_PROGBAR_FG ctrlSetPosition _pos;
PO3_PROGBAR_FG ctrlSetFade 0.3;
PO3_PROGBAR_FG ctrlCommit 1;
PO3_PROGBAR_TXT ctrlSetFade 0.0;
PO3_PROGBAR_TXT ctrlCommit 0;

for "_i" from 0 to (count _sitrepArray - 1) do {
	_letter = _sitrepArray select _i;
	_delay = if ( _letter == "|" ) then { _letter = "<br />"; 1 } else { 0.01 };
	_sitrep = _sitrep + _letter;
	PO3_PROGBAR_TXT ctrlsetstructuredtext parsetext format [_sitrepFormat,_sitrep + "_"];
	sleep _delay;
};

if(isNil "PO3_progressBar_sleepTimer") then {
	PO3_progressBar_sleepTimer = 10;
	[] spawn {
		waitUntil{ sleep 1;
			PO3_progressBar_sleepTimer = PO3_progressBar_sleepTimer - 1;
			PO3_progressBar_sleepTimer <= 0
		};

		_pos = ctrlPosition PO3_PROGBAR_FG;
		_pos set [2,0.02];

		PO3_PROGBAR_BG ctrlSetFade 1;
		PO3_PROGBAR_BG ctrlCommit 1;
		PO3_PROGBAR_FG  ctrlSetFade 1;
		PO3_PROGBAR_FG  ctrlSetPosition _pos;
		PO3_PROGBAR_FG  ctrlCommit 1;
		PO3_PROGBAR_TXT ctrlSetFade 1;
		PO3_PROGBAR_TXT ctrlCommit 1;

		PO3_progressBar_sleepTimer = nil;
	};
};

PO3_progressBar_sleepTimer = 10;