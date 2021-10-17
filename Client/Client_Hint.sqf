//Global hint file, display all kind of hints on the client.
_displayList = ["The C Button in the Options Menu allows you to open the Class menu.","Artillery Shells can be customized after Artillery Upgrade","As Engineer you can repair any vehicles.","As Specials Operation you can sabote enemy Vehicles","The Howitzer require HEAT ammunition loaded in order to be used.","As Commander you can set the respawn location of the trucks in the Command Center Tab.","Use a repair truck to repair the MHQ if this one is destroyed","Helicopters can take in cargo Vehicles and Static defenses.","Always vote for a commander! without commander your team won't go far!","Capturing town is important, but don't forget to defend them by increasing the supplies value of those.","Upgrading factories is important as commander, the Command Center tab allow you to upgrade factories.","M113 Ambu and BMP2 Ambu act as mobile respawn points.","In order to win, you have to destroy every buildings of the enemy!","Visit us at www.hs-clan.com (and visit http://benny.h15.info/ if you need any tutorials related to ArmA or Hammer)","No matter what they says, ALT + F4 doesn't give a nuke","HS Fact: McFly is a travesti, you can rent him for a night (rAIN might be jealous!).","HS Fact: Brit is sexy (but he wear women underwears!)","HS Fact: 13 is drunk","HS Fact: Don't accept any drink from Ghost"];
_count = 0;
sleep 30;
while {true} do {
if (_count > count _displayList) then {_count = 0};
hint (_displayList select _count);
_count = _count + 1;
sleep 240;
};