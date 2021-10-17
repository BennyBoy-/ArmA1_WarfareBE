//*****************************************************************************************
//Description: Returns the ammount of alive CC
//*****************************************************************************************

_typecc = Call Compile Format["%1StructureNames Select %1COMMANDCENTERTYPE",sideJoinedText];
_cclist = [];
{if (TypeOf _x == _typecc && GetDammage _x < 1) then {_cclist = _cclist + [_x]};} ForEach baseStructures;
_cclist;

//*****************************************************************************************