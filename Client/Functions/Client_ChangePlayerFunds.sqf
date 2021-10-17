//Last modified 3/16/7
//*****************************************************************************************
//Description: Changes the player's funds by passed amount.
//*****************************************************************************************

Call Compile Format["%1Player%2Funds = %1Player%2Funds + _this;if (%1Player%2Funds < 0) then {%1Player%2Funds = 0};PublicVariable ""%1Player%2Funds""",sideJoined,clientID];

//*****************************************************************************************
//3/15/7 MM - Created file.
