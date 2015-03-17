private ["_healer","_isMedic","_roleIsMedic"];

_healer = _this;
_roleIsMedic = if((_healer getVariable ["PO3_VAR_roleAttribute","Rifleman"]) == "Medic") then { true }else{ false };
_isMedic = if( getNumber (configFile >> "CfgVehicles" >> (typeOf _healer) >> "attendant") == 1 || _roleIsMedic ) then { true }else{ false };

_isMedic;