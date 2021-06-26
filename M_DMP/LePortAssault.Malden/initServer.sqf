diag_log "----------- MAP START -------------------------------------------------------------------------------------------------------------------------";

execVM "scripts\ar_fnc_aceFirstadidkitConversion.sqf";
execVM "scripts\ar_fnc_aceHealthStation.sqf";
execVM "scripts\ar_fnc_helpingReinforcement.sqf";
execVM "scripts\ar_fnc_killEnemyIncome.sqf";
execVM "scripts\timerMaintenance.sqf";
execVM "scripts\timerIncome.sqf";
execVM "scripts\missionScripts.sqf";

if ((["aDebugMessages", 0] call BIS_fnc_getParamValue) == 1) then 
{
	aDebugMessages = true;
} else {
	aDebugMessages = false;
	{
		_x setMarkerAlpha 0;
	} forEach ((getMissionLayerEntities "Debug Markers") select 1);
	{
		_x enableSimulationGlobal false;
		hideObjectGlobal _x;
	} forEach ((getMissionLayerEntities "Debug Objects") select 0);
};

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

[independent,["startingFunds", 500] call BIS_fnc_getParamValue] call grad_lbm_fnc_setFunds;
asb_defaultCRperKill = 8;

// init tickets
[independent, ["startingTickets", 10] call BIS_fnc_getParamValue] call BIS_fnc_respawnTickets;

[independent, "I_SquadLeader"] call BIS_fnc_addRespawnInventory;
[independent, "I_Medic"] call BIS_fnc_addRespawnInventory;
[independent, "I_LAT"] call BIS_fnc_addRespawnInventory;
[independent, "I_Grenadier"] call BIS_fnc_addRespawnInventory;
[independent, "I_Rifleman"] call BIS_fnc_addRespawnInventory;
[independent, "I_Tanker"] call BIS_fnc_addRespawnInventory;
[independent, "I_HeliPilot"] call BIS_fnc_addRespawnInventory;

[] spawn {
	sleep 300;
	{
		[_x] call BIS_fnc_deleteTask;
	} forEach ["tksPrntHints","tskAdditionalArmor","tskArsenal","tskDynamicGroups","tskGlobalStore","tskPhone","tskStore","tskStoreBox"];

};