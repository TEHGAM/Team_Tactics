private["_group","_groupID"];

_group = _this;
if(typeName _group == typeName []) then { _group = _group select 0 };

_groupID = switch (typeName _group) do {
	case (typeName grpNull) : { _group };
	case (typeName objNull) : {
		if( _group isKindof "Man" ) then {
			group _group;
		}else{
			group (driver _group)
		};
	};
	default { nil };
};

{
	_x setVariable ["PO3_hideGroup",true,true];
}forEach (units _groupID);

true;