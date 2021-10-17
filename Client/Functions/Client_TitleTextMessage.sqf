//Last modified 12/11/7
//TitleText a message and log it.
Private["_message","_style"];

_message = _this Select 0;
_style = "PLAIN";
if (Count _this > 1) then {_style = _this Select 1};

_message Call AddToMessageLog;

if (showMessagesOnScreen) then {TitleText[_message,_style]};

//12/11/7 MM - Created file.
