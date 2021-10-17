Private["_infantry","_group","_logicName","_cpt"];

_infantry = _this select 0;
_group = _this select 1;
_logicName = _this select 2;
_exit = false;
_cpt = 0;

while {!_exit} do {
	sleep 30;

	if ((isNull _group)||(Count units _group < 1)) then {_exit = true;};
	_cpt = _cpt + 30;
	if (_cpt > 3000) then {_cpt = 0;{_x setDammage 1}forEach units _group};

};

[_infantry,_logicName,300] ExecVM "Server\AI\Resistance\RACS_StrikeTeam.sqf";