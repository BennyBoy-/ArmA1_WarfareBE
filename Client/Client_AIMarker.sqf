//Infantry marker for the player squad members script by Benny.
Private ["_unit"];

_unit = _this select 0;
_continue = true;
_number = 0;
_marker = objNull;
_loop = 1;

if (getDammage _unit >= 1) then {_continue = false,_loop = -1};

if (_continue) then {
	_marker = Format ["AI%1",AIMarkerCount];
	CreateMarkerLocal [_marker,GetPos _unit];
	_marker SetMarkerTypeLocal "Vehicle";
	_marker SetMarkerColorLocal "ColorYellow";
	_marker SetMarkerSizeLocal [0.7,0.7];

	_number = [str(_unit)] Call AINumberRetrieval;
	Call Compile Format ["_marker SetMarkerTextLocal ""%1""",_number];

	AIMarkerCount = AIMarkerCount + 1;
};

while {_loop == 1} do {
	sleep 1;
	_marker SetMarkerPosLocal GetPos _unit;
	if ((getDammage _unit >= 1)||(isNull _unit)) then {deleteMarkerLocal _marker;_loop = -1;};
};