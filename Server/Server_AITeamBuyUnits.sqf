_factoryType = _this Select 0;
_factory = _this Select 1;
_team = _this Select 2;
_units = _this Select 3;
_side = Side (Leader _team);
_funds = _team Call GetTeamFunds;
_factoryName = Call Compile Format["%1Structures Select _factoryType",Str _side];
_factoryUnits = Call Compile Format["%1%2Units",_side,_factoryName];
_teamUnits = [];
_exit = 0;
if (Call Compile Format["_factoryType == %1BARRACKSTYPE",Str _side]) then {_teamUnits = Units _team Call GetLiveUnits} else {_teamUnits = [_team,false] Call GetTeamVehicles};
_teamUnits = _teamUnits - [Leader _team];
_index = -1;
{_index = _units Find TypeOf _x;if (_index >= 0) then {_units Set[_index," "]};} ForEach _teamUnits;
_units = _units - [" "];
_total = Count _units;
if (_total < 1) then {_exit = 1;};
_count = 0;

while {_exit == 0}do{
sleep 5;
if (_exit == 0)then{
	_index = _factoryUnits Find (_units Select _count);
	if (_index == -1) exitwith {};
	_cost = Call Compile Format["%1%2MannedCosts Select _index",_side,_factoryName];
	if (_cost > _funds) exitwith {};
	[_factoryType,_index,_factory,false,_team] spawn Sbuyunit;
	_funds = _funds - _cost;
};
	_count =_count + 1;
	if (_count >= _total) exitwith {};
};