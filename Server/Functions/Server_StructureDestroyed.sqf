//Last modified 2/13/8
Private["_destroyer","_side","_structure","_type"];

_structure = _this Select 0;
_destroyer = _this Select 1;

_side = Resistance;

if (TypeOf _structure in eastStructureNames) then
{
	_side = east;
	_type = eastStructureNames Find TypeOf _structure;
};

if (TypeOf _structure in westStructureNames) then
{
	_side = west;
	_type = westStructureNames Find TypeOf _structure;
};

if (_side == Resistance) ExitWith {};

[_side,CMDSIDEMESSAGE,MSGBASESTRUCTUREDESTROYED,_type] Exec "Server\Server_CommandToSide.sqs";

//2/12/8 MM - Created file.
