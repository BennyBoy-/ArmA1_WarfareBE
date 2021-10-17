//Last modified 3/2/8
Private["_airport","_color","_marker","_name","_side","_value"];

_airport = _this Select 0;
_value = _this Select 1;

_side = Localize "STRWFEAST";
if (_value != East) then {_side = Localize "STRWFWEST"};

_name = Call Compile Format["%1Name",_airport];

[Format[Localize "STRWFTOWNCAPTURED",_name,_side]] Call TitleTextMessage;

_marker = Format["%1LocationMarker",_airport];
_color = GetMarkerColor _marker;

if (_value == sideJoined) then
{
	if (_color != "ColorGreen" && _color != "ColorRed") then
	{
		_marker SetMarkerColorLocal "ColorGreen";
	}
	else
	{
		_marker SetMarkerColor "ColorGreen";
	};
}
else
{
	if (_color == "ColorGreen" && _color == "ColorRed") then
	{
		_marker SetMarkerColor "ColorRed";
	}
};

//2/5/8 MM - Created file.
