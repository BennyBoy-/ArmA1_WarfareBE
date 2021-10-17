_unit = _this select 1;
_id = _this select 2;
_unit removeAction _id;
if ([_unit] call binoStance) then 
{
   _pos = [_unit] call binoLOS;
   if (isNil "_pos") then 
   {
      hint "Target out of range";
   }
   else
   {
      _dist = round ((_unit distance _pos)/10);
      _dir =    ((_pos select 0) - (getPos _unit select 0)) atan2 ((_pos select 1) - (getPos _unit select 1));
      _dir = round (((_dir + 360) mod 360)/10);
      if (_dir < 10) then
      {
         hint format ["Targeting: 0%1 %2", _dir, _dist];
      }
      else
      {
         hint format ["Targeting: %1 %2", _dir, _dist];
      };
      [_pos] execVM "Client\Support\Spotter\nadebarrage.sqf";
      sleep 1;
   };
   
}
else
{
   hint "You must use binoculars\nto select target";
};

sleep 400;

_unit addAction ["Select Target", "Client\Support\Spotter\binotarget.sqf",[],0,FALSE, TRUE,""];