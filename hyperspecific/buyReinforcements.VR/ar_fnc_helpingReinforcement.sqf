fnc_defaultRandomInfantryArrays = {
	//	[_randomInfantryArray] = [_side] call fnc_defaultRandomInfantryArrays;
	// 	Usage:
	//	["B_soldier_F",7,"B_Soldier_GL_F",4,"B_Soldier_AR_F",4] = [blufor] call fnc_defaultRandomInfantryArrays;

	params [
		["_side", blufor]
	];

	private _randomInfantryArray = [];
	switch (_side) do {
		case opfor: {
			_randomInfantryArray = [
				"O_Soldier_F", 7,
				"O_Soldier_GL_F", 4,
				"O_Soldier_AR_F", 4,
				"O_medic_F", 4,
				"O_Soldier_A_F", 3, //ammobearer
				"O_HeavyGunner_F", 3,
				"O_soldier_M_F", 2, //marksman
				"O_Soldier_lite_F", 3,
				"O_Soldier_TL_F", 3,
				"O_engineer_F", 1,
				"O_Soldier_AA_F", 1,
				"O_Soldier_LAT_F", 4, // rpg
				"O_Soldier_HAT_F", 3,	// metis
				"O_Soldier_AT_F", 2
			];
		};
		case independent: {
			_randomInfantryArray = [
				"I_soldier_F", 7,
				"I_Soldier_GL_F", 4,
				"I_Soldier_AR_F", 4,
				"I_medic_F", 4,
				"I_Soldier_A_F", 3, //ammobearer
				"I_Soldier_M_F", 2, //marksman
				"I_Soldier_lite_F", 3,
				"I_Soldier_TL_F", 3,
				"I_engineer_F", 1,
				"I_Soldier_AA_F", 1,
				"I_Soldier_LAT_F", 4, // nlaw
				"I_Soldier_LAT2_F", 4,	// maaws
				"I_Soldier_AT_F", 2		// atgm
			];
		};
		case blufor: {
			_randomInfantryArray = [
				"B_Soldier_F", 6,
				"B_Soldier_GL_F", 4,
				"B_Soldier_AR_F", 4,
				"B_medic_F", 4,
				"B_Soldier_A_F", 3, //ammobearer
				"B_HeavyGunner_F", 3,
				"B_soldier_M_F", 2, //marksman
				"B_Soldier_lite_F", 3,
				"B_Soldier_TL_F", 3,
				"B_engineer_F", 1,
				"B_Soldier_AA_F", 1,
				"B_Soldier_LAT_F", 4, // nlaw
				"B_Soldier_LAT2_F", 4,	// maaws
				"B_Soldier_AT_F", 2		// atgm
			];
		};
	};
	if (missionNamespace getVariable ['aDebugMessages',false]) then { diag_log '- fnc_defaultRandomInfantryArrays Done -';};
	_randomInfantryArray
};

fnc_defaultBoughtHelpVehicleArrays = {
	//	_pickedVehicle = [_side, _kind] call fnc_defaultBoughtHelpVehicleArrays;
	// 	Usage:
	//	"O_APC_Tracked_02_cannon_F" = [blufor, 3] call fnc_defaultBoughtHelpVehicleArrays;
	//	_kind values:
	//	0 = Random, 1 = Cars, 2 = Trucks, 3 = APCs, 4 = Tanks

	params [
		["_side", blufor],
		["_kind", 0]
	];

	if (_kind == 0) then {
		_kind = selectRandomWeighted [1,4,2,3,3,2,4,1]
	};
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['_kind : %1',_kind];};

	private "_pickedVehicle";
	switch (_kind) do {
		case 1: { 
		// cars/jeeps
			switch (_side) do {
				case opfor: {
					_pickedVehicle = selectRandomWeighted [
						"O_MRAP_02_hmg_F", 5,
						"O_MRAP_02_gmg_F", 1,
						"O_LSV_02_armed_F", 3
					];
				};
				case independent: {
					_pickedVehicle = selectRandomWeighted [
						"I_MRAP_03_hmg_F", 4,
						"I_MRAP_03_gmg_F", 1
					];
				};
				case blufor: {
					_pickedVehicle = selectRandomWeighted [
						"B_MRAP_01_hmg_F", 5,
						"B_MRAP_01_gmg_F", 1,
						"B_LSV_01_armed_F", 3
					];
				};
			};
		};
		case 2: { 
		// trucks
			switch (_side) do {
				case opfor: {
					_pickedVehicle = selectRandomWeighted [
						"O_Truck_03_covered_F", 1,
						"O_Truck_02_covered_F", 3
					];
				};
				case independent: {
					_pickedVehicle = "I_Truck_02_covered_F";
				};
				case blufor: {
					_pickedVehicle = "B_Truck_01_covered_F";
				};
			};
		};
		case 3: { 
		// apcs
			switch (_side) do {
				case opfor: {
					_pickedVehicle = selectRandomWeighted [
						"O_APC_Tracked_02_cannon_F", 1,
						"O_APC_Wheeled_02_rcws_v2_F", 3
					];
				};
				case independent: {
					_pickedVehicle = selectRandomWeighted [
						"I_APC_tracked_03_cannon_F", 1,
						"I_APC_Wheeled_03_cannon_F", 2
					];
				};
				case blufor: {
					_pickedVehicle = selectRandomWeighted [
						"B_APC_Wheeled_01_cannon_F", 2,
						"B_APC_Tracked_01_rcws_F", 1
					];
				};
			};
		};
		case 4: { 
		// tanks
			switch (_side) do {
				case opfor: {
					_pickedVehicle = selectRandomWeighted [
						"O_MBT_04_cannon_F", 2,
						"O_MBT_04_command_F", 1,
						"O_MBT_02_cannon_F", 6
					];
				};
				case independent: {
					_pickedVehicle = "I_MBT_03_cannon_F";
				};
				case blufor: {
					_pickedVehicle = selectRandomWeighted [
						"B_MBT_01_TUSK_F", 1,
						"B_MBT_01_cannon_F", 6
					];
				};
			};
		};
	};

	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['_pickedVehicle : %1',_pickedVehicle];};
	_pickedVehicle

};

fnc_aoSAD = {

	params [
		["_group", grpNull]
	];

	_fnc_debugMarkers = {
		// for the debug markers
		// _debugMarker = [_debugMarkerPos, _debugMarkerType, _debugMarkercolor, _debugMarkerText] call _fnc_debugMarkers;
		// [objNull, "mil_destroy", "ColorYellow", "text"] call _fnc_debugMarkers;
		params [
			[ "_debugMarkerPos", objNull],
			[ "_debugMarkerType", "mil_destroy"],
			[ "_debugMarkercolor", "ColorYellow"],
			[ "_debugMarkerText", ""],
			[ "_debugMarkerAlpha", 0.9]
		];
		private ["_debugMarker"];

		if (missionNamespace getVariable ['aDebugMessages',false]) then {
			_debugMarkerPos = _debugMarkerPos call BIS_fnc_position;
			_debugMarkerId = round(random 50000)+100000; 
			_debugMarker = createMarker [format["_USER_DEFINED %1",_debugMarkerId], _debugMarkerPos]; 
			_debugMarker setMarkerType _debugMarkerType; 
			_debugMarker setMarkerColor _debugMarkercolor;
			_debugMarker setMarkerText _debugMarkerText;
			_debugMarker setMarkerAlpha _debugMarkerAlpha;
		};
		_debugMarker
	};

    _wpPos = [[_group getVariable "aoAreaArray"], ["water", _group getVariable "aoBlacklist"]] call BIS_fnc_randomPos;
	_wpPos = [_wpPos, 0, 10, 2, 0, 30] call BIS_fnc_findSafePos;	// get a random (accessible) spot for the WP

	_wp = _group addWaypoint [_wpPos, 0];
	_wp setWaypointType "SAD";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCompletionRadius 50;
	_wp setWaypointStatements ["true", "[group this] spawn fnc_aoSAD"];
	[waypointPosition _wp, "mil_destroy", "ColorYellow", format["SAD WP for %1",_group]] call _fnc_debugMarkers;
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['New SAD for group: %1',_group];};
};

fnc_summonAoInfantrySAD = {
	//	_group = [_spawn, _side, _aoPos, _aoArea, _blacklist] call fnc_summonAoInfantrySAD;
	// 	Usage:
	//	[indySpawn, independent, getPos aoTrigger, triggerArea aoTrigger, []] call fnc_summonAoInfantrySAD;

	params [
		["_spawn", objNull],
		["_side", sideUnknown],
		["_aoPos", [0,0,0]],
		["_aoArea", [0,0,0,false,-1]],
		["_blacklist", []]	// optional
	];

	_fnc_debugMarkers = {
		// for the debug markers
		// _debugMarker = [_debugMarkerPos, _debugMarkerType, _debugMarkercolor, _debugMarkerText] call _fnc_debugMarkers;
		// [objNull, "mil_destroy", "ColorYellow", "text"] call _fnc_debugMarkers;
		params [
			[ "_debugMarkerPos", objNull],
			[ "_debugMarkerType", "mil_destroy"],
			[ "_debugMarkercolor", "ColorYellow"],
			[ "_debugMarkerText", ""],
			[ "_debugMarkerAlpha", 0.9]
		];
		private "_debugMarker";

		if (missionNamespace getVariable ['aDebugMessages',false]) then {
			_debugMarkerPos = _debugMarkerPos call BIS_fnc_position;
			_debugMarkerId = round(random 50000)+100000; 
			_debugMarker = createMarker [format["_USER_DEFINED %1",_debugMarkerId], _debugMarkerPos]; 
			_debugMarker setMarkerType _debugMarkerType; 
			_debugMarker setMarkerColor _debugMarkercolor;
			_debugMarker setMarkerText _debugMarkerText;
			_debugMarker setMarkerAlpha _debugMarkerAlpha;
		};
		_debugMarker;
	};

	if (missionNamespace getVariable ['aDebugMessages',false]) then { diag_log '- aoInfantry Start -';};

	_specificSpawn = [_spawn, 0, 40, 5, 0] call BIS_fnc_findSafePos;	// find a safe spawn spot
	_group = [_specificSpawn, _side, 7] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;

	//	reformats the trigger pos and area into a usable format of [[x,y,z], [a, b, angle, rect]], or [[0,0,0], [0,0,0,-1]]
	private _aoAreaArray = [_aoPos, _aoArea];
	// sends stuff to the group as variables, so the setWaypointStatements has this data to work with.
    _group setVariable ["aoAreaArray", _aoAreaArray];
    _group setVariable ["aoBlacklist", _blacklist];

    _wpPos = [[_aoAreaArray], ["water", _blacklist]] call BIS_fnc_randomPos;
	_wpPos = [_wpPos, 0, 10, 2, 0, 30] call BIS_fnc_findSafePos;	// get a random (accessible) spot for the first WP

	_wp = _group addWaypoint [_wpPos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCompletionRadius 1000;
	_wp setWaypointStatements ["true", "[group this] spawn fnc_aoSAD"];
	[waypointPosition _wp, "mil_destroy", "ColorYellow", format["First WP for %1",_group]] call _fnc_debugMarkers;

	_group
};

fnc_boughtHelp = {
	//	_group = [_spawn, _caller, _vehicleClass, _maxPassengerAmount, _code] call fnc_boughtHelp;
	// 	Usage:
	//	_group = [indySpawn, player, ([side player,2] call fnc_defaultBoughtHelpVehicleArrays), 5, {}] call fnc_boughtHelp;

	params [
		["_spawn", objNull],
		["_caller", objNull],
		["_vehicleClass", ""],
		["_maxPassengerAmount", -1],
		["_code", {}]
	];

	_fnc_debugMarkers = {
		// for the debug markers
		// _debugMarker = [_debugMarkerPos, _debugMarkerType, _debugMarkercolor, _debugMarkerText] call _fnc_debugMarkers;
		// [objNull, "mil_destroy", "ColorYellow", "text"] call _fnc_debugMarkers;
		params [
			[ "_debugMarkerPos", objNull],
			[ "_debugMarkerType", "mil_destroy"],
			[ "_debugMarkercolor", "ColorYellow"],
			[ "_debugMarkerText", ""],
			[ "_debugMarkerAlpha", 0.9]
		];
		private "_debugMarker";

		if (missionNamespace getVariable ['aDebugMessages',false]) then {
			_debugMarkerPos = _debugMarkerPos call BIS_fnc_position;
			_debugMarkerId = round(random 50000)+100000; 
			_debugMarker = createMarker [format["_USER_DEFINED %1",_debugMarkerId], _debugMarkerPos]; 
			_debugMarker setMarkerType _debugMarkerType; 
			_debugMarker setMarkerColor _debugMarkercolor;
			_debugMarker setMarkerText _debugMarkerText;
			_debugMarker setMarkerAlpha _debugMarkerAlpha;
		};
		_debugMarker;
	};
	if (missionNamespace getVariable ['aDebugMessages',false]) then { diag_log '- fnc_boughtHelp Start -';};
	//-
	if (_maxPassengerAmount == -1) then {
		_maxPassengerAmount = 17;
	};

	// spawn position selection
	_spawnPos = _spawn call BIS_fnc_position;
	_callerPos = _caller call BIS_fnc_position;
	_specificSpawn = [_spawnPos, 0, 40, 5, 0] call BIS_fnc_findSafePos;	// find a safe spawn spot

	// vehicle spawning
	_result = [_specificSpawn, _specificSpawn getDir _callerPos, _vehicleClass, side _caller] call BIS_fnc_spawnVehicle;
	_result params ["_vehicle", "_crew", "_group"]; 
	_group deleteGroupWhenEmpty true;

	// passenger spawning
	private _spawnedPassengerAmount = 0;
	while {(_vehicle emptyPositions "cargo" >= 1) && (_spawnedPassengerAmount < _maxPassengerAmount)} do { // as long as there is an empty spot AND _maxPassengerAmount not reached
		_group createUnit [selectRandomWeighted ([side _caller] call fnc_defaultRandomInfantryArrays), getPos _vehicle, [], 0, "CARGO"];	// creates a random infantry from the _caller's side's list set by fnc_defaultRandomInfantryArrays
		_spawnedPassengerAmount = _spawnedPassengerAmount+1;
		if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['_spawnedPassengerAmount : %1',_spawnedPassengerAmount];};
	};

    _group setVariable ["helpCaller", _caller];	// saves the caller as a variable for the group

	_wpPos = [_callerPos, 0, 10, 2, 0, 30] call BIS_fnc_findSafePos;	// get a random (accessible) spot for the WP

	_wp = _group addWaypoint [_wpPos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointSpeed "FULL";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointCompletionRadius 500;
	[waypointPosition _wp, "mil_destroy", "ColorYellow", format["Reinforcement Spot %1",_group]] call _fnc_debugMarkers;

	_wp = _group addWaypoint [_wpPos, 20];
	_wp setWaypointType "SAD";
	_wp setWaypointSpeed "NORMAL";
	_wp setWaypointCompletionRadius 20;
	_wp setWaypointStatements ["true", "[group this, getPos this, 100] call BIS_fnc_taskPatrol"];
	_group
};