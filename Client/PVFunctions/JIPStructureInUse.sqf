//Last modified 11/16/7
//Description:  Server notifies client that structure is in use when client first joins the game.

_structure = _this Select 0;
_time = _this Select 1;

//Lock the structure until it is free again.
[_structure,_time] ExecVM "Common\Common_StructureInUse.sqf";

//5/12/7 MM - Created file.
