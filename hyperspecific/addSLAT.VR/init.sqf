diag_log "----------- MAP START -------------------------------------------------------------------------------------------------------------------------";
missionNamespace setVariable ["aDebugMessages", true];

someCondition = (
	1 == 1
);

someAction = {
	params ["_target", "_player", "_type"];
	hint format["%1",_type];
};

["Land_RepairDepot_01_green_F", 4, someCondition, someAction] execVM "ar_fnc_addComponentsActions.sqf";

[apc, 0, ["ACE_MainActions"], addSlatAction] call ace_interact_menu_fnc_addActionToObject;
[apc, 0, ["ACE_MainActions"], addCamoAction] call ace_interact_menu_fnc_addActionToObject;