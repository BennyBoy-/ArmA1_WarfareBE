//Last modified 8/30/7
//Returns array of destroyed units only.
// Modify to exclude MHQ
Private["_destroyedUnits","_units"];

_units = _this;
_destroyedUnits = [];

{if (GetDammage _x >= 1) then {
	// do not add MHQs to destroyed units.
	if (!(TypeOf _x == "M113_MHQ") && !(TypeOf _x == "BMP2_MHQ")) then {
		_destroyedUnits = _destroyedUnits + [_x];
	};
 };
} ForEach _units;

_destroyedUnits

//8/30/7 MM - Created file.
