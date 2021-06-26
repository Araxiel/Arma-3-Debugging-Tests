diag_log "----------- MAP START -------------------------------------------------------------------------------------------------------------------------";
missionNamespace setVariable ["aDebugMessages", true];

[] execVM "ar_fnc_killEnemyIncome.sqf";

opforTargets = [officerDude,crewDude,autoDude,carG,carD,car,lsv,lsvD];
bluforTargets = [badger,badgerG,badgerD,badgerC];
{
	_x addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator"];
		[ _unit, _killer, _instigator] spawn ars_fnc_enemyKilled;
	}];
} forEach opforTargets + bluforTargets;

// Init income variables
private "_incomeMultiplier";
switch (["incomeMultiplier", 2] call BIS_fnc_getParamValue) do {
	case 1: { _incomeMultiplier = 0.5 };
	case 2: { _incomeMultiplier = 1 };
	case 3: { _incomeMultiplier = 1.25 };
	case 4: { _incomeMultiplier = 1.5 };
	case 5: { _incomeMultiplier = 1.2 };
	case 6: { _incomeMultiplier = 3 };
	case 7: { _incomeMultiplier = 5 };
	case 8: { _incomeMultiplier = 10 };
	default { _incomeMultiplier = 1 };
};
asb_incomeMultiplier = _incomeMultiplier;

[side player,["startingFunds", 100] call BIS_fnc_getParamValue] call grad_lbm_fnc_setFunds;
[blufor,["startingFunds", 200] call BIS_fnc_getParamValue] call grad_lbm_fnc_setFunds;

//	income TODO
asb_baseIncome = 100;
asb_gainedIncome = 0;
asb_defaultCRperKill = 8;

// for debug monitoring
//[side player] call grad_lbm_fnc_getFunds;