//Last modified 2/13/8
Private["_damage","_damagedBy","_side","_structure"];

_structure = _this Select 0;
_damagedBy = _this Select 1;
_damage = _this Select 2;

_side = Resistance;
if (TypeOf _structure in westStructureNames) then {_side = west};
if (TypeOf _structure in eastStructureNames) then {_side = east};
if (_side == Resistance) ExitWith {};

_timeAttacked = Call Compile Format["%1TimeUnderAttack",Str _side];

if (_side != Side _damagedBy) then
{
	if (time - _timeAttacked > 30 && _damage > 0.05) then
	{
		Call Compile Format["%1TimeUnderAttack = time",Str _side];
		[_side,CMDSIDEMESSAGE,MSGBASEUNDERATTACK] Exec "Server\Server_CommandToSide.sqs";
	};
};

//2/12/8 MM - Created file.
