//Last modified 5/2/7
//Returns a transport vehicle of the team.
//If a team member & range is passed then only return transport within range of member.

Private["_count","_member","_range","_team","_total","_unit","_units","_vehicle"];

_team = _this Select 0;

_member = ObjNull;
_range = AIEMBARKVEHICLERANGE;
if (Count _this > 1) then {_member = _this Select 1};
if (Count _this > 2) then {_range = _this Select 2};

_teamVehicles = [];
_units = Units _team;
_total = Count _units;
_transports = [];

for [{_count = 0},{_count < _total},{_count = _count + 1}] do
{
	_unit = _units Select _count;
	if (Vehicle _unit != _unit && Vehicle _unit EmptyPositions "Cargo" > 0 && !(Vehicle _unit In _transports)) then {_transports = _transports + [Vehicle _unit]};

	if (!IsNull _member && _member Distance _unit > _range) then {_transports = _transports - [Vehicle _unit]};
};

_transports

//4/25/7 MM - Created file.
