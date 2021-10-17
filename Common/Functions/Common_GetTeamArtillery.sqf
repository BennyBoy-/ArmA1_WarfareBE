//Last modified 4/4/8
//*****************************************************************************************
//Description: Get artillery in range that belongs to the team.
//*****************************************************************************************
Private["_artillery","_count","_destination","_ignoreAmmo","_position","_range","_team","_unit","_units","_vehicle","_x","_y"];

_team = _this Select 0;
_destination = _this Select 1;
_range = _this Select 2;

_ignoreAmmo = false;
if (Count _this > 3) then {_ignoreAmmo = _this Select 3};

_units = Units _team;
_artillery = [];

_names = Call Compile Format["%1ArtilleryNames",Str Side _team];
_weapons = Call Compile Format["%1ArtilleryWeapons",Str Side _team];

for [{_count = Count _units},{_count >= 0},{_count = _count - 1}] do
{
	_unit = _units Select _count;
	_vehicle = Vehicle _unit;
	_type = _names Find TypeOf _vehicle;

	if (_type != -1 && !IsNull Gunner _vehicle && !(_vehicle In _artillery)) then
	{
		if (!IsPlayer Gunner _vehicle) then
		{
			_weapon = _weapons Select _type;

			if (_ignoreAmmo || (_vehicle Ammo _weapon > 0)) then
			{
				_position = GetPos _vehicle;
				_x = (_position Select 0) - (_destination Select 0);
				_y = (_position Select 1) - (_destination Select 1);

				if (sqrt ((_x ^ 2) + (_y ^ 2)) < _range) then
				{
					_artillery = _artillery + [_vehicle];
				};
			};
		};
	};
};

_artillery

//*****************************************************************************************
//12/18/7 MM - Created file.
