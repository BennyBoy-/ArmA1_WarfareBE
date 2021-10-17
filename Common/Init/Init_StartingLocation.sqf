_location = _this Select 0;

if (IsNil "gameInitialized") then {gameInitialized = false};

waitUntil {gameInitialized};

_baseLayouts = [];
if (Count _this > 1) then {_baseLayouts = _this Select 1;Call Compile Format["%1Layouts = _baseLayouts",Str _location]} else {

_baseLayouts = [BASELAYOUTNORTHTYPE];

if (GetDir _location >= 45) then {_baseLayouts = [BASELAYOUTEASTTYPE]};
if (GetDir _location >= 135) then {_baseLayouts = [BASELAYOUTSOUTHTYPE]};
if (GetDir _location >= 225) then {_baseLayouts = [BASELAYOUTWESTTYPE]};
if (GetDir _location >= 315) then {_baseLayouts = [BASELAYOUTNORTHTYPE]};

Call Compile Format["%1Layouts = _baseLayouts",Str _location]
};