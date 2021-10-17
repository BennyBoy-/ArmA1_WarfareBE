//Last modified 12/7/7
//Description:  Client notifies server that salvage is available.
Private["_client","_notifySide","_side","_sideID","_vehicle"];

_side = _this Select 0;
_client = _this Select 1;
_vehicle = _this Select 2;
_sideID = _this Select 3;

_notifySide = _sideID Call GetSideFromID;
Call Compile Format["%1KnownSalvage = %1KnownSalvage + [_vehicle]",Str _notifySide];

//12/7/7 MM - Created file.
