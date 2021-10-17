_eventArray = _this Select 0;
_victimSide = _this Select 1;
_defense = _eventArray Select 0;
_killer = _eventArray Select 1;
_killerSide = Str (Side _killer);
_defenseType = TypeOf _defense;
_AITeam = false;
_team = Objnull;
if (IsNull _defense) then {Exit};
_walls = ["WarfareBWestHesco5x","WarfareBWestHesco10x","WarfareBWestHesco5x","WarfareBEastHesco5x","WarfareBEastHesco10x","WarfareBEastHesco5x"];
if (_defenseType In _walls) then {Exit};

if (true)then{
if (_killerSide == _victimSide) exitwith {};
if (_killerSide != "west" && _killerSide != "east") exitwith {};
if (IsNull _killer) exitwith {};
_team = Group _killer;
_killerID = Leader _team Call GetClientID;
_victimID = RESISTANCEID;
_index = unitBountyNames Find _defenseType;
if (_index == -1) exitwith {};
if (!IsPlayer Leader _team) then {_AITeam = true};
if (!IsServer && Local _killer && _killerID == clientID && Side _killer == sideJoined) exitwith {[_victimID,_index] Call CLTFNCAwardBounty};
if (IsServer && _killerID > 0) then {[Side _killer,_killerID,CMDAWARDBOUNTY,_victimID,_index] Exec "Server\Server_CommandToClient.sqs"};
if (!_AITeam) exitwith {};
_bounty = (unitBounties Select _index) * BOUNTYMODIFIER;
_bounty = _bounty - (_bounty % 1);
if (_killerID > 0 && !IsNull _team) then {[_bounty,Side _team,_killerID] Call ChangeAIFunds};
};

if (true)then{
	_delay = 300;
	if (IsNull _team) exitwith {};
	if (!_AITeam && !IsPlayer _killer && !IsServer) then {[CMDREQUESTCHANGESCORE,Leader _team,score Leader _team + SCOREAIDESTROYVEHICLE] Exec "Client\Client_CommandToServer.sqs"};
	if (!_AITeam && !IsPlayer _killer && IsServer) then {[0,0,Leader _team,score Leader _team + SCOREAIDESTROYVEHICLE] Call SRVFNCRequestChangeScore};
};
	if (!IsServer) then {[CMDREQUESTDESTROYDEFENSE,_defense] Exec "Client\Client_CommandToServer.sqs"} else {[CMDSHOWDEFENSEDESTROYED,_defense] Exec "Server\Server_CommandToClients.sqs"};
	sleep(80 + Random 45);
	DeleteVehicle _defense;