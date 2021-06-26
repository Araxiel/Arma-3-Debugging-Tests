private ["_executeTime"];
_executeTime = 10; // 15 seconds

_income = {

	_incomeMultiplier = missionNamespace getVariable ["asb_incomeMultiplier",1];
	_gainedCR = round (1 * _incomeMultiplier);
	[independent, _gainedCR] call grad_lbm_fnc_addFunds;
	[blufor, _gainedCR] call grad_lbm_fnc_addFunds;
	[opfor, _gainedCR] call grad_lbm_fnc_addFunds;
	{
		[_x, _gainedCR] call grad_lbm_fnc_addFunds;
	} forEach allPlayers;

	// because currently sides are used
	{
		[_x, [side _x] call grad_lbm_fnc_getFunds] call grad_lbm_fnc_setFunds;
	} forEach allPlayers;

};

// Clockwork
_realTickTime = 0; // declare the local variable for the loop compare.

while {true} do // loops for entire duration that mission/server is running.
{
	_ticksBegin = round(diag_TickTime); // tick time begin.
	if (_realTickTime >= _executeTime) then // check _realTickTime against _executeTime.
	{
		[] call _income; // call the function.
		_realTickTime = 0; // reset the timer back to 0 to allow counting to 300 again.
	};
	uiSleep 1; // sleep for one second.
	_ticksEnd = round(diag_TickTime); // tick time end.
	_ticksEndLoop = round(_ticksEnd - _ticksBegin); // get 'real' (rounded) tick time due to loop latency/calls.
	_realTickTime = _realTickTime + _ticksEndLoop; // increase the tick counter.
	if ((["passiveIncomeEnabled", 1] call BIS_fnc_getParamValue) == 0) exitWith { if (missionNamespace getVariable ['aDebugMessages',false]) then {diag_log '- No Passive Income -';}; };
};