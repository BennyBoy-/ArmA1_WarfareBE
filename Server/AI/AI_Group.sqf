Private ["_group"];
_group = _this select 0;
_name = _this select 1;
_exit = false;

while {!_exit} do {
sleep 20;
if (Count units _group < 1) then {_exit = true;Call Compile Format ["%1TeamNameAlive = false",_name];deleteGroup _group;};
};