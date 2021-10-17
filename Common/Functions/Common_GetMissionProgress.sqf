//Last modified 7/04/07
//*****************************************************************************************
//Description: Create and sort the control sequence for a squad's mission.
//_this = [team name, mission sequence]
//*****************************************************************************************
Private["_name","_baseCount","_sequence","_group","_side","_base","_objective","_missionLoc"];

_name = _this select 0;
call compile format ["_group = %1",_name];
_sequence = _this select 1;
_side = side leader _group;
_missionloc = objNull;

	for [{_baseCount = 0},{_baseCount <= ((count _sequence) - 2)},{_baseCount = _baseCount + 1}] do
	{
		if (call compile format["_side == %1Side",(_sequence select _baseCount)]) then
		{
			call compile format["_base = _sequence select _baseCount",_name];
			call compile format["_objective = _sequence select (_baseCount + 1)",_name];
		};
	};

call compile format["%1Base = _base",_name];
call compile format["%1Objective = _objective",_name];

Call Compile Format["_missionLoc = %1MissionLocation",_name];
//player sideChat format ["Team: %1 - Mission: %2 -- Base: %3 - Target: %4",_name,_missionLoc,_base,_objective];

//*****************************************************************************************
//05/3/07 BvP - Created file.