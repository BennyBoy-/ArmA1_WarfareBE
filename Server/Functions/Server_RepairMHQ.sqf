////////////////////////////////////////////////////////////////////////////////
/// <header>
/// This SQF Script created using Script Edit v0.7 on 2008-11-30 14:43:00Z
/// 
/// <author></author>
/// <filename>Server_RepairMHQ.sqf</filename>
/// <version>1.0.0</version>
/// 
/// <summary>
/// 
/// </summary>
/// 
/// <parameters>
/// 
/// </parameters>
/// </header>
////////////////////////////////////////////////////////////////////////////////

Private["_type","_side","_pos","_dir","_MHQ","_HQName"];

_type = _this Select 0;
_side = _this Select 1;
_pos  = _this Select 2;
_dir  = _this Select 3;

_MHQ = Call Compile Format["%1MHQ",Str _side];

_pos = GetPos _MHQ;
_dir = GetDir _MHQ;
deleteVehicle _MHQ;

_HQName = "BMP2_MHQ";
if(_side == West) then {
	_HQName = "M113_MHQ";
};

_MHQ = _HQName createVehicle _pos;
_MHQ SetDir _dir;
_MHQ AddEventHandler ["killed", {[_side] ExecVM "Server\Functions\Server_addKilledMHQFunc.sqf"}];

Call Compile Format["%1MHQ = _MHQ;%1Base = _MHQ;%1MHQDeployed = false; %1MHQRepairing = false;",Str _side];
Call Compile Format["PublicVariable ""%1MHQ"";PublicVariable ""%1Base"";PublicVariable ""%1MHQDeployed""; PublicVariable ""%1MHQRepairing"";",Str _side];

[_side,CMDSIDEMESSAGE,MSGMHQREPAIRED] Exec "Server\Server_CommandToSide.sqs";