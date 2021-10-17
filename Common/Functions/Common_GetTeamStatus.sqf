//Last modified 5/29/8
Private["_list","_showCoords","_showHealth","_showName","_showVehicle","_units"];

_rows = ["8","7","6","5","4","3"];
_rows1 = ["9","8","7","6","5","4","3","2","1","0"];
_columns = ["X","Y","Z","A","B","C","D"];
_columns1 = ["A","B","C","D","E","F","G","H","I","J"];

_units = _this Select 0;

_showHealth = false;
if (Count _this > 1) then {_showHealth = _this Select 1};

_showVehicle = false;
if (Count _this > 2) then {_showVehicle = _this Select 2};

_showCoords = false;
if (Count _this > 3) then {_showCoords = _this Select 3};

_list = [];

{
	_text = GetText (configFile >> "CfgVehicles" >> Typeof _x >> "displayName");

	if (_showHealth) then
	{
		if (GetDammage _x > .15) then
		{
			_text = _text + " (Wounded)";
		}
		else
		{
			_text = _text + " (Healthy)";
		};
	};

	if (_showVehicle && _x != Vehicle _x) then
	{
		_text = _text + " in " + GetText (configFile >> "CfgVehicles" >> Typeof Vehicle _x >> "displayName");

		if (_showHealth && !CanMove Vehicle _x) then
		{
			_text = _text + " (immobile)";
		};
	};

	if (_showCoords) then
	{
		_text = _text + " at ";
		_position = GetPos _x;

		_column1 = ((_position Select 0) + 1114) / 2000;
		_column1 = _column1 - (_column1 % 1);
		_column2 = ((_position Select 0) + 1114) % 2000;
		_column2 = _column2 / 200;
		_column2 = _column2 - (_column2 % 1);

		_row1 = ((_position Select 1) + 281) / 2000;
		_row1 = _row1 - (_row1 % 1);
		_row2 = ((_position Select 1) + 281) % 2000;
		_row2 = _row2 / 200;
		_row2 = _row2 - (_row2 % 1);

		_text = _text + Format["%1%2%3%4",_columns Select _column1,_columns1 Select _column2,_rows Select _row1,_rows1 Select _row2];
	};

	_list = _list + [_text];
} ForEach _units;

_list
//5/29/8 MM - Created file.
