tf_same_sw_frequencies_for_side = false;
tf_same_lr_frequencies_for_side = true;
//tf_west_radio_code = "_bluefor";
//tf_east_radio_code = "_opfor";
//tf_guer_radio_code = "_independent";

if(PO3SRV) then {
	{
		_x addItemCargoGlobal ["itemRadio",100];
		if !(isNil "PO3_active_side_west") then { _x addBackpackCargoGlobal ["tf_rt1523g",100]; };
		if !(isNil "PO3_active_side_east") then { _x addBackpackCargoGlobal ["tf_mr3000",100]; };
		if !(isNil "PO3_active_side_guer") then { _x addBackpackCargoGlobal ["tf_anprc155",100]; };
	}foreach [box1,box2,box3];
};
