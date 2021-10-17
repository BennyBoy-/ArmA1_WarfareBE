//Last modified 12/16/7
//Lock or unlock a vehicle.
Private["_locked","_vehicle"];

_vehicle = _this Select 0;
_locked = _this Select 1;

_vehicle Lock _locked;

//12/16/7 MM - Created file.
