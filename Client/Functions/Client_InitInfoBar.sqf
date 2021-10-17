//Last modified 4/25/8
//*****************************************************************************************
//Description: Inits UI's info bar.
//*****************************************************************************************
Private["_commitTime","_display","_cclist"];

_display = _this;

//Gear menu
if (!(IsNull campInRange) || barracksInRange) then
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

(_display DisplayCtrl 220100) CtrlSetFade 1;
(_display DisplayCtrl 220100) CtrlCommit 0;
(_display DisplayCtrl 220100) CtrlSetBackgroundColor [0.82,1,0.82,0.25];
(_display DisplayCtrl 220100) CtrlSetFade 0;
(_display DisplayCtrl 220100) CtrlCommit 0;

(_display DisplayCtrl 220101) CtrlSetTooltip "Get missions, fast-travel, & command.";
(_display DisplayCtrl 220102) CtrlSetTooltip "Buy men & vehicles or transfer funds.";
(_display DisplayCtrl 220103) CtrlSetTooltip "Buy personal gear.";
(_display DisplayCtrl 220104) CtrlSetTooltip "Command Center features.";
(_display DisplayCtrl 220105) CtrlSetTooltip "Vote for new commander.";
(_display DisplayCtrl 220118) CtrlSetTooltip "Build structures.";
(_display DisplayCtrl 220119) CtrlSetTooltip Format["Close screen. (Or press %1 to open/close.)",ActionKeysNames["TeamSwitch",1]];

(_display DisplayCtrl 220111) CtrlSetText (Name player);
(_display DisplayCtrl 220112) CtrlSetText (Rank player);
(_display DisplayCtrl 220113) CtrlSetText ("\Warfare\Images\rank_" + (Rank player) + ".paa");
(_display DisplayCtrl 220113) CtrlSetTextColor [0.82,1.00,0.82,1.0]; // 04/24/2008 Karel

//*****************************************************************************************
//3/7/8 MM - Created file.
