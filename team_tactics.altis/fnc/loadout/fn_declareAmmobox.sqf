/*
	Author: Eightysix

	Description:

*/
private["_ammobox"];

PO3_pVAR_declaredAmmobox = _this; publicVariable "PO3_pVAR_declaredAmmobox";

if(PO3CLI) then {
	_this call PO3_fnc_handleAmmobox;
};