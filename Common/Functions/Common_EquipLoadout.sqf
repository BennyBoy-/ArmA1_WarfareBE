//Last modified 3/6/8
//Equips unit with passed loadout.

Private["_ammo","_unit","_weapon","_weapons"];

_unit = _this Select 0;
_weapons = _this Select 1;
_ammo = _this Select 2;

RemoveAllWeapons _unit;

{_unit AddMagazine _x} ForEach _ammo;
{_unit AddWeapon _x} ForEach _weapons;

_weapon = PrimaryWeapon _unit;

if (_weapon != "") then
{
	_muzzles = GetArray (configFile >> "CfgWeapons" >> _weapon >> "muzzles");

	if (Count _muzzles > 1) then
	{
		_unit SelectWeapon (_muzzles Select 0);
	}
	else
	{
		_unit SelectWeapon _weapon;
	};
};

_unit RemoveWeapon "Binocular";
_unit RemoveWeapon "NVGoggles";

_unit AddWeapon "Binocular";
_unit AddWeapon "NVGoggles";

//3/6/8 MM - Created file.
