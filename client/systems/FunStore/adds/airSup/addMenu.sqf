_man = _this select 0;
_id = _this select 2;

_man removeAction _id;

if(jadam or lgb or cbuap or cbuat or cas or cbumine) then {as1 = _man addAction [localize "STR_MENUFXD","client\systems\FunStore\adds\airSup\callFixed.sqf",[], 40, false, false, "", airSup_stg];};
if(helo or trans) then {as2 = _man addAction [localize "STR_MENUHEL","client\systems\FunStore\adds\airSup\callHelo.sqf",[], 30, false, false, "", airSup_stg];};
as4 = _man addAction [localize "STR_MENUEXT","client\systems\FunStore\adds\airSup\exitMenu.sqf",[], 10, false, false, "", airSup_stg];

if(true)exitWith{};