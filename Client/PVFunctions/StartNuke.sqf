// start the nuke atack effect on client , blank in if player near atack pos

_param0 = _this select 0; // 1
_param1 = _this select 1; // 1
_param2 = _this select 2; // PARAMETER (WestSlot1) f.e.


if ((player distance position _param2)<2000) then 
{
	titleText ["", "WHITE IN"]; titleFadeOut 20;
};

[_param2] exec "Client\Support\Nuke\exp.sqs";
