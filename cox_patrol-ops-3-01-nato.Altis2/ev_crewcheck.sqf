//this addEventHandler ["GetIn", {_this execVM "ev_crewcheck.sqf"}];
_veh = _this select 0;
_unit = _this select 2;
_crewtype1 = "B_Crew_F";
_crewtype2 = "B_soldier_repair_F";
_crewtype3 = "B_support_Mort_F"
if (driver _veh == _unit) then {
if (typeof _unit != _crewtype1) then {
if (typeof _unit != _crewtype2) then{
if (typeof _unit != _crewtype3) then{
_unit action ["getOut",_veh];
waituntil {vehicle _unit == _unit};
hint "Вы не являетесь членом экипажа/механиком!";
};};};};

if (gunner _veh == _unit) then {
if (typeof _unit != _crewtype1) then {
if (typeof _unit != _crewtype2) then{
if (typeof _unit != _crewtype3) then{
_unit action ["getOut",_veh];
waituntil {vehicle _unit == _unit};
hint "Вы не являетесь членом экипажа/механиком!";
};};};};

if (commander _veh == _unit) then {
if (typeof _unit != _crewtype1) then {
if (typeof _unit != _crewtype2) then{
if (typeof _unit != _crewtype3) then{
_unit action ["getOut",_veh];
waituntil {vehicle _unit == _unit};
hint "Вы не являетесь членом экипажа/механиком!";
};};};};