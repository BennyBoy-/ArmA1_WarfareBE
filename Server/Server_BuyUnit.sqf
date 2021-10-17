//;Last modified 4/24/8
//;*****************************************************************************************
//;Description: Buys a unit for an AI team.
//;*****************************************************************************************
_exit = 0;
_type = _this Select 0;
_unitType = _this Select 1;
_factory = _this Select 2;
_empty = _this Select 3;
_team = _this Select 4;
_side = Side Leader _team;
_soldiername = "";
_position = [];
_unit = "";
_cost = 0;
_funds = 0;
_index = 0;
_option = 0;
_vehicle = objnull;
_driver = objnull;
_gunner = objnull;

while {_exit == 0}do{
if (_side != East && _side != west) then {_exit = 1;};
if (IsNull _factory) then {_exit = 1;};
if (GetDammage _factory >= 1) then {_exit = 1;};
_factoryName = eastStructures Select _type;
if (_side == West) then {_factoryName = westStructures Select _type};
_unit = Call Compile Format["%1%2Units Select _unitType",_side,_factoryName];
_cost = Call Compile Format["%1%2Costs Select _unitType",_side,_factoryName];
_time = Call Compile Format["%1%2Times Select _unitType",_side,_factoryName];
_funds = _team Call GetTeamFunds;
_index = _team Call GetAITeamID;
if (_index < 0) then {_exit = 1;};
if (IsNil "queueDelay") then {queueDelay = 0};
queueDelay = (queueDelay + 1) % 15;
if (_cost > _funds) then {_exit = 1;};
if (_factory In baseStructuresInUse) then {[_type,_unitType,_factory,_empty,_team,false,queueDelay / 10] Execvm "Common\Common_QueueUnit.sqf";_exit = 1;};
_funds = _funds - _cost;
if (_funds < 0) then {_funds = 0};
Call Compile Format["%1AI%2Funds = _funds;PublicVariable ""%1AI%2Funds""",Str _side,_index];
[_side,-1,_factory,_time] Call SRVFNCREQUESTUSESTRUCTURE;
sleep _time;
if (IsNull _factory) then {_exit = 1;};
if (GetDammage _factory >= 1) then {_exit = 1;};
_position = [GetPos _factory,14,GetDir _factory + 180] Call GetPositionFrom;
if (Call Compile Format["_type == %1AIRCRAFTTYPE || _type == %1AIRPORTTYPE",Str _side]) then {_position = [GetPos _factory,21,GetDir _factory] Call GetPositionFrom};
if (Call Compile Format["_type == %1AIRPORTTYPE",Str _side]) then {_position = [GetPos _factory,38,GetDir _factory + 180] Call GetPositionFrom};
_option = 0;
if (_unit In soldierUnits) then {_option = 1;};
//#CreateVehicle/////////////////////////////
if (_option == 0)then{
	_vehicle = _unit CreateVehicle _position;
	_vehicle SetDir ((GetDir _factory + 270) % 360);
	[_vehicle,_side] Call InitUnit;
	if (_empty) then {_exit = 1;};
	_soldierName = ESOLDIER;
	if (_side == West) then {_soldierName = WSOLDIER};
	if (Call Compile Format["_type == %1HEAVYTYPE",Str _side]) then {if (_side == WEST) then {_soldierName = WCREW};if (_side == EAST) then {_soldierName = ECREW};};
	_leader = Leader _team;
	if ((Vehicle _leader) == _leader && _leader Distance _vehicle < AIEMBARKVEHICLERANGE) exitwith {[_leader] AllowGetIn true;_leader MoveInDriver _vehicle;_option = 2;};
_option = 3;
};
//#CreateDriver/////////////////////////////
if (_option == 3)then{
	_driver = _team CreateUnit [_soldierName,GetPos _vehicle,[],0.2,"FORM"];
	_driver setSkill 1;
	[_driver,_side] Call InitUnit;
	[_driver] AllowGetIn true;
	[_driver] Join _team;
	_driver MoveInDriver _vehicle;
_option = 2;
};
//#CreateGunner/////////////////////////////
if (_option == 2)then{
	if (_vehicle EmptyPositions "gunner" < 1) exitwith {};
	_gunner = _team CreateUnit [_soldierName,GetPos _vehicle,[],0.2,"FORM"];
	_gunner setSkill 1;
	[_gunner,_side] Call InitUnit;
	[_gunner] AllowGetIn true;
	[_gunner] Join _team;
	_gunner MoveInGunner _vehicle;
_option = 4;
};
//#LockVehicle/////////////////////////////
if (_option == 4)then{
	_vehicle Lock true;
};
//#CreateUnit/////////////////////////////
if (_option == 1)then{
	_soldier = _team CreateUnit [_unit,_position,[],0.2,"FORM"];
	_soldier setSkill 1;
	[_soldier,_side] Call InitUnit;
	[_soldier] Join _team;
};
_exit = 1;
};