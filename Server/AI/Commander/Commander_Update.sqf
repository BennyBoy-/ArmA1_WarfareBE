_side = _this Select 0;

//#Init/////////////////////////////////////////////////////////////
	_delay = 5;
	_HQ = ObjNull;
	if (_side == East) then {_delay = 7};
	sleep _delay;
	_sideText = Str _side;
	_updateTime = 0;
	_driverName = ESOLDIER;
	_option = 0;
	_funds = Call Compile Format["%1AICommanderFunds",_sideText];
	_supplies = Call Compile Format["%1Supplies",_sideText];
	_HQ = Call Compile Format["%1Base",_sideText];
	_AITrucks = Call Compile Format["%1AISupplyTrucks",_sideText];
	_workingTrucks = 0;
	if (_side == West) then {_driverName = WSOLDIER};
//#Update///////////////////////////////////////////////
while {true}do{
_option = 0;
  while {true}do{
sleep 30;
	_updateTime = _updateTime + 30;

	if (_updateTime >= 90) exitwith {_updateTime = 0};
  };
  if (true)then{
//#UpdateSupplyTrucks////////////////////////////////////////////////////
	if (!Call Compile Format["%1MHQDeployed",_sideText]) exitwith {};
	_funds = Call Compile Format["%1AICommanderFunds",_sideText];
	_supplies = Call Compile Format["%1Supplies",_sideText];
	if (_side == West) then {_HQ = CurentSelArray select CurentSel;};
	if (_side == East) then {_HQ = CurentSelEastArray select CurentSelEast};
	_AITrucks = Call Compile Format["%1AISupplyTrucks",_sideText];
	_workingTrucks = 0;
	{if (CanMove _x) then {_workingTrucks = _workingTrucks + 1};} ForEach _AITrucks;
	if (_side == West) then {CurentSelArray set [0, WestBase];if ((GetDammage _HQ >= 1)||(IsNull(_HQ))) then {_HQ = CurentSelArray select 0};};
	if (_side == East) then {CurentSelEastArray set [0, EastBase];if ((GetDammage _HQ >= 1)||(IsNull(_HQ))) then {_HQ = CurentSelEastArray select 0};};
	if (GetDammage _HQ >= 1) exitwith {};
	if (_workingTrucks >= MAXAISUPPLYTRUCKS) exitwith {_option = 2};
_chance = ((_side Call GetTownsHeld) / 10 + (MAXAISUPPLYTRUCKS - _workingTrucks) / MAXAISUPPLYTRUCKS) * 100;
	if ((Random 100) > _chance) exitwith {_option = 2};
	_option = 1;
  };

  if (_option == 1)then{
//;Create supply truck at base///////////////////////////////////////////
	_truck = Format["Warfare%1SupplyTruck",Str _side] CreateVehicle GetPos _HQ;
	[_truck,GetPos _HQ,13,19,true,false,true] Call PlaceNear;
	[_truck,_side] Call InitUnit;
	_team = CreateGroup _side;
	_driverName createUnit [GetPos _truck, _team, "",0.5,"corporal"];
	_driver = units _team select 0;
	[_driver,_side] Call InitUnit;
	_driver MoveInDriver _truck;
	_truck Lock true;
	[_side,_truck] Exec "Server\AI\AI_SupplyTruck.sqs";
	sleep 1;
  };
  
  
  if (_option == 2)then{
//#UpdateSalvagers////////////////////////////////////////////////////
	_salvagers = Call Compile Format["%1AISalvagers",_sideText];
	_workingSalvagers = 0;
	{if (CanMove _x) then {_workingSalvagers = _workingSalvagers + 1};} ForEach _salvagers;
	if (_workingSalvagers >= MAXAISALVAGERS) exitwith {};
	_truck = Format["Warfare%1SalvageTruck",_sideText] CreateVehicle GetPos _HQ;
	[_truck,GetPos _HQ,13,19,true,false,true] Call PlaceNear;
	[_truck,_side] Call InitUnit;
	_team = CreateGroup _side;
//	_driver = _team CreateUnit [_driverName,GetPos _truck,[],0.5,"FORM"];
	_driverName createUnit [GetPos _truck, _team, "",0.5,"corporal"];
	_driver = units _team select 0;
	[_driver,_side] Call InitUnit;
	_driver MoveInDriver _truck;
	_truck Lock true;
	[_side,_truck] Exec "Server\AI\AI_Salvager.sqs";
	[_side,_truck] Exec "Server\Server_UpdateSalvager.sqs";
//	Goto "Update"
  };
};