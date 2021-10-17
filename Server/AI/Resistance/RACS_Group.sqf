Private ["_group"];
_group = _this select 0;
_exit = false;

while {!_exit} do {
sleep 10;
if (Count units _group < 1) then {_exit = true;deleteGroup _group;};
};