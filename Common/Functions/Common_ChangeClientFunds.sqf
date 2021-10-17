//Last modified 5/4/7
//*****************************************************************************************
//Description: Changes the player's funds by passed amount.
//*****************************************************************************************
Private["_amount","_ID","_side"];

_amount = _this Select 0;
_side = _this Select 1;
_ID = _this Select 2;

Call Compile Format["%1Player%2Funds = %1Player%2Funds + _amount;",Str _side,_ID];
Call Compile Format["if (%1Player%2Funds < 0) then {%1Player%2Funds = 0};",Str _side,_ID];
Call Compile Format["PublicVariable ""%1Player%2Funds"";",Str _side,_ID];

//*****************************************************************************************
//3/15/7 MM - Created file.
