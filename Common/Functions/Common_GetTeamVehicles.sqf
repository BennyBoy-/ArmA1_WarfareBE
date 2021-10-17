//Last modified 4/3/8
//Returns array of vehicles on team.
//If a team member & range is passed then only return vehicles within range of member.

Private["_canMove","_count","_crew","_ignoreOwnerConflict","_member","_ownerConflict","_range","_team","_teamVehicles","_total","_unit","_units","_vehicle"];

_team = _this Select 0;
_canMove = _this Select 1;

_member = ObjNull;
_range = AIEMBARKVEHICLERANGE;
if (Count _this > 2) then {_member = _this Select 2};
if (Count _this > 3) then {_range = _this Select 3};

_ignoreOwnerConflict = false;
if (Count _this > 4) then {_ignoreOwnerConflict = _this Select 4};

_teamVehicles = [];

_units = Units _team;
_total = Count _units;

for [{_count = 0},{_count < _total},{_count = _count + 1}] do
{
	_unit = _units Select _count;
	_vehicle = Vehicle _unit;

	if (_unit != _vehicle && !(_vehicle In _teamVehicles)) then {_teamVehicles = _teamVehicles + [_vehicle]};
	if (_canMove && !CanMove _vehicle) then {_teamVehicles = _teamVehicles - [_vehicle]};
	if (!IsNull _member && _member Distance _vehicle > _range) then {_teamVehicles = _teamVehicles - [_vehicle]};

	//If a player from another team is in vehicle then actual ownership is not known so do not include vehicle.
	_ownerConflict = false;
	_crew = Crew _vehicle;
	{if (_x != Leader _team && IsPlayer _x) then {_ownerConflict = true};} ForEach _crew;
	if (!_ignoreOwnerConflict && _ownerConflict) then {_teamVehicles = _teamVehicles - [_vehicle]};
};

_teamVehicles

//4/20/7 MM - Created file.
