_camp = _this Select 0;
_town = _this Select 1;

Call Compile Format["if (IsNil ""%1Camps"") then {%1Camps = []};",Str _town];
Call Compile Format["%1Camps = %1Camps + [_camp]",Str _town];

_index = Call Compile Format["%1Camps Find _camp",Str _town];
_marker = Format["%1Camp%2",Str _town,_index];
CreateMarkerLocal [_marker,GetPos _camp];
_marker SetMarkerTypeLocal "Camp";
_marker SetMarkerColorLocal "ColorBlue";

waitUntil {commonInitComplete};

Sleep 10;

Call Compile Format["if (IsNil ""%1SideID"") then {%1SideID = RESISTANCEID};",Str _camp];
Call Compile Format["if (IsNil ""%1SupplyValue"") then {%1SupplyValue = %2SupplyValue};",Str _camp,Str _town];

if (IsServer) then {
_flagPole = "FlagCarrierSouth" CreateVehicle GetPos _camp;
_flagPole SetFlagTexture "";
[_camp,_town] Exec "Server\Server_UpdateCamp.sqs";
};