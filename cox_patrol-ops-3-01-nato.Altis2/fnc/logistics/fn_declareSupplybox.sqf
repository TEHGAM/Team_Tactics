/*
	Author: Eightysix

	Description:

*/
private["_ammobox"];

PO3_pVAR_declaredSupplybox = _this; publicVariable "PO3_pVAR_declaredSupplybox";

if(PO3CLI) then {
	_this call PO3_fnc_handleSupplybox;
};