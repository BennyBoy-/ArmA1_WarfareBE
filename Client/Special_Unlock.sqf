_vehicle = _this select 0;
_act = _this select 2;

_vehicle lock false;

_vehicle removeAction _act;
_act = _vehicle AddAction ["Lock","Client\Special_Lock.sqf"];