/*
	Author: Eightysix

	Description:
	Returns Marker Type of the type vehicle the unit or group is operating.

	Syntax:
	_Type = (unit/group/vehicle) call PO3_fnc_getObjectMarkerType;

	Example:
	_Type = (player) call PO3_fnc_getObjectMarkerType;
	_Type = (vehicle player) call PO3_fnc_getObjectMarkerType;
*/
private["_object","_prefix","_type"];

_object = switch (typename _this) do {
	case "ARRAY"	: { [_this select 0,_this select 1] };
	case "GROUP"	: { [vehicle (leader _this),side _this] };
	case "OBJECT"	: { [vehicle _this,side _this] };
	default { [_this,civilian] };
};

_prefix = switch (_object select 1) do {
	case east : { "o" };
	case west : { "b" };
	case resistance : { "n" };
	default { "n" };
};

_type = switch (true) do {
// MAN
	case ((_object select 0) isKindof "CaManBase")		: { format["%1_inf",_prefix] };
// LAND
			case ((_object select 0) isKindof "UGV_01_base_F")			: { format["%1_uav",_prefix] };
			case ((_object select 0) isKindof "Quadbike_01_base_F")			: { format["%1_unknown",_prefix] };
			case ((_object select 0) isKindof "Truck_F")			: { format["%1_motor_inf",_prefix] };
			case ((_object select 0) isKindof "Wheeled_APC_F")	: { format["%1_motor_inf",_prefix] };
		case ((_object select 0) isKindof "Car")			: { format["%1_motor_inf",_prefix] };
			case ((_object select 0) isKindof "APC_Tracked_01_base_F");
			case ((_object select 0) isKindof "APC_Tracked_02_base_F");
			case ((_object select 0) isKindof "APC_Tracked_03_base_F")	: { format["%1_mech_inf",_prefix] };
			case ((_object select 0) isKindof "B_APC_Tracked_01_AA_F");
			case ((_object select 0) isKindof "O_APC_Tracked_02_AA_F")	: { format["%1_unknown",_prefix] };
			case ((_object select 0) isKindof "MBT_01_arty_base_F");
			case ((_object select 0) isKindof "MBT_01_mlrs_base_F");
			case ((_object select 0) isKindof "MBT_02_arty_base_F")	: { format["%1_art",_prefix] };
		case ((_object select 0) isKindof "Tank")			: { format["%1_armor",_prefix] };
			case ((_object select 0) isKindof "StaticMortar")	: { format["%1_mortar",_prefix] };
		case ((_object select 0) isKindof "StaticWeapon")	: { format["%1_art",_prefix] };
	case ((_object select 0) isKindof "LandVehicle")	: { format["%1_motor_inf",_prefix] };
// AIR
			case ((_object select 0) isKindof "UAV_01_base_F")			: { format["%1_uav",_prefix] };
		case ((_object select 0) isKindof "Helicopter")		: { format["%1_air",_prefix] };
			case ((_object select 0) isKindof "UAV")			: { format["%1_uav",_prefix] };
		case ((_object select 0) isKindof "Plane")			: { format["%1_plane",_prefix] };
	case ((_object select 0) isKindof "Air")			: { format["%1_air",_prefix] };
// WATER
	case ((_object select 0) isKindof "Ship")			: { format["%1_naval",_prefix] };
	default { format["%1_unknown",_prefix] };
};

_type