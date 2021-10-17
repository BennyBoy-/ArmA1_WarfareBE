//;Last modified 3/6/8
//;Description: Create any markers.
_side = _this Select 0;

_base = Call Compile Format["%1Base",Str _side];
_teams = Call Compile Format["%1StarterTeams",Str _side];
_marker = Format["Respawn_%1",Str _side];
CreateMarkerLocal [_marker,GetPos _base];
_marker SetMarkerTypeLocal "Headquarters";
_marker SetMarkerColorLocal "ColorGreen";
CreateMarkerLocal ["playerFireMissionMarker",[0,0,0]];
"playerFireMissionMarker" SetMarkerShapeLocal "Ellipse";
"playerFireMissionMarker" SetMarkerSizeLocal [0,0];
"playerFireMissionMarker" SetMarkerColorLocal "ColorRed";
CreateMarkerLocal ["playerFireMissionMarker1",[0,0,0]];
"playerFireMissionMarker1" SetMarkerTypeLocal "FireMission";
"playerFireMissionMarker1" SetMarkerColorLocal "ColorRed";
_count = 0;
_total = Count _teams;
_loop = 1;
//if (_total < 1) then {Goto "AdvancedSquad"};
if (_total < 1) then {_loop = 2};
while {_loop == 1}do{
//#CreateStarterSquadMarker//////////////////////////////////////////
	_marker = Format["%1StarterSquad%2Marker",Str _side,_count + 1];
	CreateMarkerLocal [_marker,[0,0,0]];
	_marker SetMarkerTextLocal Format["%1 %2",Localize "STRWFSTARTER",_count + 1];
	_marker SetMarkerTypeLocal "Empty";
	_marker SetMarkerColorLocal "ColorBlue";
	if (_side != sideJoined) then {_marker SetMarkerColorLocal "ColorRed"};
	_marker = Format["%1StarterSquad%2MissionMarker",Str _side,_count + 1];
	CreateMarkerLocal [_marker,[0,0,0]];
	_marker SetMarkerTypeLocal "Empty";
	_marker SetMarkerColorLocal "ColorBlue";
	if (_side != sideJoined) then {_marker SetMarkerColorLocal "ColorRed"};
	_marker = Format["%1StarterSquad%2DestinationMarker",Str _side,_count + 1];
	CreateMarkerLocal [_marker,[0,0,0]];
	_marker SetMarkerTypeLocal "Empty";
	_marker SetMarkerColorLocal "ColorBlue";
	if (_side != sideJoined) then {_marker SetMarkerColorLocal "ColorRed"};
	_count = _count + 1;
//	if (_count < _total) then {Goto "CreateStarterSquadMarker"};
	if (_count >= _total) exitwith {};
};
//#AdvancedSquad////////////////////////////////////////////////////////

	_count = 0;
	_teams = Call Compile Format["%1Teams",Str _side];
	_total = Count _teams;

//#CreateAdvancedSquadMarker////////////////////////////////////////////
while {true}do{
	_marker = Format["%1AdvancedSquad%2Marker",Str _side,_count + 1];
	CreateMarkerLocal [_marker,[0,0,0]];
	_marker SetMarkerTextLocal Format["%1 %2",Localize "STRWFTEAM",_count + 1];
	_marker SetMarkerTypeLocal "Empty";
	_marker SetMarkerSizeLocal [0.75,0.75];
	_marker SetMarkerColorLocal "ColorBlue";
	if (_side != sideJoined) then {_marker SetMarkerColorLocal "ColorRed"};
	_count = _count + 1;
	if (_count >= _total) exitwith {};
};
//	if (_count < _total) then {Goto "CreateAdvancedSquadMarker"};