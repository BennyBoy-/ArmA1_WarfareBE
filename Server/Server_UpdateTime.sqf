//Last modified 11/9/7

currentTime = DayTime;
PublicVariable "currentTime";

//Prevent choppy clouds with fast time.
if (fastTime) then {0 setOvercast 0};
while {true}do{
sleep 1;
	if (fastTime) then {
//	1 hour = 24 hours.
	SkipTime FASTTIMERATE;
	currentTime = DayTime;
	PublicVariable "currentTime";
};
};