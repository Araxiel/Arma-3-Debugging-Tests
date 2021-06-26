// [addComponentsActionRepairFacility, addComponentsActionTime, addComponentsActionExtraCondition, addComponentsActionDoneCode] execVM "scripts\ar_fnc_addComponentsActions.sqf";
//	addComponentsActionDoneCode passed arguments [_target, _player, "slat" or "camo"]
//
//	Example:
//	["Land_RepairDepot_01_green_F", 4, someCondition, someAction] execVM "scripts\ar_fnc_addComponentsActions.sqf";
//
//	implement with
//	[_vehicle, 0, ["ACE_MainActions"], addSlatAction] call ace_interact_menu_fnc_addActionToObject;
//	[_vehicle, 0, ["ACE_MainActions"], addCamoAction] call ace_interact_menu_fnc_addActionToObject;

params [
	['_addComponentsActionRepairFacility', "Land_RepairDepot_01_green_F"],
	['_addComponentsActionTime', 10],
	['_addComponentsActionExtraCondition', true],
	['_addComponentsActionDoneCode', {}]
];

addComponentsActionRepairFacility = _addComponentsActionRepairFacility;
addComponentsActionExtraCondition = _addComponentsActionExtraCondition;
addComponentsActionTime = _addComponentsActionTime;
addComponentsActionDoneCode = _addComponentsActionDoneCode;

//// SLAT

fnc_addSlatEvent = {
	/* 	
		[_target,_player] spawn fnc_addSlatEvent
		Adds the SLAT armor to the target. Required/intended to be called from an ACE Action.
	*/
	params ["_target", "_player"];
	
	[
		_target,
		[], 
		["showSLATHull",1,"showSLATTurret",1]
	] call BIS_fnc_initVehicle;
	_target setVariable ["canAddCamo",false];
	[_target, _player, "slat"] spawn addComponentsActionDoneCode;
};

fnc_addSlatDone = {
	/* 	
		Ace Progress done
	*/
	_target = _this #0 #0;
	_player = _this #0 #1;
	[_target, _player] spawn fnc_addSlatEvent;

};

fnc_addSlatStart = {
	/* 	
		The ACE action's code, starting the progressbar
	*/
	params ["_target", "_player", "_params"];
	
	_target setVariable ["canAddSlat",false];

	[addComponentsActionTime, [_target,_player], fnc_addSlatDone,{_this #0 #0 setVariable ["canAddSlat",true];},"Adding SLAT Armor"] call ace_common_fnc_progressBar;
};

// simple condition check
addSlatActionCondition = {
	params ["_target", "_player", "_params"];
	_target getVariable ["canAddSlat",true] && (count (_target nearObjects [addComponentsActionRepairFacility, 50]) > 0) && addComponentsActionExtraCondition ;
};

// Setups the ACE action.
addSlatAction = [
	"addSlat","Add SLAT Armor",
	"\a3\ui_f\data\igui\cfg\simpletasks\types\armor_ca.paa",
	fnc_addSlatStart,
	addSlatActionCondition
]	 call ace_interact_menu_fnc_createAction;

//// Camo

fnc_addCamoEvent = {
	/* 	
		[_target,_player] spawn fnc_addSlatEvent
		Adds the Camo netting to the target. Required/intended to be called from an ACE Action.
	*/
	params ["_target", "_player"];
	
	[
		_target,
		[], 
		["showCamonetHull",1,"showCamonetTurret",1]
	] call BIS_fnc_initVehicle;
	_target setVariable ["canAddSlat",false];
	[_target, _player, "camo"] spawn addComponentsActionDoneCode;
};

fnc_addCamoDone = {
	/* 	
		Ace Progress done
	*/
	_target = _this #0 #0;
	_player = _this #0 #1;
	[_target, _player] spawn fnc_addCamoEvent;

};

fnc_addCamoStart = {
	/* 	
		The ACE action's code, starting the progressbar
	*/
	params ["_target", "_player", "_params"];
	
	_target setVariable ["canAddCamo",false];

	[addComponentsActionTime, [_target,_player], fnc_addCamoDone,{_this #0 #0 setVariable ["canAddCamo",true];},"Adding Camo Netting"] call ace_common_fnc_progressBar;
};

// simple condition check
addCamoActionCondition = {
	params ["_target", "_player", "_params"];
	_target getVariable ["canAddCamo",true] && (count (_target nearObjects [addComponentsActionRepairFacility, 50]) > 0) && addComponentsActionExtraCondition ;
};

// Setups the ACE action.
addCamoAction = [
	"addSlat","Add Camo Netting",
	"\a3\ui_f\data\igui\cfg\simpletasks\types\box_ca.paa",
	fnc_addCamoStart,
	addCamoActionCondition
]	 call ace_interact_menu_fnc_createAction;

// some debug
fnc_debugSpawnComponentsAPC = {
	// [player] spawn fnc_debugSpawnAPC;
	params [
		['_obj', objNull]
	];
	_dir = getDir _obj;
	_pos = getPos _obj;
	private _spawnPos = _pos getPos [5, _dir];

	_apc = "I_APC_tracked_03_cannon_F" createVehicle _spawnPos;
	_apc setDir (_dir+90);

	[_apc, 0, ["ACE_MainActions"], addSlatAction] call ace_interact_menu_fnc_addActionToObject;
	[_apc, 0, ["ACE_MainActions"], addCamoAction] call ace_interact_menu_fnc_addActionToObject;
};

if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log '- VlsDefenderScripting init -';};