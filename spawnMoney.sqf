_unit = _this select 0;
_killer = _this select 1;
 _bounty = 50+ (Round (random 200));
            _killer getVariable["cmoney",_bounty,false];
            _killer globalChat format["you got %1$ by killing %2",_bounty,(_unit select 1)];
            sleep 1;
            _cash = "Evmoney" createVehicle (getPos _unit); _cash setPos (getPos _unit);
_cash setVariable["money",250,true];
_cash setVariable["owner","world",true];
player setVariable["cmoney",(player getVariable "cmoney") - _money,true];
