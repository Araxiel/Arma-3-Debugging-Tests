// bought radar
fnc_spawnRadar = {
	[getPos indRadarSpot, getDir indRadarSpot, "I_E_Radar_System_01_F", independent] call BIS_fnc_spawnVehicle;
};
// SLAT components
addComponentsCondition = (
	([independent] call grad_lbm_fnc_getFunds) > 10
);
addComponentsResult = {
	params ["_target", "_player", "_type"];
	[side _player, -10] call grad_lbm_fnc_addFunds;
};

["Land_RepairDepot_01_green_F", 4, addComponentsCondition, addComponentsResult] execVM "scripts\ar_fnc_addComponentsActions.sqf";
addAddComponentActions = {
	params ["_target"];
	[_target, 0, ["ACE_MainActions"], addSlatAction] call ace_interact_menu_fnc_addActionToObject;
	[_target, 0, ["ACE_MainActions"], addCamoAction] call ace_interact_menu_fnc_addActionToObject;
};

// Support Charges
fnc_supportChargesCalc = {
	// [_type] call fnc_supportChargesCalc;
	// ["Cas"] call fnc_supportChargesCalc;
	// var: "CasCharges"
	//
	// example condition: (missionNameSpace getVariable ["CasCharges",0]) > 0

	params[
		["_type","Cas"],
		["_unit",objNull]
	];

	_name = format ["%1Charges",_type];

	_chargesAmount = missionNameSpace getVariable [_name,0];
	_chargesAmount = _chargesAmount - 1 ;
	missionNameSpace setVariable [_name,_chargesAmount];
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['%1: %2',_name,_chargesAmount];};

};

// teleport
_actionToHeliport = ["toHeliport","Travel to Heliport","",{_player setPos (getPos heloTeleportSpot);},{true}] call ace_interact_menu_fnc_createAction;
_actionToBase = ["toBase","Travel to Base","",{_player setPos (getPos baseTeleportSpot);},{true}] call ace_interact_menu_fnc_createAction;
_actionToDock = ["toBase","Travel to Dock","",{_player setPos (getPos dockTeleportSpot);},{true}] call ace_interact_menu_fnc_createAction;

[basePhone, 0, ["ACE_MainActions"], _actionToHeliport] call ace_interact_menu_fnc_addActionToObject;
[basePhone, 0, ["ACE_MainActions"], _actionToDock] call ace_interact_menu_fnc_addActionToObject;
[heloPhone, 0, ["ACE_MainActions"], _actionToBase] call ace_interact_menu_fnc_addActionToObject;
[heloPhone, 0, ["ACE_MainActions"], _actionToDock] call ace_interact_menu_fnc_addActionToObject;
[dockPhone, 0, ["ACE_MainActions"], _actionToHeliport] call ace_interact_menu_fnc_addActionToObject;
[dockPhone, 0, ["ACE_MainActions"], _actionToBase] call ace_interact_menu_fnc_addActionToObject;

// stores
_addStores = [] spawn {
	// [object,buyables set,cargospace,vehiclespawn,shopname,action description,condition,position,distance,action path,account] call grad_lbm_fnc_addInteraction
	[baseScreen,"BaseStore",baseRequistionBox,baseBuyPoint,"Requisition Menu","Requisition Equipment",{side player == independent},[0,0,0],["_distance",3],["ACE_MainActions"],independent] call grad_lbm_fnc_addInteraction;
	[heloScreen,"HelipadStore",helipadBox,helipadSpot,"Helo Requisition Menu","Requisition Helicopters",{side player == independent},[0,0,0],["_distance",3],["ACE_MainActions"],independent] call grad_lbm_fnc_addInteraction;
};

fnc_dmp_unitInit = {
	params[
		["_unit",objNull]
	];
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['------------- fnc_dmp_unitInit _unit : %1',_unit];};
	[_unit] spawn ars_fnc_addKilledEventHandler;

	// [dood] call fnc_dmp_unitInit;
};

fnc_purchaseMessage = {
	// [_buyer, _object, _objectType, _stringType] call fnc_purchaseMessage;
	params[
		["_buyer",objNull],
		["_object",""],
		["_objectType","CfgVehicles"],
		["_stringType",1]
	];
	// _stringType: 0 for string, 1 for Cfg Name
	// _objectTypes examples:
	// CfgVehicles, CfgWeapons, 

	if (_stringType == 1) then {
		_object = gettext (configfile >> _objectType >> _object >> "displayName"); 
	};
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['- STORE: %1 purchased %2',name _buyer, _object];};
	_msgString = format ['%1 purchased %2',name _buyer, _object];
	
	[[side _buyer, "Base"], _msgString] remoteExec ["sideChat", [0, -2] select isDedicated];
};