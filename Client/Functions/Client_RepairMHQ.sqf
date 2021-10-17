////////////////////////////////////////////////////////////////////////////////
/// <header>
/// This SQF Script created using Script Edit v0.7 on 2008-11-29 20:06:59Z
/// 
/// <author></author>
/// <filename>Client_RepairMHQ.sqf</filename>
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

Private["_repTruck","_objs","_exc","_sorted","_veh","_type","_dam","_slt"];

_exc = 0;
_repTruck = _this select 0;
_funds = Call GetPlayerFunds;

// check closest vehicle
_objs = nearestObjects [position _repTruck, ["Tank"], 15];

if (Count _objs <= 0) then {
	_exc = 1;
	[playerSide, "HQ"] sideChat "No nearby vehicles.";
};

if ((_funds < 25000) && (_exc == 0)) then {[playerSide, "HQ"] sideChat "$25000. is needed in order to repair the MHQ.";_exc = 1;};

if(_exc == 0) then {
	_sorted = [_repTruck,_objs] Call SortByDistance;
	_veh = _sorted select 0;
	_type = typeOf _veh;
};

if ((_type != "M113_MHQ") && (_type != "BMP2_MHQ") && (_exc == 0)) then {
	[playerSide, "HQ"] sideChat "MHQ is not close enough.";
	_exc = 1;
};

_dam = getDammage _veh;

if((_exc == 0) && (GetDammage _veh < 1)) then {
	[playerSide, "HQ"] sideChat "MHQ does not need to be repaired.";
	_exc = 1;
};

if(_exc == 0) then {
	if(Call Compile Format ["%1MHQRepairing", Str sideJoined]) then {
		[playerSide, "HQ"] sideChat "MHQ is already being repaired.";
		_exc = 1;
	};
	
	[playerSide, "HQ"] sideChat "Repairing...";
	
	Call Compile Format["%1MHQRepairing = true;",Str sideJoined];
	Call Compile Format["PublicVariable ""%1MHQRepairing"";",Str sideJoined];
	
	// sleep time
	_slt = 30.0;
	sleep _slt;
	
	if(!(alive _repTruck)) then {
		Call Compile Format["%1MHQRepairing = false;",Str sideJoined];
		Call Compile Format["PublicVariable ""%1MHQRepairing"";",Str sideJoined];
		_exc = 1;
	};
	
	if(_exc == 0) then {
		[CMDREQUESTMHQREPAIR,_type,_pos,_dir] Exec "Client\Client_CommandToServer.sqs";
		(-25000) Call ChangePlayerFunds;
	} else {
		[playerSide, "HQ"] sideChat "MHQ repair aborted.";
	};
	
};