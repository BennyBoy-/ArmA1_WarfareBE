//Last modified 4/12/8
//Starter Squad message.
Private["_type","_value1","_value2"];

_type = _this Select 0;

_value1 = 0;
if (Count _this > 1) then {_value1 = _this Select 1};

_value2 = 0;
if (Count _this > 2) then {_value2 = _this Select 2};

//Message for a new commander Vote. Inform the player which key to press.
if (_type == MSGVOTEFORCOMMANDER) then
{
	_value1 = ActionKeysNames["TeamSwitch",1];
	PlaySound "VoteForNewCommander";
};

if (_type == MSGBASEUNDERATTACK) then
{
	PlaySound Format["BaseAttacked%1",Round(Random 1)];
};

if (_type == MSGTOWNUNDERATTACK) then
{
	_value1 = Call Compile Format ["%1Name",Str _value1];
	PlaySound Format["TownAttacked%1",Round(Random 1)];
};

if (_type == MSGBASESTRUCTUREDESTROYED) then
{
	_value1 = Call Compile Format ["%1StructureDescriptions Select _value1",sideJoinedText];
};

Format[messageText Select _type,_value1,_value2] Call GroupChatMessage;

//5/5/7 MM - Created file.
