//Last modified 3/2/8
//*****************************************************************************************
//Description: This manages an AI supply truck.
//[Side,Supply Vehicle] Exec "Server\AI\AI_SupplyTruck.sqs"
//*****************************************************************************************
Private["_base","_cce","_ccw","_fullyLoaded","_funds","_hasDriver","_lastLocation","_maxSupplies","_name","_playerInVehicle","_side","_sideID","_supplies","_suppliesInCargo","_town","_vehicle"];
ScopeName "UpdateSupplyTruck";

_side = _this Select 0;
_vehicle = _this Select 1;

_sideID = _side Call GetSideID;
_suppliesInCargo = 0;
_fullyLoaded = 1000;
_playerInVehicle = false;
_lastLocation = ObjNull;

while {GetDammage _vehicle < 1} do
{
	Sleep 5;

	if (GetDammage _vehicle >= 1) then {BreakTo "UpdateSupplyTruck"};

	if (player == Driver _vehicle) then
	{
		if (!_playerInVehicle) then
		{
			_playerInVehicle = true;

			if (_suppliesInCargo < 1000) then
			{
				Hint Format[Localize "STRWFSUPPLYTRUCKCARGO",_suppliesInCargo];
			}
			else
			{
				Hint Localize "STRWFSUPPLYTRUCKFULLYLOADED";
			};
		};
	}
	else
	{
		_playerInVehicle = false;
	};

	_hasDriver = false;

	if (!IsNull Driver _vehicle) then
	{
		if (Alive Driver _vehicle) then
		{
			_hasDriver = true;
		};
	};

	//Check if near the base, if so then fully load the vehicles with supplies.
	if (_suppliesInCargo < _fullyLoaded && _hasDriver) then
	{
		_base = Call Compile Format["%1Base",Str _side];

		if (!IsNull _base && !IsNull Driver _vehicle) then
		{
			if (_base != Call Compile Format["%1MHQ",Str _side] && GetDammage _base < 1 && _vehicle Distance _base < 100) then
			{
				_lastLocation = _base;
				_suppliesInCargo = 1000;

				if (player == Driver _vehicle) then
				{
					Hint Localize "STRWFSUPPLYTRUCKFULLYLOADED";
				};

				Sleep 30;

				if (GetDammage _vehicle >= 1) then
				{
					BreakTo "UpdateSupplyTruck";
				};

				if (!IsNull Driver _vehicle) then
				{
					if (Alive Driver _vehicle) then
					{
						_hasDriver = true;
					};
				};

			};
			
			_ccw = nearestObject [_vehicle ,"WarfareBWestHeadquarters"];
			
			if (GetDammage _ccw < 1 && _vehicle Distance _ccw < 100) then
			{
				_lastLocation = _ccw;
				_suppliesInCargo = 1000;

				if (player == Driver _vehicle) then
				{
					Hint Localize "STRWFSUPPLYTRUCKFULLYLOADED";
				};

				Sleep 30;

				if (GetDammage _vehicle >= 1) then
				{
					BreakTo "UpdateSupplyTruck";
				};

				if (!IsNull Driver _vehicle) then
				{
					if (Alive Driver _vehicle) then
					{
						_hasDriver = true;
					};
				};

			};
			
			
			_cce = nearestObject [_vehicle ,"WarfareBEastHeadquarters"];
			
			if (GetDammage _cce < 1 && _vehicle Distance _cce < 100) then
			{
				_lastLocation = _cce;
				_suppliesInCargo = 1000;

				if (player == Driver _vehicle) then
				{
					Hint Localize "STRWFSUPPLYTRUCKFULLYLOADED";
				};

				Sleep 30;

				if (GetDammage _vehicle >= 1) then
				{
					BreakTo "UpdateSupplyTruck";
				};

				if (!IsNull Driver _vehicle) then
				{
					if (Alive Driver _vehicle) then
					{
						_hasDriver = true;
					};
				};

			};
			
			
			
		};
	};

	_town = [_vehicle,_side] Call GetClosestFriendlyLocation;

	if (!IsNull _town && _town != _lastLocation && _hasDriver) then
	{
		if (_suppliesInCargo > 0 && _vehicle Distance _town <= TOWNCAPTURERANGE) then
		{
			_lastLocation = _town;
			_supplies = Call Compile Format["%1SupplyValue",Str _town];
			_maxSupplies = Call Compile Format["%1MaxSupplyValue",Str _town];
			_name = Call Compile Format["%1Name",Str _town];

			if (_suppliesInCargo >= _supplies + SUPPLYINCREASE && _supplies < _maxSupplies) then
			{
				[_supplies * POINTSPERSUPPLYPOINT,sideJoined,clientID] Call ChangeClientPoints;

				//Double earned when delivered by player.
				_funds = _supplies * FUNDSPERSUPPLYPOINT * 2;
				_supplies = _supplies + SUPPLYINCREASE;
				if (_supplies > _maxSupplies) then {_supplies = _maxSupplies};

				Call Compile Format["%1SupplyValue = _supplies;PublicVariable ""%1SupplyValue""",Str _town];

				//Leftover supplies are value of current town (and can be delivered to town with less supplies).
				_suppliesInCargo = _supplies;
				_funds Call ChangePlayerFunds;

				[CMDREQUESTCHANGESCORE,player,score player + SCOREPERSUPPLYPOINT] Exec "Client\Client_CommandToServer.sqs";

				if (Driver _vehicle == player) then
				{
					Hint Format[Localize "STRWFPLAYERSUPPLIESDELIVEREDUPGRADED",_funds,_name,_supplies];
				}
				else
				{
					Format[Localize "STRWFTEAMSUPPLIESDELIVEREDUPGRADED",_funds,_name,_supplies] Call SideChatMessage;
				};
			}
			else
			{
				//Town supplies are loaded into cargo & can be delivered to town with less supplies.
				_suppliesInCargo = _supplies;
				_funds = _suppliesInCargo * FUNDSPERSUPPLYPOINT * 2;

				_funds Call ChangePlayerFunds;
				[_suppliesInCargo * POINTSPERSUPPLYPOINT,sideJoined,clientID] Call ChangeClientPoints;

				if (player == Driver _vehicle) then
				{
					Hint Format[Localize "STRWFPLAYERSUPPLIESDELIVERED",_funds,_name,_suppliesInCargo];
				}
				else
				{
					Hint Format[Localize "STRWFTEAMSUPPLIESDELIVERED",_funds,_name];
				};
			};
			
			Sleep 30;
		};
	};
};

//*****************************************************************************************
//1/13/7 MM - Created file.
