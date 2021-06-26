fnc_addAceFullHealStation = {
	// [_unit] spawn fnc_addAceFullHealStation;
	params[
		["_unit",objNull]
	];
	_addFullHealAction = ["healUser","Fully Heal","",{[_player] call ace_medical_treatment_fnc_fullHealLocal;},{true},{},[], [0,0,0], 100] call ace_interact_menu_fnc_createAction;
	[_unit, 0, ["ACE_MainActions"], _addFullHealAction] call ace_interact_menu_fnc_addActionToObject;
};

// apply heal to all heal objects
private _medicalObjectsCondition = { 
	params[ 
		["_unit",objNull] 
		];
	(typeOf _unit == "B_Slingload_01_Medevac_F") || 
	(typeOf _unit == "Land_Pod_Heli_Transport_04_medevac_F") || 
	(typeOf _unit == "Land_PortableCabinet_01_medical_F") || 
	(typeOf _unit == "O_Heli_Transport_04_medevac_F") 
};
 
allMedicalObjects = allMissionObjects "" select { [_x] call _medicalObjectsCondition }; 

{ 
	[_x] spawn fnc_addAceFullHealStation; 
} forEach allMedicalObjects;