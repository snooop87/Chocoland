// THANKS to KiloSwiss  scripty by KiloSwiss
private["_action","_victim","_reward","_punishment","_killerMoney","_newMoney"];

_action = _this select 0;
_victim = _this select 1;
_reward = _this select 2;

hint"hallo test";
switch (_action) do{
	
	case "reward" :{
		titleText [format["%1", _victim], "PLAIN DOWN", 0];
		_killerMoney = player getVariable "cmoney";
		_newMoney = _killerMoney + _reward;
		player setVariable ["cmoney", _newMoney, false];
            
	};
};