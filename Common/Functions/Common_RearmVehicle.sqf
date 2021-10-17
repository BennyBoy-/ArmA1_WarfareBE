//Last modified 4/15/8
//*****************************************************************************************
//Description: Rearms vehicle.
//*****************************************************************************************

Private["_magazines","_vehicle"];

_vehicle = _this;

//rearming turrets.
_vehicle setVehicleAmmo 1;
{_vehicle RemoveMagazine _x} ForEach Magazines _vehicle;

_magazines = GetArray (configFile >> "CfgVehicles" >> Typeof _vehicle >> "Turrets" >> "MainTurret" >> "Magazines");
_magazines = _magazines + GetArray (configFile >> "CfgVehicles" >> Typeof _vehicle >> "Magazines");

//Extra gun in helicopters.
//_magazines = _magazines + GetArray (configFile >> "CfgVehicles" >> Typeof _vehicle >> "Turrets" >> "RightDoorGun" >> "Magazines");

//Commander turrets.
//_magazines = _magazines + GetArray (configFile >> "CfgVehicles" >> Typeof _vehicle >> "Turrets" >> "MainTurret" >> "Turrets" >> "CommanderOptics" >> "Magazines");

{_vehicle AddMagazine _x} ForEach _magazines;

Reload _vehicle;

if (typeOf _vehicle == "KA50") then {
	_vehicle removeweapon "VikhrLauncher";
	_vehicle removemagazine "12Rnd_Vikhr_KA50";
	_vehicle addWeapon "Ch29Launcher";
	_vehicle addMagazine "4Rnd_Ch29";
	_vehicle addMagazine "4Rnd_Ch29";
	_vehicle addMagazine "4Rnd_Ch29";
};

//*****************************************************************************************
//4/3/8 MM - Created file.
