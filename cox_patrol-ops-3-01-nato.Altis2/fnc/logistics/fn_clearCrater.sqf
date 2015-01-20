private["_crater","_positionCrater"];

_crater = _this select 0;
_positionCrater = position _crater;

/* Causes Battleye issues
_crater setpos [(_positionCrater select 0), (_positionCrater select 1), -0.1];
for "_i" from (_positionCrater select 2) to -2 step -0.1 do {
	_crater setpos [(_positionCrater select 0), (_positionCrater select 1), _i];
	sleep 0.1;
};
*/
deleteVehicle _crater;
