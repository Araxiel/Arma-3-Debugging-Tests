diag_log "----------- MAP START -------------------------------------------------------------------------------------------------------------------------";

aDebugMessages = true;

execVM "initFunctions.sqf";

[] spawn {
	while {true} do {
		execVM "initFunctions.sqf";
		sleep 2;
	}
};
