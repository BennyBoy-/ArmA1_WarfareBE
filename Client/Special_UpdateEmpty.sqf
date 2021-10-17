Private["_object"];

_obj = _this select 0;
_time = 0;

while {true} do {
scopeName "loop";
sleep 1;
_time = _time +1;

if (_time > 240) then {deleteVehicle _obj;};
if ((Count Crew _obj > 0)||(_time > 240)||(getDammage _obj >= 1)) then {breakOut "loop";};
};