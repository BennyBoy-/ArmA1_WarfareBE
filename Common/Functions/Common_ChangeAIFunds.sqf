//Last modified 3/27/8
//*****************************************************************************************
//Description: Changes the player's funds by passed amount.
//*****************************************************************************************
Private["_amount","_ID","_side"];

_amount = _this Select 0;
_side = _this Select 1;
_ID = _this Select 2;

if (_side == West || _side == East) then
{
	Call Compile Format["%1AI%2Funds = %1AI%2Funds + _amount;",Str _side,_ID];
	Call Compile Format["if (%1AI%2Funds < 0) then {%1AI%2Funds = 0};",Str _side,_ID];
	Call Compile Format["PublicVariable ""%1AI%2Funds"";",Str _side,_ID];
};

//*****************************************************************************************
//5/4/7 MM - Created file.
