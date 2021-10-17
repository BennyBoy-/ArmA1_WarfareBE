//Last modified 12/16/7
//Lock or unlock a vehicle.
Private["_client","_locked","_side","_vehicle"];

_side = _this Select 0;
_client = _this Select 1;
_vehicle = _this Select 2;
_locked = _this Select 3;

_vehicle Lock _locked;

[CMDSETVEHICLELOCK,_vehicle,_locked] Exec "Server\Server_CommandToClients.sqs"

//12/16/7 MM - Created file.
