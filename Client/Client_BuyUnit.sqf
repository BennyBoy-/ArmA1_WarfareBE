_type = _this Select 0;
_unitType = _this Select 1;
_factory = _this Select 2;
_empty = _this Select 3;
_team = Group player;
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
_soldier =  objnull;
_exit = 0;
_option = 0;

while {_exit == 0}do{
scopeName "loop";
	if (true)then{
if (Count _this > 4) then {_team = _this Select 4};
if (IsNull _factory) then {breakOut "loop";};
if (GetDammage _factory >= 1) then {breakOut "loop";};
_factoryName = "";
if (Call Compile Format["_type == %1AIRPORTTYPE",sideJoinedText]) then {_factoryName = "WingedAircraft"};
if (Call Compile Format["_type == %1DEPOTTYPE",sideJoinedText]) then {_factoryName = "Depot"};
if (_factoryName == "") then {_factoryName = Call Compile Format["%1Structures Select _type",sideJoinedText]};
_unit = Call Compile Format["%1%2Units Select _unitType",sideJoinedText,_factoryName];
_cost = Call Compile Format["%1%2Costs Select _unitType",sideJoinedText,_factoryName];
if (!_empty) then {_cost = Call Compile Format["%1%2MannedCosts Select _unitType",sideJoinedText,_factoryName]};
_time = Call Compile Format["%1%2Times Select _unitType",sideJoinedText,_factoryName];
_oneMan = Call Compile Format["(_unitType In %1OneMan%2Vehicles)",sideJoinedText,_factoryName];
_totalUnits = Count (Units _team Call GetLiveUnits);
if (_type != EASTBARRACKSTYPE && _type != WESTBARRACKSTYPE && !_empty && !_oneMan) then {_totalUnits = _totalUnits + 1};
if (!_empty && _totalUnits + 1 > MAXPLAYERTEAMSIZE) then {breakOut "loop";};
if (_cost > (Call GetPlayerFunds)) then {breakOut "loop";};
(-_cost) Call ChangePlayerFunds;
[CMDREQUESTUSESTRUCTURE,_factory,_time] Exec "Client\Client_CommandToServer.sqs";
sleep _time;
if (IsNull _factory) then {breakOut "loop";};
if (GetDammage _factory >= 1) then {breakOut "loop";};
if (!Local Leader _team) exitwith {_option = 6;};
_position = [GetPos _factory,14,GetDir _factory + 180] Call GetPositionFrom;
if (Call Compile Format["_type == %1AIRCRAFTTYPE",sideJoinedText]) then {_position = [GetPos _factory,21,GetDir _factory] Call GetPositionFrom};
if (Call Compile Format["_type == %1AIRPORTTYPE",sideJoinedText]) then {_position = [GetPos _factory,38,GetDir _factory + 180] Call GetPositionFrom};
if (_unit In soldierUnits) then {_option = 5;};
};
//#CreateVehicle///////////////////////////////////////
if (_option == 0)then{
//Add a check for SU34GBU
	if (_unit == "SU34GBU") exitwith {
	_unit="SU34";
	_vehicle = _unit CreateVehicle _position;
	_vehicle removeWeapon "R73Launcher";
	_vehicle removeWeapon "S8Launcher";
	_vehicle addWeapon "BombLauncher";
	_vehicle addMagazine "6Rnd_GBU12_AV8B";
	_option = 2;
	};
	if (_unit == "M1H") exitwith {
	_unit="M1Abrams";
	_vehicle = _unit CreateVehicle _position;
	_vehicle removeweapon "M240_veh";
	_westHowitzer = _vehicle addEventHandler ["Fired", {[_this select 0,_this select 4] Spawn Howitzer}];
	_option = 2;
	};
	if (_unit == "KA50") exitwith {
	_vehicle = _unit CreateVehicle _position;
	_vehicle removeweapon "VikhrLauncher";
	_vehicle removemagazine "12Rnd_Vikhr_KA50";
	_vehicle addWeapon "Ch29Launcher";
	_vehicle addMagazine "4Rnd_Ch29";
	_vehicle addMagazine "4Rnd_Ch29";
	_vehicle addMagazine "4Rnd_Ch29";
	_option = 2;
	};
	if (_unit == "T72H") exitwith {
	_unit="T72";
	_vehicle = _unit CreateVehicle _position;
	_vehicle removeweapon "PKT";
	_eastHowitzer = _vehicle addEventHandler ["Fired", {[_this select 0,_this select 4] Spawn Howitzer}];
	_option = 2;
	};
_option = 1;
};
//#ContinueCreating///////////////////////////////////////
if (_option == 1)then{
	_vehicle = _unit CreateVehicle _position;
	_option = 2;
};
//#Skipcreatevehicle///////////////////////////////////////
if (_option == 2)then{
	_vehicle SetDir ((GetDir _factory + 270) % 360);
	[_vehicle,sideJoined] Call InitUnit;
	//Custom Changes.
	_vehicle lock true;
	_act = _vehicle AddAction ["Unlock","Client\Special_Unlock.sqf"];
	//Eject cargo Script, add choppers in this array (VAR name only! do not use type name!)
	_chopper = ["MH6","UH60MG","UH60","MI17_MG","MI17"];
	if (_unit in _chopper) then {_vehicle setvehicleinit "this addAction [""Cargo Ejection"",""Client\Special_EjectCargo.sqs""]";processInitCommands};
	//add a repair action for HQ on each repair trucks
	if((_unit == "Truck5tRepair") || (_unit == "UralRepair")) then {_Act = _vehicle addAction["Repair MHQ", "Client\Functions\Client_RepairMHQ.sqf"]};
	if (_unit == Format["Warfare%1SupplyTruck",sideJoinedText]) then {[sideJoined,_vehicle] Spawn UpdateSupplyTruck};
	if (_empty) exitwith {[_vehicle] Spawn UpdateEmpty;_exit = 1;};
	_soldierName = Call Compile Format["%1SOLDIER",sideJoinedShortText];
	if (Call Compile Format["_type == %1HEAVYTYPE",sideJoinedText]) then {_soldierName = Call Compile Format["%1CREW",sideJoinedShortText];};
	if (Call Compile Format["_type == %1AIRCRAFTTYPE",sideJoinedText]) then {_soldierName = Call Compile Format["%1PILOT",sideJoinedShortText];};
	if (Call Compile Format["_type == %1AIRPORTTYPE",sideJoinedText]) then {_soldierName = Call Compile Format["%1PILOT",sideJoinedShortText];};
	_option = 3;
	player reveal _vehicle;
};
//#CreateDriver///////////////////////////////////////
if (_option == 3)then{
	_driver = _team CreateUnit [_soldierName,GetPos _vehicle,[],0.2,"FORM"];
	[_driver,sideJoined] Call InitUnit;
	[_driver] AllowGetIn true;
	[_driver] Spawn AIMarker;
	_driver MoveInDriver _vehicle;
	_option = 4;
};
//#CreateGunner///////////////////////////////////////
if (_option == 4)then{
	if (_vehicle EmptyPositions "gunner" < 1) exitwith {_exit = 1;};
	_gunner = _team CreateUnit [_soldierName,GetPos _vehicle,[],0.2,"FORM"];
	[_gunner,sideJoined] Call InitUnit;
	[_gunner] AllowGetIn true;
	[_gunner] Spawn AIMarker;
	_gunner MoveInGunner _vehicle;
	if (true)Exitwith {_exit = 1;};
};
//#CreateUnit///////////////////////////////////////
if (_option == 5)then{
	_soldier = _team CreateUnit [_unit,_position,[],0.2,"FORM"];
	[_soldier,sideJoined] Call InitUnit;
	[_soldier] Spawn AIMarker;
	if (true)Exitwith {_exit = 1;};
};
//#CreateRemote///////////////////////////////////////
if (_option == 6)then{
	[CMDCREATEVEHICLE,_team,_vehicle,_factory] Exec "Client\Client_CommandToServer.sqs";
	if (true)Exitwith {_exit = 1;};
};
};