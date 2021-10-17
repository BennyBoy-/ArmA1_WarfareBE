//Last modified 10/26/7
//*****************************************************************************************
//Description: Returns the side of the passed side ID.
//*****************************************************************************************
Private["_side"];

_side = Resistance;

if (_this == EASTID) then {_side = East};
if (_this == WESTID) then {_side = West};

_side

//*****************************************************************************************
//10/26/7 MM - Created file.
