_vehicle = _this select 0;
_act = _this select 2;

_vehicle lock true;

_vehicle removeAction _act;
_act = _vehicle AddAction ["Unlock","Client\Special_Unlock.sqf"];
