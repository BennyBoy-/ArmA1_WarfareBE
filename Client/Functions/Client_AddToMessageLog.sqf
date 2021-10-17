//Last modified 12/14/7
//If player is a commander then init as commander.
Private["_total"];

_total = Count messageLog;

//Add to end of list.
if (_total < MESSAGELOGHISTORY) then
{
	messageLog = messageLog + [_this];
}
else
{
	messageLog Set[0,"[**DELETED**]"];
	messageLog = messageLog - ["[**DELETED**]"];
	messageLog = messageLog + [_this];
};

//12/7/7 MM - Created file.
