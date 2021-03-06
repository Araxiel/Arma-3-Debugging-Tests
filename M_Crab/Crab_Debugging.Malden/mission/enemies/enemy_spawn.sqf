diag_log "enemies\enemy_spawn.sqf";

_selected_sector = selectRandom (missionNamespace getVariable "spawnpoints_enemy_road");

_group = [getPos _selected_sector, EAST, 3] call BIS_fnc_spawnGroup; 
_group deleteGroupWhenEmpty true;
 
{ 
	_x addEventHandler ["Killed", { 
		params ["_unit", "_killer", "_instigator", "_useEffects"]; 
		[_unit,_killer,_instigator] execVM "mission\enemies\_enemy_killed.sqf"; 
	}];
	;
} forEach units _group;
 
_wp1 = _group addWaypoint [[sectors_blufor, getPos (leader _group)] call BIS_fnc_nearestPosition, 0]; 
_wp1 setWaypointType "MOVE";