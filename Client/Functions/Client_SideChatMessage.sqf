//Last modified 12/11/7
//SideChat a message and log it.
Private["_message","_onScreen"];

_this Call AddToMessageLog;

if (showMessagesOnScreen) then {player SideChat _this};

//12/11/7 MM - Created file.
