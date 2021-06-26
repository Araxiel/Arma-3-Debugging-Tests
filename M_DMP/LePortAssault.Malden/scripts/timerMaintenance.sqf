private ["_executeTime"];
_executeTime = 15; // 15 seconds

_replaceFirstAidWithAce = {
	//params [_locationArray];

	{
		[_x] spawn fnc_replaceFirstAidWithAceUnit;
	} forEach allUnits;

	{
		[_x] spawn fnc_replaceFirstAidWithAceCargo;
	} forEach vehicles;

};

// Clockwork
_realTickTime = 0; // declare the local variable for the loop compare.

while {true} do // loops for entire duration that mission/server is running.
{
	_ticksBegin = round(diag_TickTime); // tick time begin.
	if (_realTickTime >= _executeTime) then // check _realTickTime against _executeTime.
	{
		[] call _replaceFirstAidWithAce; // call the function.
		_realTickTime = 0; // reset the timer back to 0 to allow counting to 300 again.
	};
	uiSleep 1; // sleep for one second.
	_ticksEnd = round(diag_TickTime); // tick time end.
	_ticksEndLoop = round(_ticksEnd - _ticksBegin); // get 'real' (rounded) tick time due to loop latency/calls.
	_realTickTime = _realTickTime + _ticksEndLoop; // increase the tick counter.
};