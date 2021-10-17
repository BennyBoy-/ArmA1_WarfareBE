sleep 10;
_total = Count towns;

while {true}do{
sleep 60;
	_count = 0;
	_eastIncome = 0;
	_westIncome = 0;

//#GetTownValue
while {true}do{
 _town = towns Select _count;
 _side = (Call Compile Format["%1SideID",Str _town]) Call GetSideFromID;
 _connected = Call Compile Format["%1Connected",Str _town];
 _supply = Call Compile Format["%1SupplyValue",Str _town];
 if ((_side == East) && (_town != EastBase)) then {_eastIncome = _eastIncome + _supply;eastSupplies = eastSupplies + _supply;PublicVariable "eastSupplies"};
 if ((_side == West) && (_town != WestBase)) then {_westIncome = _westIncome + _supply;westSupplies = westSupplies + _supply;PublicVariable "westSupplies"};
 _count = _count + 1;
 if (_count == _total) exitwith {};
 //if (_count < _total) then {Goto "GetTownValue"};
};
_id = 1;
{if (!(_x In eastAITeams)) then {[_eastIncome,East,_id] Call ChangeClientFunds} else {[_eastIncome,East,_id] Call ChangeAIFunds};_id = _id + 1} ForEach eastTeams;
{[_eastIncome,East,_id] Call ChangeAIFunds;_id = _id + 1} ForEach eastDefenseTeams;
_id = 1;
{if (!(_x In westAITeams)) then {[_westIncome,West,_id] Call ChangeClientFunds} else {[_westIncome,West,_id] Call ChangeAIFunds};_id = _id + 1} ForEach westTeams;
{[_westIncome,West,_id] Call ChangeAIFunds;_id = _id + 1} ForEach westDefenseTeams;

};
