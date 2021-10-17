//Last modified 3/6/8
//Replace each magazine of old ammo with new ammo type.
//Note: Only works for primary weapons.
Private["_count","_magazines","_newAmmo","_newIndex","_newMagazines","_oldAmmo","_oldIndex","_primaryAmmo","_primaryAmmoSpaces","_usedInventory"];

_oldAmmo = _this Select 0;
_newAmmo = _this Select 1;
_magazines = _this Select 2;
_usedInventory = _this Select 3;

if (_oldAmmo == _newAmmo) ExitWith {_magazines};

_newMagazines = +_magazines;

_primaryAmmo = Call Compile Format["%1PrimaryAmmo",sideJoinedText];
_primaryAmmoSpaces = Call Compile Format["%1PrimaryAmmoSpaces",sideJoinedText];

_oldIndex = _primaryAmmo Find _oldAmmo;
_newIndex = _primaryAmmo Find _newAmmo;

if (_oldIndex == -1 || _newIndex == -1) ExitWith {_magazines};

_oldSpace = _primaryAmmoSpaces Select _oldIndex;
_newSpace = _primaryAmmoSpaces Select _newIndex;

_count = 0;

{
	if (_x == _oldAmmo) then
	{
		//If same size or smaller then just swap.
		if (_oldSpace == _newSpace || _newSpace < _oldSpace) then
		{
			_newMagazines Set[_count,_newAmmo];
		}
		else
		{
			if ((_usedInventory - _oldSpace + _newSpace) <= 12) then
			{
				_usedInventory = _usedInventory - _oldSpace + _newSpace;
				_newMagazines Set[_count,_newAmmo];
			}
			else
			{
				_usedInventory =_usedInventory - _oldSpace;

				_newMagazines Set[_count,"**DELETE**"];
				_newMagazines = _newMagazines - ["**DELETE**"];
			};
		};
	};

	_count = _count + 1;
} ForEach _magazines;

_newMagazines = _newMagazines - [_oldAmmo];
_newMagazines

//3/6/8 MM - Created file.
