if(PO3SRV) then {
	acreTower_1 = "ACRE_OE_303" createVehicle ("acreTowerLoc_1" call PO3_fnc_getPos); publicVariable "acreTower_1";
	acreTower_2 = "ACRE_OE_303" createVehicle ("acreTowerLoc_2" call PO3_fnc_getPos); publicVariable "acreTower_2";
	acreTower_3 = "ACRE_OE_303" createVehicle ("acreTowerLoc_3" call PO3_fnc_getPos); publicVariable "acreTower_3";
	acreTower_4 = "ACRE_OE_303" createVehicle ("acreTowerLoc_4" call PO3_fnc_getPos); publicVariable "acreTower_4";
	acreTower_5 = "ACRE_OE_303" createVehicle ("acreTowerLoc_5" call PO3_fnc_getPos); publicVariable "acreTower_5";
	{
		_x addItemCargoGlobal ["ACRE_PRC148",100];
		_x addItemCargoGlobal ["ACRE_PRC148_UHF",100];
		_x addItemCargoGlobal ["ACRE_PRC343",100];
		_x addItemCargoGlobal ["ACRE_PRC117F",100];
	}foreach [box1,box2,box3];
};
if(PO3CLI) then {
	[] spawn {
		waitUntil{!isNil "acreTower_1" && !isNil "acreTower_2" && !isNil "acreTower_3" && !isNil "acreTower_4" && !isNil "acreTower_5"};
		[[getPosASL acreTower_1 select 0, getPosASL acreTower_1 select 1, (getPosASL acreTower_1 select 2) + 2500], 36.625, 342.675, 20000] spawn acre_api_fnc_createRxmtStatic;
		[[getPosASL acreTower_2 select 0, getPosASL acreTower_2 select 1, (getPosASL acreTower_2 select 2) + 2500], 36.625, 342.675, 20000] spawn acre_api_fnc_createRxmtStatic;
		[[getPosASL acreTower_3 select 0, getPosASL acreTower_3 select 1, (getPosASL acreTower_3 select 2) + 2500], 36.625, 342.675, 20000] spawn acre_api_fnc_createRxmtStatic;
		[[getPosASL acreTower_4 select 0, getPosASL acreTower_4 select 1, (getPosASL acreTower_4 select 2) + 2500], 36.625, 342.675, 20000] spawn acre_api_fnc_createRxmtStatic;
		[[getPosASL acreTower_5 select 0, getPosASL acreTower_5 select 1, (getPosASL acreTower_5 select 2) + 2500], 36.625, 342.675, 20000] spawn acre_api_fnc_createRxmtStatic;
	};
};
