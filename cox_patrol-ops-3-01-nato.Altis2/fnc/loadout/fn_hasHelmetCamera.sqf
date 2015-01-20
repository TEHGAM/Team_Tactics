private["_unit","_hasARGear"];

_unit = _this select 0;

_hasARGear = false;

if(
	toLower(headgear _unit) IN [
		"h_helmetia","h_helmetia_camo","h_helmetia_net",
		"h_helmetb","h_helmetb_camo","h_helmetb_light","h_helmetb_paint","h_helmetb_plain_blk","h_helmetb_plain_mcamo",
		"h_helmetspecb","h_helmetspecb_blk","h_helmetspecb_paint1","h_helmetspecb_paint2",
		"h_helmetcrew_b","h_helmetcrew_i","h_helmetcrew_o",
		"h_helmetspeco_blk","h_helmetspeco_ocamo",
		"h_helmetleadero_ocamo","h_helmetleadero_oucamo",
		"h_helmeto_ocamo","h_helmeto_oucamo"
	]
) then {
	_hasARGear = true;
};

_hasARGear