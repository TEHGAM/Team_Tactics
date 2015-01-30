_vehicleType = _this select 0;  // "Helicopter" / "Tank"
_crewType = _this select 1;  // "US_Soldier_Pilot_EP1"

//hint format["%1 - %2",_crewType, _vehicleType];
  if (typeof player != _crewType) then {
    private "_v";
    while {alive player} do {
      waituntil {vehicle player != player};
      _v = vehicle player;
      if (_v iskindof _vehicleType && !(_v iskindof "ParachuteBase")) then {
        if (driver _v == player) then {
          player action ["eject",_v];
          waituntil {vehicle player == player};
          hint "Брысь!";
        };
      };
    };
  };