
// player-based TODO
ars_fnc_enemyKilled_extended = {

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