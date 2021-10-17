//Last modified 3/7/8
//*****************************************************************************************
//Description: Displays stats to UI's info bar.
//*****************************************************************************************
Private["_display","_cclist","_info"];

_display = _this;

//Gear menu
if (!(IsNull campInRange) || barracksInRange && noRemoteGearBuy) then
{
	CtrlShow[220103,true];
}
else
{
	CtrlShow[220103,false];
};

_cclist = Call GetCommandCenters;

if (Count _cclist < 1) then {CtrlShow[220104,false];} else {CtrlShow[220104,true];};

//Construction menu
if (!(IsNull HQInRange && IsNull campInRange && IsNull repairTruckInRange)) then
{
	CtrlShow[220118,true];
}
else
{
	CtrlShow[220118,false];
};

_info = ParseText format ["<t color='#D2FFC9'>%1:</t> %2 (%3/min)",Localize "STRWFFUNDS",Call GetPlayerFunds,Call GetIncome];
(_display DisplayCtrl 220114) CtrlSetStructuredText _info;

_info = ParseText format ["<t color='#D2FFC9'>%1:</t> %2",Localize "STRWFTEAM",clientID];
(_display DisplayCtrl 220115) CtrlSetStructuredText _info;

_info = ParseText format ["<t color='#D2FFC9'>%1:</t> %2",Localize "STRWFMISSION",playerMissionDescription];
(_display DisplayCtrl 220116) CtrlSetStructuredText _info;

_info = ParseText Format ["<t color='#D2FFC9'>Towns:</t> %1",sideJoined Call GetTownsHeld];
(_display DisplayCtrl 220120) CtrlSetStructuredText _info;

_info = ParseText Format ["<t color='#D2FFC9'>Completed:</t> %1 <t color='#D2FFC9'>  Failed:</t> <t color='#FF4040'>%2</t>",missionsCompleted,missionsFailed];
(_display DisplayCtrl 220121) CtrlSetStructuredText _info;

//*****************************************************************************************
//3/7/8 MM - Created file.
