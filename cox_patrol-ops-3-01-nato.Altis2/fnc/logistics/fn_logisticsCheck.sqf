private["_check","_object","_vehicle","_return","_lifterSize","_loaderSize","_objectSize","_towerSize","_draggerSize"];

_check = _this select 0;
_object = _this select 1;
_vehicle = if(count _this > 2) then { _this select 2 }else{ objNull };

_return = false;
switch (toLower _check) do {
	case "lifting" : {};
	case "lifted" : { if !(isNull ( _object getVariable ["PO3_lifted",objNull]) ) then { _return = true }; };
	case "liftable"	: {
		if(isNull (_object getVariable ["PO3_loaded",objNull]) ) then {
			if( _object getVariable ["PO3_liftable",false] && count(crew _object) == 0 ) then {
				_return = true;
			}else{
				_lifterSize = 0; { if( _vehicle isKindOf (_x select 0) ) exitWith { _lifterSize = _x select 1 } }forEach PO3_CfgLogistics_Loadable;
				_objectSize = 0; { if( _object isKindOf (_x select 0) ) exitWith { _objectSize = _x select 1 } }forEach PO3_CfgLogistics_Liftable;
				if !(_lifterSize == 0 || _objectSize == 0) then {
					if( _lifterSize >= _objectSize && count(crew _object) == 0 ) then { _return = true };
				};
			};
		};
	};
	case "dragging" : {};
	case "dragged" : { if !(isNull ( _object getVariable ["PO3_dragged",objNull]) ) then { _return = true }; };
	case "draggable"	: {
		if(isNull (_object getVariable ["PO3_dragged",objNull]) ) then {
			if( _object getVariable ["PO3_draggable",false] && count(crew _object) == 0 ) then {
				_return = true;
			}else{
				_draggerSize = 0;
				if( _vehicle isKindOf "CaManBase" )then { _draggerSize = 5 }else{
					{ if( _vehicle isKindOf (_x select 0) ) exitWith { _draggerSize = _x select 1 } }forEach PO3_CfgLogistics_Loadable;
				};
				_objectSize = 0; { if( _object isKindOf (_x select 0) ) exitWith { _objectSize = _x select 1 } }forEach PO3_CfgLogistics_Moveable;
				if !(_draggerSize == 0 || _objectSize == 0) then {
					if( _draggerSize >= _objectSize && count(crew _object) == 0 ) then { _return = true };
				};
			};
		};
	};
	case "loading" : {};
	case "loaded" : { if !(isNull ( _object getVariable ["PO3_loaded",objNull]) ) then { _return = true }; };
	case "loadable"	: {
		if(isNull (_object getVariable ["PO3_loaded",objNull]) ) then {
			if( _object getVariable ["PO3_loadable",false] && count(crew _object) == 0 ) then {
				_return = true;
			}else{
				_loaderSize = 0; { if( _vehicle isKindOf (_x select 0) ) exitWith { _loaderSize = _x select 1 } }forEach PO3_CfgLogistics_Loadable;
				_objectSize = 0; { if( _object isKindOf (_x select 0) ) exitWith { _objectSize = _x select 1 } }forEach PO3_CfgLogistics_Liftable;
				if !(_loaderSize == 0 || _objectSize == 0) then {
					if( _loaderSize >= _objectSize && count(crew _object) == 0 ) then { _return = true };
				};
			};
		};
	};
	case "towing" : {};
	case "towed" : { if !(isNull ( _object getVariable ["PO3_towed",objNull]) ) then { _return = true }; };
	case "towable" : {
		if(isNull (_object getVariable ["PO3_towed",objNull]) ) then {
			if( _object getVariable ["PO3_towable",false] && count(crew _object) == 0 ) then {
				_return = true;
			}else{
				_towerSize = 0; { if( _vehicle isKindOf (_x select 0) ) exitWith { _towerSize = _x select 1 } }forEach PO3_CfgLogistics_TowVehicles;
				_objectSize = 0; { if( _object isKindOf (_x select 0) ) exitWith { _objectSize = _x select 1 } }forEach PO3_CfgLogistics_Towable;
				if !(_towerSize == 0 || _objectSize == 0) then {
					if( _towerSize >= _objectSize && count(crew _object) == 0 ) then { _return = true };
				};
			};
		};
	};
};

_return;