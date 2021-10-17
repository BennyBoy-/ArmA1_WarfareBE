//Last modified 3/20/8
//Return map label for base structure type.
//[base building] Call GetStructureMarkerLabel

Private["_class","_label","_structure"];

_structure = _this Select 0;

_label = "";
_class = TypeOf _structure;

if (_class == "WarfareBEastBarracks" || _class == "WarfareBWestBarracks") then {_label = "B"};
if (_class == "WarfareBEastLightFactory" || _class == "WarfareBWestLightFactory") then {_label = "L"};
if (_class == "WarfareBEastHeavyFactory" || _class == "WarfareBWestHeavyFactory") then {_label = "H"};
if (_class == "WarfareBEastAircraftFactory" || _class == "WarfareBWestAircraftFactory") then {_label = "A"};
if (_class == "WarfareBEastHeadquarters" || _class == "WarfareBWestHeadquarters") then {_label = "C"};

_label

//5/25/7 MM - Created file.
