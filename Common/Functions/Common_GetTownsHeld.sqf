//Last modified 10/26/7
//*****************************************************************************************
//Description: Returns the towns owned by passed side.
//*****************************************************************************************
Private["_count","_held","_sideID"];

_held = 0;
_sideID = _this Call GetSideID;
for [{_count = Count towns - 1},{_count >= 0},{_count = _count - 1}] do
{
	if (Call Compile Format["%1SideID == _sideID",Str (towns Select _count)]) then {_held = _held + 1};
};

_held

//*****************************************************************************************
//3/15/7 MM - Created file.
