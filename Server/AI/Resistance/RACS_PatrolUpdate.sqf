Private["_vehicles","_infantry","_group","_logicName","_patrolArray","_towns"];

_vehicles = _this select 0;
_infantry = _this select 1;
_group = _this select 2;
_logicName = _this select 3;
_patrolArray = _this select 4;
_towns = _this select 5;
_exit = false;

while {!_exit} do {
sleep 20;

{if (Count Crew _x < 1) then {_x setDammage 1};if (getDammage _x >= 1) then {_vehicles = _vehicles - [_x];};} forEach _vehicles;
sleep 1;
{if (_x == vehicle _x) then {_x setDammage 1};if (getDammage _x >= 1) then {_infantry = _infantry - [_x];};} forEach _infantry;
sleep 1;
if ((isNull _group)||(Count units _group < 1)) then {_exit = true;};

};

[_patrolArray,_logicName,_towns,4000] ExecVM "Server\AI\Resistance\RACS_Patrol.sqf";