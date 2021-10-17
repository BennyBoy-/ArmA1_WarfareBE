//Last modified 1/12/8
//Equips unit with standard leader loadout.

Private["_unit"];

_unit = _this;

if (Side _unit == West) then
{
	RemoveAllWeapons _unit;

	_unit AddMagazine "30Rnd_556x45_Stanag";
	_unit AddMagazine "30Rnd_556x45_Stanag";
	_unit AddMagazine "30Rnd_556x45_Stanag";
	_unit AddMagazine "30Rnd_556x45_Stanag";

	_unit AddWeapon "M16A2";
	_unit SelectWeapon "M16A2";

	_unit AddMagazine "M136";
	_unit AddMagazine "M136";
	_unit AddWeapon "M136";
}
else
{
	RemoveAllWeapons _unit;

	_unit AddMagazine "30Rnd_545x39_AK";
	_unit AddMagazine "30Rnd_545x39_AK";
	_unit AddMagazine "30Rnd_545x39_AK";
	_unit AddMagazine "30Rnd_545x39_AK";

	_unit AddWeapon "AK74";
	_unit SelectWeapon "AK74";

	_unit AddMagazine "PG7V";
	_unit AddMagazine "PG7V";
	_unit AddWeapon "RPG7V";
};

_unit AddMagazine "HandGrenade";
_unit AddMagazine "HandGrenade";
_unit AddMagazine "HandGrenade";
_unit AddMagazine "HandGrenade";
_unit AddWeapon "Binocular";
_unit AddWeapon "NVGoggles";

//5/25/7 MM - Created file.
