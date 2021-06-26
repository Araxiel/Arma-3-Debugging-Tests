// TODO
// enemy killed income given to team
ars_fnc_enemyKilled = {

	params [
		['_unit', objNull],
		['_killer', objNull],
		['_instigator', objNull]
	];
	if (isNull _unit) exitWith {
			if (missionNamespace getVariable ['aDebugMessages',false]) then { diag_log '- Exiting killed EventHandler because _unit isNull -';};
	};

	// debug info
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %1 - Killed eventholder pre-spawn for %1 -',_unit];};
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %2 -- _killer : %1',_killer,_unit];};
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %2 -- _instigator : %1',_instigator,_unit];};
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %2 -- vehicle : %1',vehicle _unit,_unit];};
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %2 -- vehicle _killer : %1',vehicle _killer,_unit];};
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %1 -- Killed eventholder post-spawn for %1 -',_unit];};
 
	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};	// UAV kill
	if (isNull _instigator) then {_instigator = _killer};	// roadkill
	// if vehicle unit is inside if is being blown up
	if ((_instigator == _killer) && (_instigator == _unit)) then {
		_instigator = vehicle _unit getVariable ["asb_killer",objNull];
	};
	if (isNull _instigator) exitWith {
		if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %1 -- Exiting cause _instigator still isNull -',_unit];};
	};

	_CRperKill = missionNamespace getVariable ["asb_defaultCRperKill",10];
	_incomeMultiplier = missionNamespace getVariable ["asb_incomeMultiplier",1];
	_gainedCR = _CRperKill * _incomeMultiplier;

	_unitDisplayName = gettext (configfile >> "CfgVehicles" >> typeOf(_unit) >> "displayName");

	if ((_unit isKindof "LandVehicle") || (_unit isKindof "Air") || (_unit isKindof "Ship")) then {

		_unit setVariable ["asb_killer", _instigator];
		// multiplier for vehicle type
		if (_unit isKindof "Tank") then {_gainedCR = _gainedCR * 4 ;};
		if (_unit isKindof "Wheeled_APC_F") then {_gainedCR = _gainedCR * 2.5 ;};
		if (_unit isKindof "Air") then {_gainedCR = _gainedCR * 3 ;};
		if (_unit isKindof "Ship") then {_gainedCR = _gainedCR * 1.75 ;};
		if (_unit isKindof "Car") then {_gainedCR = _gainedCR * 1.5 ;};
		// negative if friendly
		if (_unit isKindof "Car") then {_gainedCR = _gainedCR * 1.5 ;};

		[_instigator, _gainedCR, _unitDisplayName,_unit] spawn {
			params [
				['_instigator', objNull],
				['_gainedCR', 10],
				['_unitDisplayName', "Enemy"],
				['_unit', objNull]
			];
			// debug info
			if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %2 ---- _instigator : %1',_instigator,_unit];};
			if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %2 ---- _unitDisplayName : %1',_unitDisplayName,_unit];};
			// --
			// 	TODO sleep timer
			_sleepTimer = 1+random(1);
			sleep _sleepTimer;

			if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ["- %4 - %3 got cr%1 for eliminating %2", _gainedCR, _unitDisplayName, side _instigator,_unit];};
			if (player == _instigator) then {
				systemChat format["Your side got cr%1 for you eliminating %2", _gainedCR, _unitDisplayName];
			} else {

			};
			[side _instigator, _gainedCR] call grad_lbm_fnc_addFunds;
		};
	};

	if (_unit isKindof "Man") then {

		[_instigator, _gainedCR, _unitDisplayName,_unit] spawn {
			params [
				['_instigator', objNull],
				['_gainedCR', 10],
				['_unitDisplayName', "Enemy"],
				['_unit', objNull]
			];
			// debug info
			if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %2 --- _instigator : %1',_instigator,_unit];};
			if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- %2 --- _unitDisplayName : %1',_unitDisplayName,_unit];};
			// --
			// 	TODO sleep timer
			_sleepTimer = 1+random(1);
			sleep _sleepTimer;
			
			if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ["- %4 - %3 got cr%1 for eliminating %2", _gainedCR, _unitDisplayName, side _instigator,_unit];};
			if (player == _instigator) then {
				systemChat format["Your side got cr%1 for eliminating %2", _gainedCR, _unitDisplayName];
			};
			[side _instigator, _gainedCR] call grad_lbm_fnc_addFunds;
		};
	};

};

ars_fnc_addKilledEventHandler = {
	_this #0 addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator"];
		[ _unit, _killer, _instigator] spawn ars_fnc_enemyKilled;
	}];
};