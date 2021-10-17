//Last modified 12/11/7
//Get location's name & send message to player.
Private["_location","_type","_value1","_value2"];

_type = _this Select 0;
_location = _this Select 1;

_value1 = 0;
if (Count _this > 2) then {_value1 = _this Select 2};

_value2 = 0;
if (Count _this > 3) then {_value1 = _this Select 3};

_name = Call Compile Format ["%1Name",Str _location];

Format[messageText Select _type,_name,_value1,_value2] Call GroupChatMessage;

//5/5/7 MM - Created file.
