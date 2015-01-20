if !(PO3SRV) exitWith {};

PO3_pVAR_changeWind = _this;
publicVariable "PO3_pVAR_changeWind";

_this spawn PO3_fnc_setWind;