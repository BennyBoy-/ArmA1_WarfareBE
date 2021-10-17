////////////////////////////////////////////////////////////////////////////////
/// <header>
/// This SQF Script created using Script Edit v0.7 on 2008-11-30 15:31:19Z
/// 
/// <author></author>
/// <filename>RequestMHQRepair.sqf</filename>
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

Private["_client","_side","_type","_pos","_dir"];

_side = _this Select 0;
_client = _this Select 1;
_type = _this Select 2;
_pos = _this Select 3;
_dir = _this Select 4;

[_type, _side, _pos, _dir] execVM "Server\Functions\Server_RepairMHQ.sqf";


