ars_fnc_enemyKilled = {

	params [
		['_unit', objNull],
		['_killer', objNull],
		['_instigator', objNull]
	];

	_killerGroupArray = units group _instigator;
	_killerGroupArrayPlayers = _killerGroupArray select { isPlayer _x };
	diag_log format ["_killerGroupArrayPlayers: %1",_killerGroupArrayPlayers];

	private ["_killConfirmation","_defaultCRperKill","_unitDisplayName"];
	_killConfirmation = missionNamespace getVariable ["killConfirmation",true];
	_defaultCRperKill = missionNamespace getVariable ["ars_defaultCRperKill",10];

	_unitDisplayName = gettext (configfile >> "CfgVehicles" >> typeOf(_unit) >> "displayName");

	{
		// testing variable
		_currentCR = _x getVariable ["credits",0];
		_x setVariable ["credits",_currentCR + _defaultCRperKill];
		// --
		if ( (player == _x) AND (_killConfirmation) ) then {
			systemChat format["You got cr%1 for eliminating %2", _defaultCRperKill, _unitDisplayName];
		};
	} forEach _killerGroupArrayPlayers;

	diag_log "_killerGroupArrayPlayers DONE";
	
	_allPlayers = call BIS_fnc_listPlayers;
	_otherPlayers = _allPlayers - _killerGroupArrayPlayers;
	diag_log format ["_otherPlayers: %1",_otherPlayers];

	//{
	//	diag_log format ["forEach _otherPlayers, _x: %1",_x];
	//	// testing variable
	//	_currentCR = _x getVariable ["credits",0];
	//	_x setVariable ["credits",_currentCR + (_defaultCRperKill/2)];
	//	// --
	//	if ( (player == _x) AND (_killConfirmation) ) then {
	//		systemChat format["Your got cr%1 for your team eliminating %2", _defaultCRperKill/2, _unitDisplayName];
	//	};
	//} forEach _otherPlayers;
	diag_log "ars_fnc_enemyKilled DONE";
	diag_log "----";

};

fnc_spawnDoods = {
	diag_log "---";
	_group = [getPos enemySpawn, EAST, 5] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;

	{
		_x addEventHandler ["Killed", { 
			params ["_unit", "_killer", "_instigator", "_useEffects"]; 
			[_unit,_killer,_instigator] spawn ars_fnc_enemyKilled; 
		}];
	} forEach units _group;
};

fnc_spawnDood = {
	if (missionNamespace getVariable ['aDebugMessages',false]) then { diag_log '- fnc_spawnDood Start -';};

	_group = [getPos enemySpawn, EAST, 1] call BIS_fnc_spawnGroup;
	_group deleteGroupWhenEmpty true;
	diag_log format ["_group: %1",_group];
	diag_log format ["units _group: %1",units _group];
	private ["_eh"];

	{
		_eh = _x addEventHandler ["Killed", { 
			params ["_unit", "_killer", "_instigator", "_useEffects"]; 
			[_unit,_killer,_instigator] spawn ars_fnc_enemyKilled; 
		}];
		diag_log format ["_eh: %1",_eh];
		diag_log format ["_x: %1",_x];
	} forEach units _group;

	if (missionNamespace getVariable ['aDebugMessages',false]) then { diag_log '- fnc_spawnDood Done -';};
};


araace_fnc_replaceFirstAidWithAceCargo = {

	params [
		['_object', objNull]
	];

	_cargo = getWeaponCargo _object;
	_aidKitIndex = _cargo #0 findIf { _x == "FirstAidKit" };

	if (_aidKitIndex > 0) then {
		
		_aidKitAmount = _cargo #1 #(_aidKitIndex);
		for "_i" from 0 to (_aidKitAmount-1) do { 
			_object addItemCargoGlobal ["ACE_morphine", 1]; 
			_object addItemCargoGlobal ["ACE_epinephrine", 1]; 
			_object addItemCargoGlobal ["ACE_fieldDressing", 1]; 
			_object addItemCargoGlobal ["ACE_tourniquet", 1]; 
			_object addItemCargoGlobal ["ACE_splint", 1]; 
		};
		[_object, "FirstAidKit"] call CBA_fnc_removeWeaponCargo;
	
	} else {
		if (missionNamespace getVariable ['aDebugMessages',false]) then {"No First Aid Kits" call BIS_fnc_error;};
	};
	
};

araace_fnc_replaceFirstAidWithAceUnit = {

	params [
		['_object', objNull]
	];

	_items = items _object;
	_aidkitCount = { _x == "FirstAidKit" } count _items;
	for "_i" from 0 to (_aidkitCount-1) do {
		_object removeItem "FirstAidKit";
		_object addItem "ACE_morphine";
		_object addItem "ACE_epinephrine";
		_object addItem "ACE_fieldDressing";
		_object addItem "ACE_tourniquet";
		_object addItem "ACE_splint";
	};
};

fnc_skyFlare = {

	/* 	https://www.reddit.com/r/armadev/comments/393f15/creating_repeat_sky_flares/cs9q4ve/?utm_source=reddit&utm_medium=web2x&context=3
		added onto by Araxiel
		Original usages:
			skyFlares.sqf
			startFlares = 1; null = [<max distance>, <base delay>, <max added delay>, <base height>, <random added or subtracted height>, <color>, <speed (must be negative)>, <object pos>] execVM "skyFlares.sqf";
			Given Example:
			startFlares = 1; null = [150, 30, 5, 150, 10, "WHITE", -8, player] execVM "skyFlares.sqf";

			<max distance> is the maximum distance each flare can spawn from the given position. The distance ranges from 0 meters to the number you supply.
			<base delay> is the base number of seconds before a new flare can be spawned.
			<max added delay> is the maximum amount of more seconds randomly added to this delay.
			<base height> is the base height of each flare.
			<random added or subtracted height> is a maximum amount of meters that can be randomly added to or subtracted from the base height.
			<color> is the color of the flare. Available colors are "WHITE", "RED", "GREEN", "YELLOW", or "IR". If you make this "RANDOM" each flare will be a random color.
			<speed> is the speed of the flare. Same velocity command you used. Must be negative or flares will tend to freeze in the air.
			<object pos> the object the flares will be centered around. The player for example.
		Edited usage example:
			--
			missionNameSpace setVariable ["startFlares",true];
			[150, 30, 5, 150, 10, "WHITE", -8, player] spawn fnc_skyFlare;
			--
			
	*/
	// organize our arguments
	params [
		[ "_flareDist", 150],
		[ "_delay", 30],
		[ "_delayRandom", 5],
		[ "_flareHeight", 200],
		[ "_flareHeightRandom", 10],
		[ "_flareType", "WHITE"],
		[ "_flareSpeed", -8],
		[ "_flarePos", player]
	];
	
	// declare a few variables we need and make _sign randomly negative; for randomising if either height is added or taken away.
	_sign = 1;
	_random = false;
	if (floor random 10 > 4) then { _sign = -1 };
	_flareArrayColors = ["WHITE", "RED", "GREEN", "YELLOW"];
	_flareArrayAll = _flareArrayColors + ["IR"];

	// create loop for spawning flares
	while { (missionNameSpace getVariable ["startFlares",false]) } do
	{
		// check if random
		if (_flareType == "RANDOM") then { _flareType = _flareArrayColors call BIS_fnc_selectRandom; _random = true };
		// assign colors
		switch (_flareType) do
		{
			case "WHITE": 	{ _flareType = "F_40mm_White" };
			case "RED": 	{ _flareType = "F_40mm_Red" };
			case "GREEN": 	{ _flareType = "F_40mm_Green" };
			case "YELLOW": 	{ _flareType = "F_40mm_Yellow" };
			case "IR": 		{ _flareType = "F_40mm_CIR" };
		};
		// get a random spot around the target
		_pos = [_flarePos, random _flareDist, random 360] call BIS_fnc_relPos;
		_pos = [_pos select 0, _pos select 1, _flareHeight + (random _flareHeightRandom * _sign)];
		// make the flare at that spot
		_flare = _flareType createVehicle _pos;
		// set its speed
		_flare setVelocity [0, 0, _flareSpeed];
		// delay plus random delay
		sleep _delay + random _delayRandom;
		// reset random if it was there before
		if (_random) then { _flareType = "RANDOM" };
	};
};

fnc_inaccurateArtyFlare = {
	
    // [_arty, _flareTarget, _flareDist, _delay, _delayRandom, _clusterAmount, _clusterDelay, _overwriteStartFlares, _overwriteMaxShots, _rearm] spawn fnc_inaccurateArtyFlare;
    // [manMortar, player, 200, 10, 15, 5, 180, true, 6] spawn fnc_inaccurateArtyFlare;
    // to stop: missionNamespace setVariable ['startFlares',false]

    params [
		[ "_arty", objNull],
		[ "_flareTarget", objNull],
		[ "_flareDist", 300],
		[ "_delay", 10],
		[ "_delayRandom", 15],
		[ "_clusterAmount", 5],
		[ "_clusterDelay", 180],
		[ "_overwriteStartFlares", false],
		[ "_overwriteMaxShots", 6],
		[ "_rearm", true]
    ];

	// for the debug markers
	// _debugMarker = [_debugMarkerPos, _debugMarkerType, _debugMarkercolor, _debugMarkertext] call _fnc_debugMarkers;
	// [objNull, "mil_destroy", "ColorYellow", "text"] call _fnc_debugMarkers;
	_fnc_debugMarkers = {
		params [
			[ "_debugMarkerPos", objNull],
			[ "_debugMarkerType", "mil_destroy"],
			[ "_debugMarkercolor", "ColorYellow"],
			[ "_debugMarkertext", ""]
		];
		private ["_debugMarker"];

		if (missionNamespace getVariable ['aDebugMessages',false]) then {
			_debugMarkerPos = _debugMarkerPos call BIS_fnc_position;
			_debugMarkerId = round(random 50000)+100000; 
			_debugMarker = createMarker [format["_USER_DEFINED %1",_debugMarkerId], _debugMarkerPos]; 
			_debugMarker setMarkerType _debugMarkerType; 
			_debugMarker setMarkerColor _debugMarkercolor;
			_debugMarker setMarkerText _debugMarkertext;
		};
		_debugMarker
	};

    private ["_flaresOn"];
    if (_overwriteStartFlares) then {
        _flaresOn = true;
    } else {
        _flaresOn = missionNameSpace getVariable ["startFlares",false];
    };

    _magazine = "8Rnd_82mm_Mo_Flare_white";
    private ["_startAmmo"];
    _startAmmo = _arty magazineTurretAmmo [_magazine, [0]];

	private ["_flareTargetCurrent"];
    _flareTargetCurrent = _flareTarget call BIS_fnc_position;
	private ["_flaresFiredTotal"]; _flaresFiredTotal = 0;
	private ["_shotsFiredInCluster"]; _shotsFiredInCluster = 0;
	// create loop for spawning flares
	while { (_flaresOn) } do
	{
		// get a random spot around the target
		_pos = [_flareTargetCurrent, random _flareDist, random 360] call BIS_fnc_relPos;
		// order shot
		[_pos, "mil_dot", "ColorBlue"] call _fnc_debugMarkers;
        _arty doArtilleryFire [_pos, _magazine, 1];
		// delay plus random delay
        if (_rearm) then {
            _arty setMagazineTurretAmmo [_magazine, _startAmmo, [0]];
        };
		sleep _delay + random _delayRandom;

		// check if cluster max reached
        _shotsFiredInCluster = _shotsFiredInCluster + 1;
		if (_shotsFiredInCluster >= _clusterAmount) then {
			if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log '- Cluster Finished -';};
            sleep _clusterDelay-30 + random 60;
			_shotsFiredInCluster = 0;
			// get intended target's position
			_flareTarget = _flareTarget call BIS_fnc_position;	// update target's actual position
			// debug marker
			[_flareTargetCurrent, "mil_destroy", "ColorYellow", "Old Position"] call _fnc_debugMarkers;
			// create a new point somwhere between old and actual
			_adjustedAzimuth = _flareTargetCurrent getDir _flareTarget;
			_adjustedDistance = _flareTargetCurrent distance _flareTarget;
    		_flareTargetCurrent = _flareTargetCurrent getPos [(_adjustedDistance/2)+(random _adjustedDistance/2), _adjustedAzimuth];
			// debug marker
			[_flareTargetCurrent, "mil_destroy", "ColorOrange", "New Position"] call _fnc_debugMarkers;
        };

        // just a check to actually stop if overwrite on, overwriting the overwrite
        _flaresFiredTotal = _flaresFiredTotal + 1;
        if (_overwriteStartFlares && (_flaresFiredTotal >= _overwriteMaxShots) ) then {
            _flaresOn = false;
        };
		// just debugging messages
        if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['[_flaresFiredTotal,_shotsFiredInCluster] : %1',[_flaresFiredTotal,_shotsFiredInCluster]];};
		if (_overwriteStartFlares) then {
			if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['_overwriteMaxShots : %1',_overwriteMaxShots];};
		};
	};
	if (missionNamespace getVariable ['aDebugMessages',false]) then { diag_log '- Flare Arty Over -';};
};