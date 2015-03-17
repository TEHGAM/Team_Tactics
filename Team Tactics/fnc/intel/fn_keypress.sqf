/*
	Author: Eightysix

	Description:
		Not to be called directly.

*/
if(!PO3CLI) exitWith {};

private["_key"];

_key = _this select 1;
_handled = if (player getVariable ["PO3_var_unitIsUnconscious",false]) then {
	switch (true) do {
		case (_key IN [0x16]) : { call PO3_fnc_GUI_display; true};
		case (_key in [0x22]);
		case (_key in (actionkeys "ReloadMagazine"));
		case (_key in (actionkeys "Gear"));
		case (_key in (actionkeys "SwitchWeapon"));
		case (_key in (actionkeys "Diary")) : {true};
		default { false };
	};
}else{
	switch (true) do {
		case (_key IN [0x16]) : { call PO3_fnc_GUI_display; true};
		default { false };
	};
};

/*
	case 0x16;	// Key: U
	case 0xDB;	// Key: Left Windows
	case 0xDC;	// Key: Right Windows
	case 0xDD;	// Key: AppsMenu key
	case 0x37;	// Key: * on numeric keypad
*/

_handled