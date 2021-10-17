_structure = _this Select 0;
_time = _this Select 1;

baseStructuresInUse = baseStructuresInUse + [_structure];
Sleep _time;
baseStructuresInUse = baseStructuresInUse - [_structure];

