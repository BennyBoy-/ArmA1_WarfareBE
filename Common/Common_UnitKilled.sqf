_eventArray = _this Select 0;
_victimSide = _this Select 1;
_corpse = _eventArray Select 0;
_killer = _eventArray Select 1;
_killerSide = Str (Side _killer);
_corpseType = TypeOf _corpse;
_AITeam = false;
_team = Objnull;
_delay = 60;
if (_corpse iskindof "man" and vehicle _corpse != _corpse) then {_corpse setpos getpos _corpse;};
_vehicleDestroyed = (_corpseType In (lightUnits + heavyUnits + aircraftUnits + wingedAircraftUnits));
Call Compile Format["if (_corpseType In soldierUnits && !IsNil ""%1Casualties"") then {%1Casualties = %1Casualties + 1;PublicVariable ""%1Casualties""};",_victimSide];

if (_killerSide != _victimSide) then {
if (_killerSide != "west" && _killerSide != "east") exitwith {};
if (IsNull _killer) then {Goto "CleanUp"};
//Gain experience.
if (!IsPlayer _killer && Skill _killer < 0.9) then {_killer SetSkill (Skill _killer + 0.1)};
	_team = Group _killer;
	_killerID = Leader _team Call GetClientID;
	_victimID = RESISTANCEID;
	_index = unitBountyNames Find _corpseType;
	if (_index == -1) exitwith {};
	if (!IsPlayer Leader _team) then {_AITeam = true};
	if (!IsServer && Local _killer && _killerID == clientID && Side _killer == sideJoined) exitwith {[_victimID,_index] Call CLTFNCAwardBounty};
	if (IsServer && _killerID > 0) then {[Side _killer,_killerID,CMDAWARDBOUNTY,_victimID,_index] Exec "Server\Server_CommandToClient.sqs"};
	if (!_AITeam && !IsPlayer _killer && !_vehicleDestroyed) then {[0.25,Side _killer,_killerID] Call ChangeClientPoints};
	if (!_AITeam) exitwith {};
	_bounty = (unitBounties Select _index) * BOUNTYMODIFIER;
	_bounty = _bounty - (_bounty % 1);
	if (_killerID > 0 && !IsNull _team) then {[_bounty,Side _team,_killerID] Call ChangeAIFunds};
};
//#CleanUp
if (true)then{
_delay = 60;
	if (!_vehicleDestroyed) exitwith {};
	if (IsNull _team) exitwith {};

	if (!_AITeam && !IsPlayer _killer && !IsServer) then {[CMDREQUESTCHANGESCORE,Leader _team,score Leader _team + SCOREAIDESTROYVEHICLE] Exec "Client\Client_CommandToServer.sqs"};
	if (!_AITeam && !IsPlayer _killer && IsServer) then {[0,0,Leader _team,score Leader _team + SCOREAIDESTROYVEHICLE] Call SRVFNCRequestChangeScore};
	_killerSideID = (Side _killer) Call GetSideID;
	_victimSideID = RESISTANCEID;
	if (_victimSide == "east") then {_victimSideID = EASTID};
	if (_victimSide == "west") then {_victimSideID = WESTID};
	//If a vehicle then increase clean up delay and notify side(s) that salvage exists.
	_delay = 200;
	if (IsServer) then {Call Compile Format["%1KnownSalvage = %1KnownSalvage + [_corpse]",_victimSide]} else {[CMDVEHICLEDESTROYED,_corpse,_victimSideID] Exec "Client\Client_CommandToServer.sqs"};
	Call Compile Format["if (!IsNil ""%1VehiclesLost"") then {%1VehiclesLost = %1VehiclesLost + 1;PublicVariable ""%1VehiclesLost""};",_victimSide];
	//If the killer is not the resistance then notify side of salvage.
	if (IsServer && _killerSideID != RESISTANCEID) then {Call Compile Format["%1KnownSalvage = %1KnownSalvage + [_corpse]",_killerSide]};
	if (!IsServer && _killerSideID != RESISTANCEID) then {[CMDVEHICLEDESTROYED,_corpse,_killerSideID] Exec "Client\Client_CommandToServer.sqs"};
};
//#Wait
sleep _delay;
DeleteVehicle _corpse