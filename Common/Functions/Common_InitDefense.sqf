//Last modified 4/15/8
//Run any common initialization on a defense including cleanup routines after destruction.
Private["_defense","_side"];

_defense = _this Select 0;
_side = _this Select 1;

Call Compile Format["_defense AddEventHandler [""killed"",{[_this,""%1""] Execvm ""Common\Common_DefenseDestroyed.sqf""}]",_side];

//4/15/8 MM - Created file.
