//Last modified 5/9/8
//*****************************************************************************************
//Description: Sends stats to players.
//*****************************************************************************************
Private["_count","_count1","_sideText","_teams","_total","_voteTime"];

PublicVariable "civilianCasualties";
PublicVariable "eastCasualties";
PublicVariable "westCasualties";
PublicVariable "resistanceCasualties";

PublicVariable "westVehiclesCreated";
PublicVariable "westVehiclesLost";
PublicVariable "westUnitsCreated";

PublicVariable "eastVehiclesCreated";
PublicVariable "eastVehiclesLost";
PublicVariable "eastUnitsCreated";

PublicVariable "resistanceVehiclesCreated";
PublicVariable "resistanceVehiclesLost";
PublicVariable "resistanceUnitsCreated";

if (!IsNil "EastBaseSpottedPosition") then {PublicVariable "EastBaseSpottedPosition"};
if (!IsNil "WestBaseSpottedPosition") then {PublicVariable "WestBaseSpottedPosition"};

WaitUntil {gameInitialized};

for [{_count1 = 0},{_count1 < 2},{_count1 = _count1 + 1}] do
{
	_teams = eastTeams;
	_sideText = "East";

	if (_count1 == 1) then {_teams = westTeams;_sideText = "West"};

	_voteTime = Call Compile Format["%1CommanderVoteTime",_sideText];
	Call Compile Format["PublicVariable ""%1CommanderVoteTime""",_sideText];

	Call Compile Format ["PublicVariable ""%1StartingLocation""",_sideText];

	_total = Count _teams;

	for [{_count = 0},{_count < _total},{_count = _count + 1}] do
	{
		//If a vote is in progress then send the current value to the player.
		if (_voteTime > 0) then
		{
			Call Compile Format["PublicVariable ""%1Team%2Vote""",_sideText,_count + 1];
		};

		_name = Format["%1Player%2",_sideText,_count + 1];
		Call Compile Format["PublicVariable ""%1Funds""",_name];
		Call Compile Format["PublicVariable ""%1Rank""",_name];
		Call Compile Format["PublicVariable ""%1Points""",_name];

		_name = Format["%1Team%2",_sideText,_count + 1]
		Call Compile Format["PublicVariable ""%1Mission""",_name];
		Call Compile Format["PublicVariable ""%1MissionX"";PublicVariable ""%1MissionY""",_name];

		Call Compile Format["PublicVariable ""%1AIMissionX"";PublicVariable ""%1AIMissionY""",_name];
		Call Compile Format["PublicVariable ""%1AITeamType""",_name];
		Call Compile Format["PublicVariable ""%1AIMission""",_name];
	};
};

//*****************************************************************************************
//12/18/7 MM - Created file.
