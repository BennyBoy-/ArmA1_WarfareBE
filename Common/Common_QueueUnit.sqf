_type = _this Select 0;
_unitType = _this Select 1;
_factory = _this Select 2;
_empty = _this Select 3;
_team = _this Select 4;
_addToPlayer = _this Select 5;
_delay = 0;
if (Count _this > 6) then {_delay = _this Select 6};
sleep _delay;
if (_addToPlayer) then {Hint Localize "STRWFADDINGTOQUEUE"};

while {_factory In baseStructuresInUse}do{
//#WaitOnQueue
sleep(0.1 + (Random 150) / 100);
	if (IsNull _factory) then {Exit};
	if (GetDammage _factory >= 1) then {Exit};
//	if (_factory In baseStructuresInUse) then {Goto "WaitOnQueue"};
};
if (_addToPlayer) then {[_type,_unitType,_factory,_empty,_team] Execvm "Client\Client_BuyUnit.sqf";Exit};
[_type,_unitType,_factory,_empty,_team]  spawn Sbuyunit;
// Execvm "Server\Server_BuyUnit.sqf";