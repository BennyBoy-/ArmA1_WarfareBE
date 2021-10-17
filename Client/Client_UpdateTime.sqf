if (IsServer) then {Exit};
if (fastTime) then {0 setOvercast 0};

while {true}do{
while {true}do{
sleep 1;
	if (!fastTime) exitwith {};
	SkipTime (currentTime - DayTime);
};
};