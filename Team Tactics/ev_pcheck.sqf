//this addEventHandler ["GetIn", {_this execVM "ev_pcheck.sqf"}];
_veh = _this select 0;
_unit = _this select 2;
_crewtype = "B_Helipilot_F";
if (driver _veh == _unit) then {
	if ((typeof _unit != _crewtype) and (typeof _unit !="B_helicrew_F")) then {
		_unit action ["getOut",_veh];
		waituntil {vehicle _unit == _unit};
        hint "Вы не являетесь пилотом!";
	};
};
//turretUnit!!!
if ((_veh turretUnit [0])== _unit) then {
	if ((typeof _unit != _crewtype) and (typeof _unit !="B_helicrew_F")) then {
		_unit action ["getOut",_veh];
		waituntil {vehicle _unit == _unit};
        hint "Вы не являетесь пилотом!";
	};
};