private["_unitList"];

if(isNil "PO3_CfgSpawner_PreDefinedVehicles") then { PO3_CfgSpawner_PreDefinedVehicles = [] };

_unitList = [];
{
	if(_x select 0 == _this) then {
		_unitList = _x select 1;
	};
}forEach PO3_CfgSpawner_PreDefinedVehicles;

_unitList;