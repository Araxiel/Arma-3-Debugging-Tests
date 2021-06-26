//[AiCacheDistance(players),TargetFPS(-1 for Auto),Debug,CarCacheDistance,AirCacheDistance,BoatCacheDistance]execvm "zbe_cache\main.sqf";

if (isServer) then {[1500,-1,false,1700,2000,1500]execvm "zbe_cache\main.sqf"};
execVM "scripts\randomWeather2.sqf";