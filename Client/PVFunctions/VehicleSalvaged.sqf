//Last modified 4/23/8
//Salvage message.
Private["_name","_type","_salvager","_value","_value1"];

_type = _this Select 0;
_salvager = _this Select 1;
_value = _this Select 2;

if (IsNil "_value") then {Exit};

_name = Localize "STRWFCIVILIANVEHICLE";
if (_type != -1) then {_name = unitBountyDescriptions Select _type};

if (!IsPlayer _salvager && Group _salvager == Group player && !(Call Compile Format["Group player In %1StarterTeams",sideJoinedText])) then
{
	_value1 = 0;
	if (_type == -1) then {_value1 = CIVILIANVEHICLEVALUE / 2} else {_value1 = (unitBounties Select _type) * SALVAGERATIO / 2};

	//Player already received standard share now add bonus share for team salvage.
	_value1 = _value1 - (_value1 % 1);
	_value1	Call ChangePlayerFunds;
	//RANKFORVEHICLE Call AddPlayerRank
	Format[Localize "STRWFYOURTEAMSALVAGED",_value + _value1,_name] Call GroupChatMessage;

}
else
{
	if (IsPlayer _salvager) then
	{
		_value1 = 0;
		if (_type == -1) then {_value1 = CIVILIANVEHICLEVALUE / 2} else {_value1 = (unitBounties Select _type) * SALVAGERATIO / 2};

		//Player already received standard share now add bonus share for team salvage.
		_value1 = _value1 - (_value1 % 1);
		_value1	Call ChangePlayerFunds;
		//RANKFORVEHICLE Call AddPlayerRank
		Format[Localize "STRWFPLAYERSALVAGED",_value + _value1,_name] Call GroupChatMessage;
	}
	else
	{
		if (IsPlayer Leader Group _salvager) then
		{
			Format[Localize "STRWFPLAYERTEAMSALVAGED",_value,_name,Name Leader Group _salvager] Call GroupChatMessage;
		}
		else
		{
			Format[Localize "STRWFSALVAGERSALVAGED",_value,_name] Call GroupChatMessage;
		};
	};
};

//8/25/7 MM - Created file.
