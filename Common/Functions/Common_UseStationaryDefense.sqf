//Last modified 5/25/7
//Checks for nearby defenses and orders unit(s) into them.
//[units,range] Call UseStationaryDefense

Private["_count","_defense","_defenseTypes","_emptyDefenses","_range","_total","_totalDefenses","_unit","_units"];

_units = _this Select 0;
_range = _this Select 1;

_total = Count _units;
if (_total < 1) ExitWith {};

_defenseTypes = Call Compile Format["%1DefenseNames",Side Leader Group (_units Select 0)];
_defenses = NearestObjects[GetPos Leader Group (_units Select 0),_defenseTypes,_range];

_emptyDefenses = [];

{if (_x EmptyPositions "gunner" > 0) then {_emptyDefenses = _emptyDefenses + [_x]};} ForEach _defenses;

for [{_count = 0},{_count < _total},{_count = _count + 1}] do
{
	_unit = _units Select _count;

	_totalDefenses = Count _emptyDefenses;
	if (_totalDefenses < 1) ExitWith {};

	//If not in a vehicle then check for available defense.
	if (Alive _unit && _unit == Vehicle _unit) then
	{
		_defense = _emptyDefenses Select (_totalDefenses - 1);

		[_unit] AllowGetIn true;
		_unit AssignAsGunner _defense;
		_emptyDefenses = _emptyDefenses - [_defense];
	};
};

//5/25/7 MM - Created file.
