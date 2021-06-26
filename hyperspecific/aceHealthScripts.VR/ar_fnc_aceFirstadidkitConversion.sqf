fnc_replaceFirstAidWithAceCargo = {
	// [_object] spawn fnc_replaceFirstAidWithAceCargo;

	params [
		['_object', objNull]
	];

	_cargo = getWeaponCargo _object;
	_aidKitIndex = _cargo #0 findIf { _x == "FirstAidKit" };

	if (_aidKitIndex == -1) then {
		_cargo = getItemCargo _object;
		_aidKitIndex = _cargo #0 findIf { _x == "FirstAidKit" };
	};

    if (_aidKitIndex == -1) exitWith {};

	_aidKitAmount = _cargo #1 #(_aidKitIndex);
	for "_i" from 0 to (_aidKitAmount-1) do { 
		_object addItemCargoGlobal ["ACE_morphine", 1]; 
		_object addItemCargoGlobal ["ACE_epinephrine", 1]; 
		_object addItemCargoGlobal ["ACE_fieldDressing", 1]; 
		_object addItemCargoGlobal ["ACE_tourniquet", 1]; 
		_object addItemCargoGlobal ["ACE_splint", 1]; 
		[_object, "FirstAidKit"] call CBA_fnc_removeWeaponCargo;
		[_object, "FirstAidKit"] call CBA_fnc_removeItemCargo;
	};
	if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log Format ['Converted FirstAidKit in %1',_object];};
};

fnc_replaceFirstAidWithAceUnit = {

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