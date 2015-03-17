if !(PO3SRV) exitWith {};

PO3_pVAR_changeOvercast = _this;
publicVariable "PO3_pVAR_changeOvercast";

_this spawn PO3_fnc_setOvercast;