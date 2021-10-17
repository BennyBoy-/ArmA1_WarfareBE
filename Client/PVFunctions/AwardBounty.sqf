//Last modified 3/2/8
Private["_bounty","_name","_side","_type"];

_side = _this Select 0;
_type = _this Select 1;

_name = unitBountyDescriptions Select _type;
_bounty = (unitBounties Select _type) * BOUNTYMODIFIER;
_bounty = _bounty - (_bounty % 1);

Format[Localize "STRWFAWARDBOUNTY",_bounty,_name] Call GroupChatMessage;
_bounty Call ChangePlayerFunds;

//3/16/7 MM - Created file.
