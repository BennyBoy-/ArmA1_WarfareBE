_location = _this Select 0;
_locationName = _this Select 1;
_nearLocations = _this Select 2;
_range = 400;
_resistanceTeamTypes = ["DefaultTeam","DefaultTeam"];
_probability = 50;
_startingSupplyValue = 10;
_maxSupplyValue = 50;
_isControlPoint = true;

if (Count _this > 3) then {_startingSupplyValue = _this Select 3};
if (Count _this > 4) then {_maxSupplyValue = _this Select 4};
if (Count _this > 5) then {_isControlPoint = _this Select 5};
if (Count _this > 6) then {_range = _this Select 6};
if (Count _this > 7) then {_resistanceTeamTypes = _this Select 7};
if (Count _this > 8) then {_probability = _this Select 8};

if (IsNil "totalLocations") then {totalLocations = 0};

totalLocations = totalLocations + 1;

if (IsNil "commonInitComplete") then {commonInitComplete = false};
if (IsNil "gameInitialized") then {gameInitialized = false};

waitUntil {commonInitComplete};
waitUntil {gameInitialized};

locations = locations + [_location];
if (_isControlPoint) then {controlPoints = controlPoints + [_location]} else {towns = towns + [_location]};

_name = Str _location;
_marker = Format["%1CenterMarker",_name];
_marker setMarkerSizeLocal [1.0,1.0];
_marker SetMarkerTypeLocal "Town";
_marker SetMarkerColorLocal "ColorBlue";

_centerPosition = GetMarkerPos _marker;

_marker = Format["%1ArrivalZoneMarker",_name];
_marker SetMarkerTypeLocal "Empty";

Call Compile Format["%1Name = _locationName",_name];
Call Compile Format["%1SideID = RESISTANCEID",_name];
Call Compile Format["%1SupplyValue = _startingSupplyValue",_name];
Call Compile Format["%1StartingSupplyValue = _startingSupplyValue",_name];
Call Compile Format["%1MaxSupplyValue = _maxSupplyValue",_name];
Call Compile Format["%1Connected = false",_name];
Call Compile Format["%1Range = _range",_name];
Call Compile Format["%1NearLocations = _nearLocations",_name];

if (IsServer) then {

Call Compile Format["%1WestRespawn = ObjNull;%1EastRespawn = ObjNull",_name];
Call Compile Format["%1ResistanceTeamTypes = _resistanceTeamTypes",_name];
Call Compile Format["%1Probability = _probability",_name];

Sleep (Random 1);

_defenses = [];
_allDefenses = NearestObjects[_centerPosition,["WarfareBResistanceMGNest_M240","WarfareBResistanceM2StaticMG"],_range];

{if ((Random 100) <= _probability) then {_defenses = _defenses + [_x]};} ForEach _allDefenses;
{if (!(_x In _defenses)) then {DeleteVehicle _x};} ForEach _allDefenses;
{[_x,Resistance] Call InitDefense} ForEach _defenses;

[_location,_defenses] Exec "Server\Server_UpdateTownResistance.sqs";
[_location] Exec "Server\Server_UpdateTown.sqs";
[_location] Spawn UpdateTownDefense;
};