//Last modified 3/6/8
//Display inventory slots to passed GUIs.
Private["_cost","_count","_index","_inventoryGUI","_inventorySlots","_magazines","_miscIsSidarmAmmo","_miscWeapons","_miscImages","_miscSpaces","_sidearmGUI","_sidearmSlot","_primaryAmmo","_primaryAmmoImages","_primaryAmmoSpaces","_secondaryAmmo","_secondaryAmmoImages","_secondaryAmmoSpaces","_sidearmAmmo","_sidearmAmmoImages","_sidearmAmmoSpaces","_sidearmSlots","_slot"];

_inventoryGUI = _this Select 0;
_sidearmGUI = _this Select 1;
_weapons = _this Select 2;
_magazines = _this Select 3;

_primaryAmmo = Call Compile Format["%1PrimaryAmmo",sideJoinedText];
_primaryAmmoImages = Call Compile Format["%1PrimaryAmmoImages",sideJoinedText];
_primaryAmmoSpaces = Call Compile Format["%1PrimaryAmmoSpaces",sideJoinedText];
_primaryAmmoCosts = Call Compile Format["%1PrimaryAmmoCosts",sideJoinedText];

_secondaryAmmo = Call Compile Format["%1SecondaryAmmo",sideJoinedText];
_secondaryAmmoImages = Call Compile Format["%1SecondaryAmmoImages",sideJoinedText];
_secondaryAmmoSpaces = Call Compile Format["%1SecondaryAmmoSpaces",sideJoinedText];
_secondaryAmmoCosts = Call Compile Format["%1SecondaryAmmoCosts",sideJoinedText];

_sidearmAmmo = Call Compile Format["%1SidearmAmmo",sideJoinedText];
_sidearmAmmoImages = Call Compile Format["%1SidearmAmmoImages",sideJoinedText];

_miscWeapons = Call Compile Format["%1MiscWeapons",sideJoinedText];
_miscCosts = Call Compile Format["%1MiscCosts",sideJoinedText];
_miscImages = Call Compile Format["%1MiscImages",sideJoinedText];
_miscSpaces = Call Compile Format["%1MiscSpaces",sideJoinedText];
_miscIsSidarmAmmo = Call Compile Format["%1MiscIsSidearmAmmo",sideJoinedText];

for [{_count = 0},{_count < 12},{_count = _count + 1}] do
{
	CtrlSetText[_inventoryGUI + _count,"\Ca\UI\Data\ui_gear_mag_gs.paa"];
};

for [{_count = 0},{_count < 8},{_count = _count + 1}] do
{
	CtrlSetText[_sidearmGUI + _count,"\Ca\UI\Data\ui_gear_mag_gs.paa"];
};

_cost = 0;
_slot = 0;
_sidearmSlot = 0;
_inventorySlots = [];
_sidearmSlots = [];

{
	_index = _primaryAmmo Find _x;

	if (_index != -1) then
	{
		CtrlSetText[_inventoryGUI + _slot,_primaryAmmoImages Select _index];
		_slot = _slot + 1;
		_inventorySlots = _inventorySlots + [_primaryAmmo Select _index];
		_cost = _cost + (_primaryAmmoCosts Select _index);

		for [{_count = (_primaryAmmoSpaces Select _index) - 1},{_count > 0},{_count = _count - 1}] do
		{
			CtrlSetText[_inventoryGUI + _slot,""];
			_slot = _slot + 1;
			_inventorySlots = _inventorySlots + [""];
		};
	};
} ForEach _magazines;

{
	_index = _secondaryAmmo Find _x;
	
	if (_index != -1) then
	{
		CtrlSetText[_inventoryGUI + _slot,_secondaryAmmoImages Select _index];
		_slot = _slot + 1;
		_inventorySlots = _inventorySlots + [_secondaryAmmo Select _index];
		_cost = _cost + (_secondaryAmmoCosts Select _index);

		for [{_count = (_secondaryAmmoSpaces Select _index) - 1},{_count > 0},{_count = _count - 1}] do
		{
			CtrlSetText[_inventoryGUI + _slot,""];
			_slot = _slot + 1;
			_inventorySlots = _inventorySlots + [""];
		};
	};
} ForEach _magazines;

{
	_index = _miscWeapons Find _x;
	
	if (_index != -1) then
	{
		_cost = _cost + (_miscCosts Select _index);

		if (_miscIsSidarmAmmo Select _index) then
		{
			CtrlSetText[_sidearmGUI + _sidearmSlot,_miscImages Select _index];
			_sidearmSlot = _sidearmSlot + 1;
			_sidearmSlots = _sidearmSlots + [_miscWeapons Select _index];
		}
		else
		{
			CtrlSetText[_inventoryGUI + _slot,_miscImages Select _index];
			_slot = _slot + 1;
			_inventorySlots = _inventorySlots + [_miscWeapons Select _index];

			for [{_count = (_miscSpaces Select _index) - 1},{_count > 0},{_count = _count - 1}] do
			{
				CtrlSetText[_inventoryGUI + _slot,""];
				_slot = _slot + 1;
				_inventorySlots = _inventorySlots + [""];
			};
		};
	};
} ForEach _magazines;

{
	_index = _sidearmAmmo Find _x;
	
	if (_index != -1) then
	{
		CtrlSetText[_sidearmGUI + _sidearmSlot,_sidearmAmmoImages Select _index];
		_sidearmSlot = _sidearmSlot + 1;
		_sidearmSlots = _sidearmSlots + [_sidearmAmmo Select _index];
	};
} ForEach _magazines;

[_slot,_cost,_inventorySlots,_sidearmSlots]

//3/5/8 MM - Created file.
