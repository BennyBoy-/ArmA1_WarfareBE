//Last modified 10/26/7
//*****************************************************************************************
//Description: Returns the towns owned by passed side.
//*****************************************************************************************
Private["_count","_held","_side","_sideID","_town"];

_side = _this;
_sideID = _side Call GetSideID;
_SV = 0;

for [{_count = Count towns - 1},{_count >= 0},{_count = _count - 1}] do
{
	_town = towns Select _count;

	if (Call Compile Format["%1SideID == _sideID",Str _town]) then
	{
		_SV = _SV + Call Compile Format["%1SupplyValue",Str _town];
	};
};

_SV

//*****************************************************************************************
//5/4/7 MM - Created file.
