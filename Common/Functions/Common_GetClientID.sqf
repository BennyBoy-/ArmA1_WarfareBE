//Last modified 3/16/7
//*****************************************************************************************
//Description: Get client ID of passed unit.
//*****************************************************************************************
Private["_index"];

//if (Local _this && _this != player) ExitWith {0};

_index = eastSlots Find (VehicleVarName _this);
if (_index < 0) then {_index = westSlots Find (VehicleVarName _this)};

_index + 1

//*****************************************************************************************
//3/16/7 MM - Created file.
