//Last modified 10/26/7
//Returns total amount of camps in a town that belong to specified side.
Private["_camps","_side","_sideID","_total","_town"];

_town = _this Select 0;
_side = _this Select 1;

_sideID = _side Call GetSideID;

_camps = Call Compile Format["%1Camps",Str _town];
_total = 0;

{if (Call Compile Format["%1SideID == _sideID",_x]) then {_total = _total + 1};} ForEach _camps;

_total

//10/26/7 MM - Created file.
