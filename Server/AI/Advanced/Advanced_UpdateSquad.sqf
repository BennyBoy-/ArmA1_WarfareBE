//sqf'd by chris - slew the beast - arma.isgreat.org
//Optimized by Benny
_team = _this Select 0;
_respawnable = true;
_role = true;
_mission = -1;
_mission == MISCAPTURELOCATIONS;
_exit = 0;
_option = 0;
if (Count _this > 1) then {_respawnable = _this Select 1};
if (Count _this > 2) then {_mission = _this Select 2};
//#Init////////////////////////////////////////////////////////
	if (not(IsServer)) exitwith {_exit = 1;};
	_side = Side Leader _team;
	_sideText = Str _side;
	_respawnMarker = "EastTempRespawnMarker";
	if (_side == West) then {_respawnMarker = "WestTempRespawnMarker"};
	_index = Call Compile Format["%1Teams Find _team",_sideText];
	if (_index < 0) then {_index = Call Compile Format["%1DefenseTeams Find _team",_sideText];if (_index >= 0) then {_index = _index + Call Compile Format["Count %1Teams",_sideText]};};
	_index = _index + 1;
	_name = Format["%1Team%2",_sideText,_index];
	if (IsPlayer Leader _team) exitwith {_exit = 1;};
	if (not(Local Leader _team)) exitwith {_exit = 1;};
	if (_respawnable) then {[_team,_name] Spawn UpdateSquadRespawn};
	sleep 2;
	Leader _team removeAllEventHandlers "killed";
	[Leader _team,_side] Call InitUnit;
	waituntil {gameStarted};
	Call Compile Format["%1AIMission = MISCAPTURELOCATIONS",_name];
	Call Compile Format["%1AIMissionX = -1",_name];
	Call Compile Format["%1AIMissionY = -1",_name];
	_lastX = -1;
	_lastY = -1;
	Call Compile Format["%1AITeamType = %2AIDEFAULTTEAMTYPE",_name,_sideText];
///Commander's Init///////////////////////
_AITypes = [];
_AISlot = 0;
	if ((Call Compile Format["IsNull %1CommanderTeam",_sideText])) then {
	if (_mission != -1) exitwith {};
	_AITypes = Call Compile Format["%1AITeamTypes",_sideText];
	_AISlot = Call Compile Format["%1AITeams Find _team",_sideText];
	if (_AISlot >= Count _AITypes) then {_AITypes =_AITypes + _AITypes + _AITypes};
	Call Compile Format["%1AITeamType = _AITypes Select _AISlot",_name];
};
//////////////////////////////////////////
	if (_mission != -1) then {Call Compile Format["%1AIMission = _mission",_name]};
	if (_mission == MISPATROL) then {Call Compile Format["%1AITeamType = %2AIBASEPATROLTEAMTYPE",_name,_sideText]};
	if (_mission == MISDEFENDBASE) then {Call Compile Format["%1AITeamType = %2AIBASEDEFENSETEAMTYPE",_name,_sideText]};
	if (_mission == MISDEFENDLOCATIONS) then {Call Compile Format["%1AITeamType = %2AIATAATEAMTYPE",_name,_sideText]};
	_position = Call Compile Format["GetPos %1Base",_sideText];
	if (_mission == MISPATROL) then {Call Compile Format["%1AIMissionX = _position Select 0;%1AIMissionY = _position Select 1",_name]};
	Call Compile Format["PublicVariable ""%1AIMission""",_name];
	Call Compile Format["PublicVariable ""%1AITeamType""",_name];
	Call Compile Format["PublicVariable ""%1AIMissionX""",_name];
	Call Compile Format["PublicVariable ""%1AIMissionY""",_name];
	_teamType = 0;
	_lastTeamType = -1;
	_mission = 0;
	_lastMission = -1;
	_funds = 0;
	_lastDestination = ObjNull;
	sleep (10 + _index * 2);
	_timePartialUpdate = 15;
	_timeFullUpdate = 45;
	_enemyBase = WestBase;
	_moveCount = 0;
	_infantryTime = 0;
	_lightTime = 0;
	_heavyTime = 0;
	_killed = false;
	_embarkLeader = 0;
	_checkFormation = true;
	_reportMission = false;
	_defendingTarget = true;
	_goalLoopCount = 0;
	_unitsBought = 0;
	_returnToBase = false;
	_barracksType = Call Compile Format["%1BARRACKSTYPE",_sideText];
	_barracksName = Call Compile Format["%1StructureNames Select _barracksType",_sideText];
	_lightType = Call Compile Format["%1LIGHTTYPE",_sideText];
	_lightName = Call Compile Format["%1StructureNames Select _lightType",_sideText];
	_heavyType = Call Compile Format["%1HEAVYTYPE",_sideText];
	_heavyName = Call Compile Format["%1StructureNames Select _heavyType",_sideText];
	_infantryTypes = Call Compile Format["%1InfantryTeamTypes",_sideText];
	_lightTypes = Call Compile Format["%1LightTeamTypes",_sideText];
	_heavyTypes = Call Compile Format["%1HeavyTeamTypes",_sideText];
	_teamTypes = Call Compile Format["%1AITeamTemplates",_sideText];
	_destinationObject = "Logic" CreateVehicle [0,0,0];
	_team SetFormation "STAG COLUMN";
	_team SetSpeedMode "NORMAL";
	_leader = Leader _team;
	Call Compile Format["_teamType = %1AITeamType;_mission = %1AIMission",_name];
	_base = Call Compile Format["%1Base",_sideText];
	_lastTeamType = _teamType;
	_lastMission = _mission;
	_timePartialUpdate = 0;
	_timeFullUpdate = 0;
	_infantryTime = 0;
	_lightTime = 0;
	_heavyTime = 0;
	_purchase = false;
	_timePartialUpdate = 0;
	_timeFullUpdate = 0;
	_funds = 0;
	_teamUnits = _teamTypes Select _teamType;
	_teamMaxSize = 10;
	_teamSize = 0;
	_useBarracks = false;
	_useLight = false;
	_useHeavy = false;
	_buyLight = false;
	_heavyAvailable = false;
	_lightAvailable = false;
	_barracksAvailable = false;
	_minFundsNeeded = 0;
	_nearestBarracks = ObjNull;
	_nearestLight = ObjNull;
	_nearestHeavy = ObjNull;
	_nearestObjects = [];
	_transportOnly = true;
	_inRangeDistance = 0;
	_currentUnit = _leader;
	_location = [_leader,_side] Call GetClosestHostileLocation;
	_locations = [_base,_side,CAPTUREFROMBASERANGE] Call GetClosestHostileLocations;
	_x = 0;
	_y = 0;	
	
while {_exit == 0}do{
//#Update////////////////////////////////////////////////////////
sleep 0.2;
if (_option == 0)then {
sleep 5;
if (Call Compile Format["not(_team In %1AITeams) and not(_team In %1DefenseTeams)",_sideText]) exitWith {_exit = 1};
//#UpdateState////////////////////////////////////////////////////////
	_leader = Leader _team;
	Call Compile Format["_teamType = %1AITeamType;_mission = %1AIMission",_name];
	_base = Call Compile Format["%1Base",_sideText];
	_lastTeamType = _teamType;
	_lastMission = _mission;
	_timePartialUpdate = _timePartialUpdate - 5;
	_timeFullUpdate = _timeFullUpdate - 5;
	_infantryTime = _infantryTime - 5;
	_lightTime = _lightTime - 5;
	_heavyTime = _heavyTime - 5;
	if (not(Alive _leader)) exitwith {_option = 35};
	if (_teamType != _lastTeamType or _mission != _lastMission) exitwith {_lastDestination = ObjNull;_option = 4;};
	if (_mission == MISMOVETODESTINATION and (Call Compile Format["%1AIMissionX != _lastX or %1AIMissionY != _lastY",_name])) exitwith {_lastDestination = ObjNull;_option = 4;};
	if (_timePartialUpdate > 0) then {_option = 0;} else {_timePartialUpdate = 15};
	_purchase = false;
_option = 8;
};
//3#CheckForFullUpdate////////////////////////////////////////////////////////
if (_option == 3)then {
	if (_timeFullUpdate > 0) exitwith {_option = 0;};
_option = 4;
};
//4#UpdateRole////////////////////////////////////////////////////////
if (_option == 4)then {
	_purchase = false;
	_timePartialUpdate = 15;
	_timeFullUpdate = 30;
	_funds = _team Call GetTeamFunds;
	_teamUnits = _teamTypes Select _teamType;
	_teamMaxSize = Count _teamUnits;
	if (_teamType In _infantryTypes) then {_teamMaxSize = _teamMaxSize + 1};
	{if ((_x In lightUnits) or (_x In heavyUnits)) then {_teamMaxSize = _teamMaxSize + 1};} ForEach _teamUnits;
_option = 5;
};
//5#UpdatePurchases////////////////////////////////////////////////////////
if (_option == 5)then {
	_teamSize = Count (Units _team Call GetLiveUnits);
	if (_teamSize >= _teamMaxSize) exitwith {_option = 17;};
	_useBarracks = false;
	_useLight = false;
	_useHeavy = false;
	_minFundsNeeded = 0;
	if (_teamType In _infantryTypes and _infantryTime <= 0) then {_useBarracks = true;_minFundsNeeded = _minFundsNeeded + AIMINBARRACKSFUNDS};
	if (_teamType In _lightTypes and _lightTime <= 0) then {_useLight = true;_minFundsNeeded = _minFundsNeeded + AIMINLIGHTFUNDS};
	if (_teamType In _heavyTypes and _heavyTime <= 0) then {_useHeavy = true;_minFundsNeeded = _minFundsNeeded + AIMINHEAVYFUNDS};
	if (_minFundsNeeded > _funds) exitwith {_option = 17;};
	_nearestBarracks = ObjNull;
	_nearestLight = ObjNull;
	_nearestHeavy = ObjNull;
	_nearestObjects = [];
	if (_useBarracks) then {_nearestObjects = nearestObjects[_leader,[_barracksName],500]};
	if (_useBarracks and Count _nearestObjects > 0) then {_nearestBarracks = _nearestObjects Select 0};
	if (_useLight) then {_nearestObjects = nearestObjects[_leader,[_lightName],500]} else {_nearestObjects = []};
	if (_useLight and Count _nearestObjects > 0) then {_nearestLight = _nearestObjects Select 0};
	if (_useHeavy) then {_nearestObjects = nearestObjects[_leader,[_heavyName],500]} else {_nearestObjects = []};
	if (_useHeavy and Count _nearestObjects > 0) then {_nearestHeavy = _nearestObjects Select 0};
	_transportOnly = true;
	_inRangeDistance = 0;
	_currentUnit = _leader;
_option = 6;
};
//6#CheckPurchase////////////////////////////////////////////////////////
if (_option == 6)then {
	_buyLight = false;
	_heavyAvailable = false;
	_lightAvailable = false;
	_barracksAvailable = false;
	_range = AIPURCHASERANGE;
	if (_leader != Vehicle _leader and (not(CanMove (Vehicle _leader)) or (IsNull Driver (Vehicle _leader)))) then {_range = AIDEFENDLOCATIONRANGE};
	if (not(IsNull _nearestHeavy) and (_leader Distance _nearestHeavy < _range)) then {_heavyAvailable = true};
	if (not(IsNull _nearestLight) and (_leader Distance _nearestLight < _range)) then {_lightAvailable = true};
	if (not(IsNull _nearestBarracks) and (_leader Distance _nearestBarracks < _range)) then {_barracksAvailable = true};
	_barracksUnits = [];
	_lightUnits = [];
	_heavyUnits = [];
	if (_barracksAvailable) then {{if (_x In soldierUnits) then {_barracksUnits = _barracksUnits + [_x]};} ForEach _teamUnits};
	if (_lightAvailable) then {{if (_x In lightUnits) then {_lightUnits = _lightUnits + [_x]};} ForEach _teamUnits};
	if (_heavyAvailable) then {{if (_x In heavyUnits) then {_heavyUnits = _heavyUnits + [_x]};} ForEach _teamUnits};
	if (_barracksAvailable) then {[_barracksType,_nearestBarracks,_team,_barracksUnits] spawn AIbuyunits;_purchase = true;_infantryTime = 120};
	if (_lightAvailable) then {[_lightType,_nearestLight,_team,_lightUnits] spawn AIbuyunits;_purchase = true;_lightTime = 120};
	if (_heavyAvailable) then {[_heavyType,_nearestHeavy,_team,_heavyUnits] spawn AIbuyunits;_purchase = true;_heavyTime = 120};
	if (not(_lightAvailable) and not(_heavyAvailable) and not(_useBarracks) and time > 180) exitwith {_option = 17;};
	if (_useBarracks and not(_barracksAvailable) and _leader Distance _base > AIREINFORCERANGE) exitwith {_option = 17;};
	_option = 7;
};
//7#CheckReturnToBase////////////////////////////////////////////////////////
if (_option == 7)then {
	_distance = 100000;
	_factories = [_nearestBarracks,_nearestLight,_nearestHeavy];
	_factories = _factories - [ObjNull];
	_nearestFactory = ObjNull;
	{if (_leader Distance _x < _distance) then {_distance = _leader Distance _x;_nearestFactory = _x};} ForEach _factories;
if (_teamSize < MINAIGROUPSIZE and not(IsNull _nearestFactory)) exitwith {_option = 18;};
if (_teamSize < (_teamMaxSize * 0.75) and not(IsNull _nearestFactory) and _distance < AIREINFORCERANGE) exitwith {_option = 18;};
	_option = 8;
};
//8#UpdateLeader////////////////////////////////////////////////////////
if (_option == 8)then {
	if (_leader != Vehicle _leader and CanMove Vehicle _leader)exitwith {_option = 10;};
	_teamVehicles = [_team,true,_leader,AIEMBARKVEHICLERANGE] Call GetTeamVehicles;
	_option = 9;
};
//9#EmbarkLeader////////////////////////////////////////////////////////
if (_option == 9)then {
	if (_embarkLeader > 2)exitwith{_currentUnit MoveInDriver (_teamVehicles Select 0);_embarkLeader = 0;_option = 10;};
	if (Count _teamVehicles > 0)exitwith{_embarkLeader = _embarkLeader + 1;_option = 19;};
	_embarkLeader = 0;
	_option = 10;
};
//10#UpdateMembers////////////////////////////////////////////////////////
if (_option == 10)then {
	_infantryCount = 0;
	_units = Units _team;
	_units = _units - [_leader];
	_unitsOutOfFormation = [];
	_outOfFormation = false;
	_totalUnits = Count _units;
	if (_totalUnits < 1) exitwith {_option = 16;};
	_option = 11;
};
//11#UpdateMember////////////////////////////////////////////////////////
if (_option == 11)then {
	_currentUnit = _units Select _infantryCount;
	_infantryCount = _infantryCount + 1;
	_vehicle = Vehicle _currentUnit;
if (GetDammage _currentUnit >= 1) exitwith {_option = 15;};
if (_currentUnit Distance _destinationObject > AIDISEMBARKVEHICLERANGE)exitwith {_option = 12;};
if (_currentUnit != _vehicle and Driver _vehicle != _currentUnit and Gunner _vehicle != _currentUnit and Commander _vehicle != _currentUnit)then{UnassignVehicle _currentUnit;};
	_option = 14;
};
//12#EmbarkMember////////////////////////////////////////////////////////
if (_option == 12)then {
if ((_vehicle != _currentUnit)and(CanMove _vehicle))exitwith{_option = 14;};
	_option = 13;
};
//13#MemberEmbarkTransport////////////////////////////////////////////////////////
if (_option == 13)then {
	_transport = ObjNull;
	_transports = [_team,_currentUnit,AIEMBARKVEHICLERANGE] Call GetTeamTransport;
	if (Count _transports > 0) then {_transport = _transports Select (Random (Count _transports - 1))};
	if (IsNull _transport) exitwith {_option = 14;};
	if (_currentUnit Distance _transport > AIEMBARKVEHICLERANGE) exitwith {_option = 14;};
	_currentUnit AssignAsCargo _transport;
	[_currentUnit] OrderGetIn true;
	_option = 14;
};
//14#MemberOutOfRange////////////////////////////////////////////////////////
if (_option == 14)then {
	_leaderDistance = _currentUnit Distance _leader ;
if (_leaderDistance <= AIFORMATIONRANGE) exitwith {_option = 15;};
	_outOfFormation = true;
	_unitsOutOfFormation = _unitsOutOfFormation + [_currentUnit];
if (_leaderDistance < _currentUnit Distance _destinationObject) exitwith {_currentUnit DoMove GetPos _leader;_option = 15;};
	_currentUnit DoMove GetPos _destinationObject;
	_option = 15;
};
//15#UpdateNextMember////////////////////////////////////////////////////////
if (_option == 15)then {
	if (_infantryCount < _totalUnits) exitwith {_option = 11;};
	_option = 16;
};
//16#UpdateFormation////////////////////////////////////////////////////////
if (_option == 16)then {
if (_checkFormation)then {_checkFormation = false;_units = _units - [_unitsOutOfFormation];[_units] CommandFollow _leader};
if (_outOfFormation)then {_outOfFormation = false;_checkFormation = true};
	_option = 3;
};
//17#UpdateGoal////////////////////////////////////////////////////////
if (_option == 17)then {
	if ((_infantryTime > 0 or _lightTime > 0 or _heavyTime > 0) and _teamSize < _teamMaxSize and _leader Distance _base < AIPURCHASERANGE) exitwith {_option = 0;};
	if (_mission == MISCAPTURELOCATIONS) exitwith {_option = 27;};
	if (_mission == MISDEFENDBASE) exitwith {_option = 26;};
	if (_mission == MISMOVETODESTINATION) exitwith {_option = 31;};
	if (_mission == MISPATROL) exitwith {_option = 32;};
	_option = 0;
};
//18#ReturnToFactory////////////////////////////////////////////////////////
if (_option == 18)then {
	_direction = ((GetDir _nearestFactory + 180) + (Random 5) - 10) % 360;
	_distance = 30;
	_position = GetPos _nearestFactory;
	_destination = [(_position Select 0)+((sin _direction)*_distance),(_position Select 1)+((cos _direction)*_distance),_position Select 2];
	_destination = [_destination,14,20] Call GetRandomPosition;
	_destinationObject SetPos _destination;
	[_team,"sad",GetPos _destinationObject,"staggard column"] Spawn SetAIwaypoint;
	_lastDestination = ObjNull;
	if (not(CanMove (Vehicle _leader)) or (IsNull Driver (Vehicle _leader))) then {UnassignVehicle _leader};
	_option = 0;
};
//19#EmbarkAsDriverInTeamVehicle
if (_option == 19)then {
	_vehicle = _teamVehicles Select 0;
	UnassignVehicle Driver _vehicle;
	_currentUnit AssignAsDriver _vehicle;
	_option = 10;
};
//20#CheckDefendTargets////////////////////////////////////////////////////////
if (_option == 20)then {
	_totalGroups = Count _defenseTeams;
	_count = 0;
	_option = 21;
};
//21#FindDefenseTeam////////////////////////////////////////////////////////
if (_option == 21)then {
	_defender = _defenseTeams Select _count;
	if (_defender == _team) exitwith {_option = 22;};
	_count = _count + 1;
	if (_count < _totalGroups) exitwith {_option = 21;};
	_option = 22;
};
//22#SetDefenseTeam////////////////////////////////////////////////////////
if (_option == 22)then {
	_closestTarget = _defendedTargets Select _count;
	_option = 23;
};
//23#DefendTowns////////////////////////////////////////////////////////
if (_option == 23)then {
	_goalLoopCount = _goalLoopCount + 1;
	if ((_goalLoopCount < 3) and not(_reportMission))exitwith{_option = 0;};
	_goalLoopCount = 0;
	if (not(Alive _leader)) exitwith {_option = 35};
	if (not(IsNull _defendLocation)) exitwith {_option = 25;};
	_nearestDistance = 100000;
	_count = 0;
	_total = Count locations;
	_option = 24;
};
//24#FindDefendLocation////////////////////////////////////////////////////////
if (_option == 24)then {
	_location = locations Select _count;
	_locationSide = (Call Compile Format["%1SideID",Str _location]) Call GetSideFromID;
	_distance = _location Distance _leader;
	if (_locationSide == _side and _distance < _nearestDistance) then {_defendLocation = _location;_nearestDistance = _distance};
	_count =_count + 1;
	if (_count < _total) exitwith {_option = 24;};
	_option = 25;
};
//25#MoveToClosestDefendTarget////////////////////////////////////////////////////////
if (_option == 25)then {
	_destinationObject SetPos GetPos _defendLocation;
	[_team,"sad",GetPos _destinationObject,"staggard column"] Spawn SetAIwaypoint;
	_option = 0;
};
//26#DefendBase////////////////////////////////////////////////////////
if (_option == 26)then {
	if (not(Alive _leader)) exitwith {_option = 35};
	_moveCount = _moveCount + 1;
	if (not(IsNull _lastDestination) and _moveCount < 2) exitwith {_option = 0;};
	_moveCount = 0;
	_lastDestination = _base;
	_destinationObject SetPos (GetPos _base);
	_units = Units _team Call GetLiveUnits;
	Call Compile Format["%1AIMissionX = GetPos _destinationObject Select 0",_name];
	Call Compile Format["%1AIMissionY = GetPos _destinationObject Select 1",_name];
	Call Compile Format["PublicVariable ""%1AIMissionX"";PublicVariable ""%1AIMissionY""",_name];
	{if (CanMove _x) then {_x DoMove ([GetPos _base,12,AIDEFENDLOCATIONRANGE] Call GetRandomPosition)};} ForEach _units;
	if (_leader Distance _base < AIDEFENDLOCATIONRANGE) then {[Units _team,AIDEFENDLOCATIONRANGE] Call UseStationaryDefense};
	_option = 0;
};
//27#CaptureLocations////////////////////////////////////////////////////////
if (_option == 27)then {
	if (not(Alive _leader)) exitwith {_option = 35};
	if (IsNull _lastDestination) exitwith {_option = 28;};
	_moveCount = _moveCount + 1;
	if (_moveCount > 5) then {_moveCount = 0;	[_team,"sad",GetPos _destinationObject,"staggard column"] Spawn SetAIwaypoint};
	if (not(_lastDestination In towns)) exitwith {_option = 28;};
	_locationSide = (Call Compile Format["%1SideID",Str _lastDestination]) Call GetSideFromID;
	if (_locationSide != _side and _lastDestination Distance _leader < 600) exitwith {_option = 0;};
	_option = 28;
};
//28#FindHostileLocation////////////////////////////////////////////////////////
if (_option == 28)then {
	_location = [_leader,_side] Call GetClosestHostileLocation;
	if (_leader Distance _base > BASERANGE) exitwith {_option = 29;};
	_locations = [_base,_side,CAPTUREFROMBASERANGE] Call GetClosestHostileLocations;
	if (Count _locations > 1) then {_location = _locations Select (_index % (Count _locations))};
	_option = 29;
};
//29#FindHostileBase////////////////////////////////////////////////////////
if (_option == 29)then {
	if (longerPersistentServerGame and PlayersNumber East < 1 and PlayersNumber West < 1) exitwith {_option = 30;};
	_enemyBase = WestBase;
	if (_side == West) then {_enemyBase = EastBase};
	if (_leader Distance _enemyBase < _leader Distance _location) then {_location = _enemyBase};
	_option = 30;
};
//30#MoveToLocation////////////////////////////////////////////////////////
if (_option == 30)then {
	if (IsNull _location) exitwith {_option = 0;};
	if (_lastDestination == _location) exitwith {_option = 0;};
	_lastDestination = _location;
	_destinationObject SetPos ([GetPos _location,18,24] Call GetRandomPosition);
	Call Compile Format["%1AIMissionX = GetPos _location Select 0",_name];
	Call Compile Format["%1AIMissionY = GetPos _location Select 1",_name];
	Call Compile Format["PublicVariable ""%1AIMissionX"";PublicVariable ""%1AIMissionY""",_name];
	[_team,"sad",GetPos _destinationObject,"staggard column"] Spawn SetAIwaypoint;
	_option = 0;
};
//31#MoveToDestination////////////////////////////////////////////////////////
if (_option == 31)then {
	_moveCount = _moveCount + 1;
	if (not(IsNull _lastDestination) and _moveCount < 2) exitwith {_option = 0;};
	_moveCount = 0;
	_lastX = Call Compile Format["%1AIMissionX",_name];
	_lastY = Call Compile Format["%1AIMissionY",_name];
	_destinationObject SetPos [_lastX,_lastY];
	_lastDestination = _destinationObject;
	[_team,"sad",GetPos _destinationObject,"staggard column"] Spawn SetAIwaypoint;
	_option = 0;
};
//32#Patrol////////////////////////////////////////////////////////
if (_option == 32)then {
	_moveCount = _moveCount + 1;
	if (not(IsNull _lastDestination) and _moveCount < 2) exitwith {_option = 0;};
	_moveCount = 0;
	_x = Call Compile Format["%1AIMissionX",_name];
	_y = Call Compile Format["%1AIMissionY",_name];
	_destinationObject SetPos ([[_x,_y,0],5,AIPATROLRANGE] Call GetRandomPosition);
	_lastDestination = _destinationObject;
	[_team,"sad",GetPos _destinationObject,"staggard column"] Spawn SetAIwaypoint;
	_option = 0;
};
//33#SearchAndDestroy////////////////////////////////////////////////////////
if (_option == 33)then {
	_location = locations Select (Random (Count Locations - 1));
	_position = GetPos _location;
	_leaderPosition = GetPos _leader;
	_x = (_position Select 0) + (((_leaderPosition Select 0) - (_position Select 0)) / 2) * (Random 1);
	_y = (_position Select 1) + (((_leaderPosition Select 1) - (_position Select 1)) / 2) * (Random 1);
	_option = 34;
};
//34#MoveToSearchAndDestroyTarget////////////////////////////////////////////////////////
if (_option == 34)then {
	_destinationObject SetPos [_x,_y,0];
	[_team,"sad",[_x,_y],"staggard column"] Spawn SetAIwaypoint;
	_option = 0;
};
//35#WaitForRespawn////////////////////////////////////////////////////////
if (_option == 35)then {
	sleep 2;
	_lastDestination = ObjNull;
	if (_respawnable) exitwith {_option = 36;};
	_units = Units _team Call GetLiveUnits;
	if (Count _units > 0) exitwith {
		_team SelectLeader (_units Select 0);
		_option = 36;
		};
	_base = Call Compile Format["%1Base",_sideText];
	_unitType = ESOLDIER;
	if (_side == West) then {_unitType = WSOLDIER};


//	_leader = _team CreateUnit[_unitType,([GetPos _base,10,25] Call GetRandomPosition),[],1,"FORM"];
	str _unitType createUnit [GetPos _base, _team, "",0.5,"corporal"];
	_leader = units _team select 0;
	[_leader,_side] Call InitUnit;
	_team SelectLeader _leader;
	sleep 13;
	_option = 4;
};
//36#WaitForLeaderRespawn////////////////////////////////////////////////////////
if (_option == 36)then {
	waituntil {(Alive Leader _team)};
	_leader = Leader _team;
	_option = 4;
 };
};
deletevehicle _destinationObject;