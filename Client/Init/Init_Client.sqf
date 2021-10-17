UpdateSupplyTruck = Compile PreprocessFile "Client\Client_UpdateSupplyTruck.sqf";
UpdateAvailableActions = Compile PreprocessFile "Client\Client_UpdateAvailableActions.sqf";
UpdateBuildQueue = Compile PreprocessFile "Client\Client_UpdateBuildQueue.sqf";
UpdateMissionMarker = Compile PreprocessFile "Client\Client_UpdateMissionMarker.sqf";

AddToMessageLog = Compile PreprocessFile "Client\Functions\Client_AddToMessageLog.sqf";
AirportCaptured = Compile PreprocessFile "Client\Functions\Client_AirportCaptured.sqf";
CommandToPlayerWPComplete = Compile PreprocessFile "Client\Functions\Client_CommandToPlayerWPComplete.sqf";
CreateObjectMarkers = Compile PreprocessFile "Client\Functions\Client_CreateObjectMarkers.sqf";
DefenseDestroyed = Compile PreprocessFile "Client\Functions\Client_DefenseDestroyed.sqf";
DisplayInventory = Compile PreprocessFile "Client\Functions\Client_DisplayInventory.sqf";
DisplayInfoBar = Compile PreprocessFile "Client\Functions\Client_DisplayInfoBar.sqf";
ShowGUIMessage = Compile PreprocessFile "Client\Functions\Client_ShowGUIMessage.sqf";
ShowWaypoints = Compile PreprocessFile "Client\Functions\Client_ShowWaypoints.sqf";
ChangePlayerFunds = Compile PreprocessFile "Client\Functions\Client_ChangePlayerFunds.sqf";
GetCommandCenters = Compile PreprocessFile "Client\Functions\Client_GetCommandCenters.sqf";
GetPlayerFunds = Compile PreprocessFile "Client\Functions\Client_GetPlayerFunds.sqf";
GetPlayerRank = Compile PreprocessFile "Client\Functions\Client_GetPlayerRank.sqf";
GetIncome = Compile PreprocessFile "Client\Functions\Client_GetIncome.sqf";
GetStructureMarkerLabel = Compile PreprocessFile "Client\Functions\Client_GetStructureMarkerLabel.sqf";
GroupChatMessage = Compile PreprocessFile "Client\Functions\Client_GroupChatMessage.sqf";
InitInfoBar = Compile PreprocessFile "Client\Functions\Client_InitInfoBar.sqf";
PlayerMissionEnded = Compile PreprocessFile "Client\Functions\Client_PlayerMissionEnded.sqf";
PlayerRespawn = Compile PreprocessFile "Client\Functions\Client_PlayerRespawn.sqf";
QueueUnit = Compile PreprocessFile "Client\Functions\Client_QueueUnit.sqf";
ReplaceInventoryAmmo = Compile PreprocessFile "Client\Functions\Client_ReplaceInventoryAmmo.sqf";
ReplaceSecondaryInventoryAmmo = Compile PreprocessFile "Client\Functions\Client_ReplaceSecondaryInventoryAmmo.sqf";
RequestFireMission = Compile PreprocessFile "Client\Functions\Client_RequestFireMission.sqf";
SideChatMessage = Compile PreprocessFile "Client\Functions\Client_SideChatMessage.sqf";
TitleTextMessage = Compile PreprocessFile "Client\Functions\Client_TitleTextMessage.sqf";
UpdateEmpty = Compile PreprocessFile "Client\Special_UpdateEmpty.sqf";
AIMarker = Compile PreprocessFile "Client\Client_AIMarker.sqf";
Howitzer = Compile PreprocessFile "Client\Special_Howtizer.sqf";
AINumberRetrieval = Compile PreprocessFile "Client\Functions\Client_RetrieveAINumber.sqf";

if (IsNil "missionsCompleted") then {missionsCompleted = 0};
if (IsNil "missionsFailed") then {missionsFailed = 0};

IDCLOADOUTFUNDS					= 200;
IDCLOADOUTSPACE					= 201;
IDCLOADOUTTRADEIN				= 202;
IDCLOADOUTCOST					= 203;
IDCLOADOUTREFUND				= 204;
IDCLOADOUTTEMPLATELIST			= 205;
IDCLOADOUTPRIMARY				= 206;
IDCLOADOUTPRIMARYAMMO			= 207;
IDCLOADOUTPRIMARYLIST			= 208;
IDCLOADOUTSECONDARY				= 209;
IDCLOADOUTSECONDARYAMMO			= 210;
IDCLOADOUTSECONDARYLIST			= 211;
IDCLOADOUTSIDEARM				= 212;
IDCLOADOUTSIDEARMLIST			= 213;
IDCLOADOUTMISC					= 214;
IDCLOADOUTMISCAMMO				= 215;
IDCLOADOUTMISCLIST				= 216;
IDCLOADOUTBUY					= 217;
//;Factory menu GUI components
IDCUNITMENUINFO					= 170;
IDCUNITMENUUNITLIST				= 171;
IDCUNITMENUTEAMLIST				= 172;

//;Default Menu IDCs.;
IDCMENUINFO						= 500;
IDCMENUTEAMLIST					= 501;
IDCMENULIST						= 502;
IDCMENULIST1					= 503;
IDCMENULIST2					= 504;
IDCMENUTITLE					= 510;
IDCMENUSTATUSLABEL				= 511;
IDCMENUBUTTON					= 512;
IDCMENUBUTTON1					= 513;
IDCMENUBUTTON2					= 514;
IDCMENUIMAGE					= 515;
IDCMENUSLIDER					= 516;
IDCMENUCHECKBOX					= 517;
IDCMENUSLIDER					= 518;

IDCCONSTRUCTIONBUTTON			= 600;
IDCCONSTRUCTIONIMAGE			= 700;
IDCCONSTRUCTIONLABEL			= 800;

IDCGENERICBUTTON				= 3400;
IDCGENERICIMAGE					= 3500;
IDCGENERICLABEL					= 3600;
IDCGENERICLIST					= 3700;
IDCGENERICTEXT					= 3800;
IDCGENERICCHECKBOX				= 3900;

IDCERRORMESSAGE					= 3990;

IDCDEFAULT						= 5000;

IDCWEST							= 6000;
IDCEAST							= 7000;

menubutton = -1;
showHelp = true;

timeConnected = time;

fireMissionInProgress = false;
fireMissionRadius = 50;

buildQueueFactory = [];
buildQueue = [];
buildQueueFactoryType = [];
buildQueueEmpty = [];
buildQueueTeam = [];

//;Interface
GUISkin = "";
loadoutBuyCustomAndExit = false;
loadoutBuyCustomUnitNow = false;
customUnitValue = 100;

currentCutDisplay = DisplayNull;
currentTitleDisplay = DisplayNull;
townCaptureProgressBarActive = false;

showMessagesOnScreen = true;
messageLog = [];

mouseX = 0;
mouseY = 0;
mouseDragged = false;
mouseFocus = false;
onMouseButtonDown = false;
onMouseButtonUp = false;

menuCheckBox = false;

timeLastDeath = time;

//;When set true player will automatically be given a mission at game start.
gotoMission = true;

playerMissionLocation = ObjNull;
playerMissionLocationName = "";
playerMissionDescription = Localize "STRWFNONE";
playerMissionPoints = 0;
playerMissionStartTime = 0;
playerMissionWP = [];

gameInitialized = false;
respawnLocation = -1;
respawnInProgress = false;

fastTravelDestinationMarker = "FastTravelDestinationMarker";
fastTravelInProgress = false;

_team = Group player;

for [{_count = Count Waypoints player},{_count >= 0},{_count = _count - 1}] do {DeleteWaypoint[_team,_count]};

//;Determine Client's ID (1 - 16).  This is the slot # they joined the game as.  Also determine side ID.
sideJoined = Side player;
sideJoinedText = Str sideJoined;
sideID = sideJoined Call GetSideID;
clientID = player Call GetClientID;

sideJoinedShortText = "E";
if (sideJoined == West) then {sideJoinedShortText = "W"};

if (clientID < 1) then {player SideChat("Client_Init.sqs: ERROR OCCURRED! Could not determine clientID.");Exit};

respawnWeapons = Call Compile Format["%1DefaultWeapons",sideJoinedText];
respawnAmmo = Call Compile Format["%1DefaultAmmo",sideJoinedText];

commanderTeam = ObjNull;
commandMenuID = -1;

//;Keeps track of any structures that are in use when player join a game in progress.
JIPBaseStructuresInUse = [];
baseStructures = [];

constructionVehicle = ObjNull;

barracksInRange = false;
lightFactoryInRange = false;
heavyFactoryInRange = false;
aircraftFactoryInRange = false;
airportInRange = false;
depotInRange = false;

campInRange = ObjNull;
HQInRange = ObjNull;
repairTruckInRange = ObjNull;

_units = Units _team;
_units = _units - [player];
_vehicles = [_team,false] Call GetTeamVehicles;

//;Clear any potential AI vehicles.
{DeleteVehicle _x} ForEach _units;
{DeleteVehicle _x} ForEach _vehicles;

waituntil {(!IsNil "eastStartingLocation" && !IsNil "westStartingLocation");};

_start = Call Compile Format["%1StartingLocation",sideJoinedText];
if (player Distance _start > 25) then {player SetPos ([GetPos _start,5,25] Call GetRandomPosition)};

//#Init

//;Init client-side PV command system.
[] Exec "Client\Client_CommandFromServer.sqs";

//#ReadyToStart
while {true}do{
//;Done with initialization so let the server know this client is ready.
[CMDCLIENTINITIALIZED] Exec "Client\Client_CommandToServer.sqs";

_timer = 0;

//#WaitForGameStart
while {true}do{
sleep 0.25;

//	;If client has not received a reply from server after a while then resend the request.
	if (_timer >= 1) exitwith {};
	if (_timer <  1) then {_timer = _timer + 0.25};
	if (gameInitialized) exitwith {};
};
	if (gameInitialized) exitwith {};
};
MapAnimClear;
MapAnimAdd [1,.1,Call Compile Format["GetPos %1MHQ",sideJoinedText]];
MapAnimCommit;

player AddEventHandler ["killed",{_this Exec "Client\Client_Killed.sqs"}];

[] Call PlayerRespawn;

//;This value is initialized by server.  So once it is not nil then the player has connected.
waituntil {(!IsNil "eastCommanderVoteTime" && !IsNil "westCommanderVoteTime")};

//;Check if a vote is in progress.  May not be if player connects after start of game.
_voteTime = Call Compile Format["%1CommanderVoteTime",sideJoinedText];
if (_voteTime > 0) then {CreateDialog "CommanderVoteMenu"};

eastStarterTeams = [];
westStarterTeams = [];

//;AI that is created to "hold" player's original team while on a Starter Squad.
placeHolderAI = ObjNull;
starterSquadJoined = GrpNull;

"Respawn_west" SetMarkerTypeLocal "Empty";
"Respawn_east" SetMarkerTypeLocal "Empty";

sleep 3;

"Respawn_west" SetMarkerTypeLocal "Empty";
"Respawn_east" SetMarkerTypeLocal "Empty";

//;Game has started so execute any client-side loops.;
[] Exec "Client\Client_Update.sqs";
[] Execvm "Client\Client_UpdateTime.sqf";
[] Exec "Client\Client_UpdateTownMarkers.sqs";
[] Exec "Client\Client_UpdateRespawn.sqs";
[] Exec "Client\GUI\GUI_UpdateCampCapture.sqs";
[] Exec "Client\Client_UpdateActions.sqs";
[] ExecVM "Client\Client_Hint.sqf";

[sideJoined] Execvm "Client\Init\Init_Markers.sqf";
[sideJoined] Exec "Client\Client_UpdateAdvancedSquadMarkers.sqs";

[] Spawn UpdateAvailableActions;
[] Spawn UpdateBuildQueue;
[] Spawn UpdateMissionMarker;

sleep 5;

_array = nearestObjects [(position player), ["Car"], 80];
{player reveal _x} forEach _array;

missionsCompleted = Call Compile Format["%1Player%2MissionsCompleted",sideJoinedText,clientID];
missionsFailed = Call Compile Format["%1Player%2MissionsFailed",sideJoinedText,clientID];

//Sniper can call a small barrage with binoc.
if (TypeOf player == Call Compile Format ["""Soldier%1Sniper""",sideJoinedShortText]) then {
	_nul=[] execVM "Client\Support\Spotter\KRON_Strings.sqf";
	binoStance = compile preProcessFileLineNumbers "Client\Support\Spotter\binostance.sqf";
	binoLOS = compile preProcessFileLineNumbers "Client\Support\Spotter\binolos.sqf";
	player addAction ["Select Target", "Client\Support\Spotter\binotarget.sqf",[],0,FALSE, TRUE,""];
};