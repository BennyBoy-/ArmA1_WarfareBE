//Last modified 5/29/8
//*****************************************************************************************
//Description: Call all common init scripts.
//*****************************************************************************************

//Compile function loops.
UpdateEmptyVehicle = Compile PreprocessFile "Common\Common_UpdateEmptyVehicle.sqf";

//Compile regular functions
ChangeAIFunds = Compile PreprocessFile "Common\Functions\Common_ChangeAIFunds.sqf";
ChangeClientFunds = Compile PreprocessFile "Common\Functions\Common_ChangeClientFunds.sqf";
ChangeClientPoints = Compile PreprocessFile "Common\Functions\Common_ChangeClientPoints.sqf";
CorrectObjectPosition = Compile PreprocessFile "Common\Functions\Common_CorrectObjectPosition.sqf";
CreateWP = Compile PreprocessFile "Common\Functions\Common_CreateWP.sqf";
EquipDefaultLoadout = Compile PreprocessFile "Common\Functions\Common_EquipDefaultLoadout.sqf";
EquipLoadout = Compile PreprocessFile "Common\Functions\Common_EquipLoadout.sqf";
EquipTeamLeader = Compile PreprocessFile "Common\Functions\Common_EquipTeamLeader.sqf";
FastTravelTo = Compile PreprocessFile "Common\Functions\Common_FastTravelTo.sqf";
FireArtillery = Compile PreprocessFile "Common\Functions\Common_FireArtillery.sqf";
InitDefense = Compile PreprocessFile "Common\Functions\Common_InitDefense.sqf";
InitUnit = Compile PreprocessFile "Common\Functions\Common_InitUnit.sqf";
IsLocationConnected = Compile PreprocessFile "Common\Functions\Common_IsLocationConnected.sqf";
IsTeamAlive = Compile PreprocessFile "Common\Functions\Common_IsTeamAlive.sqf";
GetClosestHostileLocations = Compile PreprocessFile "Common\Functions\Common_GetClosestHostileLocations.sqf";
GetClosestLocation = Compile PreprocessFile "Common\Functions\Common_GetClosestLocation.sqf";
GetClosestLocations = Compile PreprocessFile "Common\Functions\Common_GetClosestLocations.sqf";
GetCommanderVotes = Compile PreprocessFile "Common\Functions\Common_GetCommanderVotes.sqf";
GetCommanderFromVotes = Compile PreprocessFile "Common\Functions\Common_GetCommanderFromVotes.sqf";
GetFriendlyCamps = Compile PreprocessFile "Common\Functions\Common_GetFriendlyCamps.sqf";
GetTeamFunds = Compile PreprocessFile "Common\Functions\Common_GetTeamFunds.sqf";
GetTeamRank = Compile PreprocessFile "Common\Functions\Common_GetTeamRank.sqf";
GetClientID = Compile PreprocessFile "Common\Functions\Common_GetClientID.sqf";
GetClientTeam = Compile PreprocessFile "Common\Functions\Common_GetClientTeam.sqf";
GetClosestCamp = Compile PreprocessFile "Common\Functions\Common_GetClosestCamp.sqf";
GetClosestFriendlyCamp = Compile PreprocessFile "Common\Functions\Common_GetClosestFriendlyCamp.sqf";
GetClosestFriendlyLocation = Compile PreprocessFile "Common\Functions\Common_GetClosestFriendlyLocation.sqf";
GetClosestFriendlyLocations = Compile PreprocessFile "Common\Functions\Common_GetClosestFriendlyLocations.sqf";
GetClosestHostileLocation = Compile PreprocessFile "Common\Functions\Common_GetClosestHostileLocation.sqf";
GetDistance = Compile PreprocessFile "Common\Functions\Common_GetDistance.sqf";
GetDestroyedUnits = Compile PreprocessFile "Common\Functions\Common_GetDestroyedUnits.sqf";
GetDirTo = Compile PreprocessFile "Common\Functions\Common_GetDirTo.sqf";
GetFactories = Compile PreprocessFile "Common\Functions\Common_GetFactories.sqf";
GetFriendlyNearLocations = Compile PreprocessFile "Common\Functions\Common_GetFriendlyNearLocations.sqf";
GetHostileLocations = Compile PreprocessFile "Common\Functions\Common_GetHostileLocations.sqf";
GetHostileNearLocations = Compile PreprocessFile "Common\Functions\Common_GetHostileNearLocations.sqf";
GetLiveUnits = Compile PreprocessFile "Common\Functions\Common_GetLiveUnits.sqf";
GetPositionFrom = Compile PreprocessFile "Common\Functions\Common_GetPositionFrom.sqf";
GetRandomPosition = Compile PreprocessFile "Common\Functions\Common_GetRandomPosition.sqf";
GetSideID = Compile PreprocessFile "Common\Functions\Common_GetSideID.sqf";
GetSideFromID = Compile PreprocessFile "Common\Functions\Common_GetSideFromID.sqf";
GetTeamArtillery = Compile PreprocessFile "Common\Functions\Common_GetTeamArtillery.sqf";
GetTeamStatus = Compile PreprocessFile "Common\Functions\Common_GetTeamStatus.sqf";
GetTeamTransport = Compile PreprocessFile "Common\Functions\Common_GetTeamTransport.sqf";
GetTeamVehicles = Compile PreprocessFile "Common\Functions\Common_GetTeamVehicles.sqf";
GetTerrainSlope = Compile PreprocessFile "Common\Functions\Common_GetTerrainSlope.sqf";
GetTotalCamps = Compile PreprocessFile "Common\Functions\Common_GetTotalCamps.sqf";
GetTotalCampsOnSide = Compile PreprocessFile "Common\Functions\Common_GetTotalCampsOnSide.sqf";
GetTotalSupplyValue = Compile PreprocessFile "Common\Functions\Common_GetTotalSupplyValue.sqf";
GetTownsHeld = Compile PreprocessFile "Common\Functions\Common_GetTownsHeld.sqf";
GetUndestroyedUnits = Compile PreprocessFile "Common\Functions\Common_GetUndestroyedUnits.sqf";
GetUnitsBelowHeight = Compile PreprocessFile "Common\Functions\Common_GetUnitsBelowHeight.sqf";
HasHostileCamp = Compile PreprocessFile "Common\Functions\Common_HasHostileCamp.sqf";
PlaceNear = Compile PreprocessFile "Common\Functions\Common_PlaceNear.sqf";
PlaceSafe = Compile PreprocessFile "Common\Functions\Common_PlaceSafe.sqf";
RearmVehicle = Compile PreprocessFile "Common\Functions\Common_RearmVehicle.sqf";
SetCommanderVotes = Compile PreprocessFile "Common\Functions\Common_SetCommanderVotes.sqf";
SortByDistance = Compile PreprocessFile "Common\Functions\Common_SortByDistance.sqf";
UseStationaryDefense = Compile PreprocessFile "Common\Functions\Common_UseStationaryDefense.sqf";

commonFunctionsCompiled = true;

for [{_count = 0},{_count < maxPlayers},{_count = _count + 1}] do
{
	//Player votes.
	Call Compile Format["if (IsNil ""EastTeam%1Vote"") then {EastTeam%1Vote = -1};",_count + 1];
	Call Compile Format["if (IsNil ""WestTeam%1Vote"") then {WestTeam%1Vote = -1};",_count + 1];

	//Player starting funds.
	Call Compile Format["if (IsNil ""EastPlayer%1Funds"") then {EastPlayer%1Funds = 800};",_count + 1];
	Call Compile Format["if (IsNil ""WestPlayer%1Funds"") then {WestPlayer%1Funds = 800};",_count + 1];

	//Player starting rank.
	Call Compile Format["if (IsNil ""EastPlayer%1Rank"") then {EastPlayer%1Rank = 0};",_count + 1];
	Call Compile Format["if (IsNil ""WestPlayer%1Rank"") then {WestPlayer%1Rank = 0};",_count + 1];

	//Player points.  These are fractions, when value is >= 1 then it is added to the score.
	Call Compile Format["if (IsNil ""EastPlayer%1Points"") then {EastPlayer%1Points = 0};",_count + 1];
	Call Compile Format["if (IsNil ""WestPlayer%1Points"") then {WestPlayer%1Points = 0};",_count + 1];

	//Player mission from commander.
	Call Compile Format["if (IsNil ""EastTeam%1Mission"") then {EastTeam%1Mission = 0};",_count + 1];
	Call Compile Format["if (IsNil ""WestTeam%1Mission"") then {WestTeam%1Mission = 0};",_count + 1];

	Call Compile Format["if (IsNil ""WestTeam%1MissionX"") then {WestTeam%1MissionX = -1};",_count + 1];
	Call Compile Format["if (IsNil ""WestTeam%1MissionY"") then {WestTeam%1MissionY = -1};",_count + 1];

	Call Compile Format["if (IsNil ""EastTeam%1MissionX"") then {EastTeam%1MissionX = -1};",_count + 1];
	Call Compile Format["if (IsNil ""EastTeam%1MissionY"") then {EastTeam%1MissionY = -1};",_count + 1];

	//AI starting funds.
	Call Compile Format["if (IsNil ""EastAI%1Funds"") then {EastAI%1Funds = 2000};",_count + 1];
	Call Compile Format["if (IsNil ""WestAI%1Funds"") then {WestAI%1Funds = 2000};",_count + 1];

	//AI starting rank.
	Call Compile Format["if (IsNil ""EastAI%1Rank"") then {EastAI%1Rank = 0};",_count + 1];
	Call Compile Format["if (IsNil ""WestAI%1Rank"") then {WestAI%1Rank = 0};",_count + 1];

	Call Compile Format["if (IsNil ""EastTeam%1AITeamType"") then {EastTeam%1AITeamType = -1};",_count + 1];
	Call Compile Format["if (IsNil ""WestTeam%1AITeamType"") then {WestTeam%1AITeamType = -1};",_count + 1];

	Call Compile Format["if (IsNil ""EastTeam%1AIMission"") then {EastTeam%1AIMission = -1};",_count + 1];
	Call Compile Format["if (IsNil ""WestTeam%1AIMission"") then {WestTeam%1AIMission = -1};",_count + 1];

	Call Compile Format["if (IsNil ""WestTeam%1AIMissionX"") then {WestTeam%1AIMissionX = -1};",_count + 1];
	Call Compile Format["if (IsNil ""WestTeam%1AIMissionY"") then {WestTeam%1AIMissionY = -1};",_count + 1];

	Call Compile Format["if (IsNil ""EastTeam%1AIMissionX"") then {EastTeam%1AIMissionX = -1};",_count + 1];
	Call Compile Format["if (IsNil ""EastTeam%1AIMissionY"") then {EastTeam%1AIMissionY = -1};",_count + 1];

	Call Compile Format["if (IsNil ""EastPlayer%1MissionsCompleted"") then {EastPlayer%1MissionsCompleted = 0};",_count + 1];
	Call Compile Format["if (IsNil ""WestPlayer%1MissionsCompleted"") then {WestPlayer%1MissionsCompleted = 0};",_count + 1];

	Call Compile Format["if (IsNil ""EastPlayer%1MissionsFailed"") then {EastPlayer%1MissionsFailed = 0};",_count + 1];
	Call Compile Format["if (IsNil ""WestPlayer%1MissionsFailed"") then {WestPlayer%1MissionsFailed = 0};",_count + 1];
};

EastAICommanderFunds = 3000;
WestAICommanderFunds = 3000;

EastSupplies = 900;
WestSupplies = 900;

EastCommanderTeam = ObjNull;
WestCommanderTeam = ObjNull;

debugMode = false;

soldierUnits = [];
lightUnits = [];
heavyUnits = [];
aircraftUnits = [];
wingedAircraftUnits = [];

baseStructuresInUse = [];

[] ExecVM "Common\Config\Config_Artillery.sqf";

commonScriptsExecuted = 0;

[] ExecVM "Common\Init\Init_CommonConstants.sqf";
[] ExecVM "Common\Init\Init_PublicVariables.sqf";
[] ExecVM "Common\Config\Config_Structures.sqf";
[] ExecVM "Common\Config\Config_Barracks.sqf";
[] ExecVM "Common\Config\Config_AITeams.sqf";
[] ExecVM "Common\Config\Config_Loadouts.sqf";

WaitUntil {commonScriptsExecuted >= 6};

//Light & heavy units have dependencies on soldiers (crew, pilots, etc.)
[] ExecVM "Common\Config\Config_LightFactory.sqf";
[] ExecVM "Common\Config\Config_HeavyFactory.sqf";
[] ExecVM "Common\Config\Config_AircraftFactory.sqf";
[] ExecVM "Common\Config\Config_Airport.sqf";
[] ExecVM "Common\Config\Config_Depot.sqf";

//Define unit bounties after all unit types have been defined.
WaitUntil {Count lightUnits > 0 && Count heavyUnits > 0 && Count aircraftUnits > 0 && Count wingedAircraftUnits > 0 && Count depotUnits > 0};

totalEastAISalvagers = 0;
totalWestAISalvagers = 0;

totalEastAISupplyTrucks = 0;
totalWestAISupplyTrucks = 0;

_unbuyableUnitNames = ["SquadLeaderE","SquadLeaderW"];
_unbuyableUnitBounties = [200,200];
_unbuyableUnitDescriptions = [Localize "STR_DN_SQUADLEADER",Localize "STR_DN_SQUADLEADER"];

soldierUnits = soldierUnits + _unbuyableUnitNames;
soldierUnitCosts = soldierUnitCosts + _unbuyableUnitBounties;
soldierUnitDescriptions = soldierUnitDescriptions + _unbuyableUnitDescriptions;

_defenseNames = ["WarfareBResistanceMGNest_M240"];
_defenseCosts = [200];
_defenseDescriptions = [Localize "STRWFBRESISTANCEMGNEST"];

unitBountyNames = soldierUnits + lightUnits + heavyUnits + aircraftUnits + eastDefenseNames + westDefenseNames + _defenseNames;
unitBounties = soldierUnitCosts + lightUnitCosts + heavyUnitCosts + aircraftUnitCosts + eastDefenseCosts + westDefenseCosts + _defenseCosts;
unitBountyDescriptions = soldierUnitDescriptions + lightUnitDescriptions + heavyUnitDescriptions + aircraftUnitDescriptions + eastDefenseDescriptions + westDefenseDescriptions + _defenseDescriptions;

locations = [];
controlPoints = [];
towns = [];

commonInitComplete = true;

//*****************************************************************************************
//1/18/7 MM - Created file.
