private["_unit","_animate"];

_unit = _this select 0;
_animate = _this select 1;

switch (_animate) do {
	case "Injured_AgonyStart":	{ _unit playActionNow "agonyStart"; };
	case "Injured_AgonyEnd":	{ _unit playActionNow "agonyStop"; };
//	case "Injured_HealStart":	{ };
//	case "Injured_HealDone":	{ };
//	case "Injured_HealFail":	{ };
	case "Healer_Start":		{ _unit playActionNow "medicStartUp"; };
	case "Healer_Done":		{ _unit playActionNow "medicStop"; };
	case "Healer_Fail":		{ _unit playActionNow "medicStop"; };
	case "Draggee_Start":		{ _unit setDir 0; _unit playMove "AinjPpneMstpSnonWrflDb_grab"; };
	case "Draggee_End":		{ _unit playMove "AinjPpneMstpSnonWrflDb_release"; };
	case "Dragger_Start":		{ _unit playMove "AcinPknlMstpSrasWrflDnon"; };
	case "Dragger_End":		{ _unit playMove "amovpknlmstpsraswrfldnon"; };
//	case "Carree_Start":		{ _unit playActionNow "grabCarried"; };
//	case "Carree_End":		{ _unit playActionNow ""; };
//	case "Carrier_Start":		{ _unit playActionNow "grabCarry"; };
//	case "Carrier_End":		{ _unit playActionNow "PutDown"; };
	case "Surrender_Start":		{ _unit SetUnitPos "UP"; _unit playActionNow "Surrender"; _unit disableAI "MOVE"; };
	case "Surrender_End":		{ _unit enableAI "MOVE"; };
	case "Released":		{ _unit playActionNow "released"; };
	case "Pack_Object" :		{ _unit playActionNow "AinvPknlMstpSlayWrflDnon_medic"; };
	case "Pack_Stop" :		{ _unit playActionNow "amovpknlmstpsraswrfldnon"; };
	case "SitDown" :		{ _unit playActionNow "SitDown"; };
	case "Unconscious" :		{ _unit playActionNow "Unconscious"; };
	case "Salute" :			{ _unit playActionNow "Salute"; };
	case "GrabDrag" :		{ _unit playActionNow "grabDrag"; };	// initiate First Aid dragging animation
	case "Stopdrag" :		{ _unit playActionNow "stopdrag"; };	// stops First Aid dragging animation
	case "GrabDragged" :		{ _unit playActionNow "grabDragged"; };
	case "GrabCarry" :		{ _unit playActionNow "grabCarry"; };
	case "GrabCarried" :		{ _unit playActionNow "grabCarried"; };
	case "CarriedStill" :		{ _unit playActionNow "carriedStill"; };
	case "MedicStart" :		{ _unit playActionNow "medicStart"; };
	case "MedicStartUp" :		{ _unit playActionNow "medicStartUp"; };
	case "MedicStartRightSide" :	{ _unit playActionNow "medicStartRightSide"; };
	case "MedicStop" :		{ _unit playActionNow "medicStop"; };
	case "Released" :		{ _unit playActionNow "released"; };
	case "ReleasedBad" :		{ _unit playActionNow "releasedBad"; };
	case "AgonyStart" :		{ _unit playActionNow "agonyStart"; };
	case "AgonyStop" :		{ _unit playActionNow "agonyStop"; };
	case "Treated" :		{ _unit playActionNow "Treated"; };
	case "Medic" :			{ _unit playActionNow "Medic"; };
	case "MedicOther" :		{ _unit playActionNow "MedicOther"; };
	case "CanNotMove" :		{ _unit playActionNow "CanNotMove"; };
	case "FireNotPossible" :	{ _unit playActionNow "FireNotPossible"; };
// Gestures/Hand Signals
	case "GestureFreeze" :		{ _unit playActionNow "gestureFreeze"; };
	case "GestureGo" :		{ _unit playActionNow "GestureGo"; };
	case "GestureCover" :		{ _unit playActionNow "GestureCover"; };
	case "GestureAttack" :		{ _unit playActionNow "GestureAttack"; };
	case "GestureCeaseFire" :	{ _unit playActionNow "GestureCeaseFire"; };
	case "GestureFollow" :		{ _unit playActionNow "GestureFollow"; };
	case "GestureUp" :		{ _unit playActionNow "GestureUp"; };
	case "GestureAdvance" :		{ _unit playActionNow "GestureAdvance"; };
	case "GesturePoint" :		{ _unit playActionNow "GesturePoint"; };
};

true;