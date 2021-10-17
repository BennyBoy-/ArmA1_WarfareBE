_side = _this Select 0;
_list = [];

_type = Call Compile Format["%1StructureNames Select %1BARRACKSTYPE",_side];
{if (TypeOf _x == _type && GetDammage _x < 1) then {_list = _list + [_x]};} ForEach baseStructures;
_type = Call Compile Format["%1StructureNames Select %1LIGHTTYPE",_side];
{if (TypeOf _x == _type && GetDammage _x < 1) then {_list = _list + [_x]};} ForEach baseStructures;
_type = Call Compile Format["%1StructureNames Select %1HEAVYTYPE",_side];
{if (TypeOf _x == _type && GetDammage _x < 1) then {_list = _list + [_x]};} ForEach baseStructures;
_type = Call Compile Format["%1StructureNames Select %1AIRCRAFTTYPE",_side];
{if (TypeOf _x == _type && GetDammage _x < 1) then {_list = _list + [_x]};} ForEach baseStructures;

_list;