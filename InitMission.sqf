//Last modified 3/30/8
//Description: This is called when the mission starts & begins game execution on server & clients.
//40 player version.

OnPlayerConnected "[_name] Exec ""Server\Server_PlayerConnected.sqs""";
OnPlayerDisconnected "[_name] Exec ""Server\Server_PlayerDisconnected.sqs""";

EnableTeamSwitch false;
{RemoveSwitchableUnit _x} ForEach SwitchableUnits;

//Starting parameters.
fastTime = false;
easierAI = false;
nightMission = false;
noGrass = false;
noFastTravel = false;
enableArtillery = true;

//Setting true can make game last longer (AIs won't attack bases when all players are absent from game).
longerPersistentServerGame = false;

_options = param1;

if (_options >= 8) then {enableArtillery = false;_options = _options - 8};
if (_options >= 4) then {fastTime = true;_options = _options - 4};
if (_options >= 2) then {noGrass = true;_options = _options - 2};
if (_options >= 1) then {nightMission = true;_options = _options - 1};

if (noGrass) then {SetTerrainGrid 50};
if (nightMission && daytime > 3 && daytime < 20) then {SkipTime 12};

destroyBase = true;
minutesLeft = -1;
scoreToWin = -1;

if (param2 == 1) then {destroyBase = false};
if (param2 == 2) then {minutesLeft = 30};
if (param2 == 3) then {minutesLeft = 60};
if (param2 == 4) then {minutesLeft = 90};

if (param2 == 5) then {scoreToWin = 100};
if (param2 == 6) then {scoreToWin = 200};
if (param2 == 7) then {scoreToWin = 500};
if (param2 == 8) then {scoreToWin = 1000};

timeGameOver = -1;
if (minutesLeft != -1) then {timeGameOver = time + minutesLeft * 60};

gameStarted = false;
gameInitialized = false;
commonInitComplete = false;
commonFunctionsCompiled = false;

VOTETIME = 60;

//Advanced squads
eastTeams = [Group EastSlot1,Group EastSlot2,Group EastSlot3,Group EastSlot4,Group EastSlot5,Group EastSlot6,Group EastSlot7,Group EastSlot8,Group EastSlot9,Group EastSlot10,Group EastSlot11,Group EastSlot12,Group EastSlot13,Group EastSlot14,Group EastSlot15,Group EastSlot16,Group EastSlot17,Group EastSlot18,Group EastSlot19,Group EastSlot20];
westTeams = [Group WestSlot1,Group WestSlot2,Group WestSlot3,Group WestSlot4,Group WestSlot5,Group WestSlot6,Group WestSlot7,Group WestSlot8,Group WestSlot9,Group WestSlot10,Group WestSlot11,Group WestSlot12,Group WestSlot13,Group WestSlot14,Group WestSlot15,Group WestSlot16,Group WestSlot17,Group WestSlot18,Group WestSlot19,Group WestSlot20];

//Advanced squads
eastSlots = [vehicleVarName EastSlot1,vehicleVarName EastSlot2,vehicleVarName EastSlot3,vehicleVarName EastSlot4,vehicleVarName EastSlot5,vehicleVarName EastSlot6,vehicleVarName EastSlot7,vehicleVarName EastSlot8,vehicleVarName EastSlot9,vehicleVarName EastSlot10,vehicleVarName EastSlot11,vehicleVarName EastSlot12,vehicleVarName EastSlot13,vehicleVarName EastSlot14,vehicleVarName EastSlot15,vehicleVarName EastSlot16,vehicleVarName EastSlot17,vehicleVarName EastSlot18,vehicleVarName EastSlot19,vehicleVarName EastSlot20];
westSlots = [vehicleVarName WestSlot1,vehicleVarName WestSlot2,vehicleVarName WestSlot3,vehicleVarName WestSlot4,vehicleVarName WestSlot5,vehicleVarName WestSlot6,vehicleVarName WestSlot7,vehicleVarName WestSlot8,vehicleVarName WestSlot9,vehicleVarName WestSlot10,vehicleVarName WestSlot11,vehicleVarName WestSlot12,vehicleVarName WestSlot13,vehicleVarName WestSlot14,vehicleVarName WestSlot15,vehicleVarName WestSlot16,vehicleVarName WestSlot17,vehicleVarName WestSlot18,vehicleVarName WestSlot19,vehicleVarName WestSlot20];

_count = 1;
{Call Compile Format["EastTeam%1 = _x",_count];_count = _count + 1} ForEach eastTeams;
_count = 1;
{Call Compile Format["WestTeam%1 = _x",_count];_count = _count + 1} ForEach westTeams;

maxPlayers = Count eastTeams;

//Run any init code common to server and clients.
[] ExecVM "Common\Init\Init_Common.sqf";

if (IsServer) then {[] Exec "Server\Init\Init_Server.sqs"};

"EastTempRespawnMarker" SetMarkerTypeLocal "Empty";
"WestTempRespawnMarker" SetMarkerTypeLocal "Empty";

WaitUntil {commonInitComplete};

if (Local player) then {[] Execvm "Client\Init\Init_Client.sqf"};

//*****************************************************************************************
//1/17/7 MM - Created file.
