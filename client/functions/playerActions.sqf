
//	@file Version: 1.1
//	@file Name: playerActions.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 20/11/2012 05:19
//  @file Modified: 07/12/2012 23:35
//	@file Args:

aActionsIDs = [];
//Fuel can actions.
aActionsIDs = aActionsIDs + [player addAction["Take Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"],  5] select 0); player setVariable["fuelFull",1,true]; hint "You have taken a fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Fuel_can"],  5] select 0) < 4 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 0) AND ((nearestObjects[player, ["Fuel_can"], 3] select 0) getVariable "fuel")']];
aActionsIDs = aActionsIDs + [player addAction["Take Empty Jerry Can", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Fuel_can"],  5] select 0); player setVariable["fuelEmpty",1,true]; hint "You have taken a empty fuel can."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Fuel_can"],  5] select 0) < 4 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 0) AND !((nearestObjects[player, ["Fuel_can"], 3] select 0) getVariable ["fuel", false])']];
aActionsIDs = aActionsIDs + [player addAction["Refuel Jerry Can", "client\actions\refuelFuelCan.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Land_A_FuelStation_Feed", "BarrelBase", "Land_Ind_FuelStation_Feed_Ep1"],  3] select 0) < 3 AND ((player getVariable "fuelFull") == 0) AND ((player getVariable "fuelEmpty") == 1)']];

aActionsIDs = aActionsIDs + [player addAction["Take Repair kit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Suitcase"],  5] select 0); player setVariable["repairkits", (player getVariable "repairkits")+1,true]; hint "You have taken a repair kit."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Suitcase"],  5] select 0) < 4 and (player getVariable "repairkits")<2']];
aActionsIDs = aActionsIDs + [player addAction["Take Medkit", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["CZ_VestPouch_EP1"],  5] select 0); player setVariable["medkits", (player getVariable "medkits")+1,true]; hint "You have taken a medkit."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["CZ_VestPouch_EP1"],  5] select 0) < 4 and (player getVariable "medkits")<2 ']];
aActionsIDs = aActionsIDs + [player addAction["Take Canned food", "noscript.sqf", '_nobj = (nearestobjects [player, ["Land_stand_small_EP1"],  5] select 0); _nobj setVariable["food",(_nobj getVariable "food")-1,true]; player setVariable["canfood",(player getVariable "canfood")+1,true]; player playmove "AinvPknlMstpSlayWrflDnon"; if(_nobj getVariable "food" < 1) then {_nobj spawn {_this setDamage 1.31337; sleep 2; deleteVehicle _this;}; hint "You have taken some canned food\nNo more food left on the table";} else {hint format["You have taken some canned food\n(Table still has %1)", (_nobj getVariable "food")];};',0,false,false,"",'player distance (nearestobjects [player, ["Land_stand_small_EP1"],  5] select 0) < 5 and (player getVariable "canfood") < 3 and (nearestobjects [player, ["Land_stand_small_EP1"],  5] select 0) getVariable "food" > 0']];
aActionsIDs = aActionsIDs + [player addAction["Take Canned food", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Land_Sack_EP1"],  5] select 0); player setVariable["canfood", (player getVariable "canfood")+1,true]; hint "You have taken some canned food."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Land_Sack_EP1"],  5] select 0) < 5 and (player getVariable "canfood")<3']];
aActionsIDs = aActionsIDs + [player addAction["Bottle up water", "noscript.sqf", '_nobj = (nearestobjects [player, ["Land_Barrel_water"],  5] select 0); _nobj setVariable["water",(_nobj getVariable "water")-1,true]; player setVariable["water",(player getVariable "water")+1,true]; player playmove "AinvPknlMstpSlayWrflDnon"; if(_nobj getVariable "water" < 1) then {_nobj spawn {_npos = getPos _this; _vecu = vectorUp _this; _vecd = vectorDir _this; deleteVehicle _this; _veh = createVehicle ["Land_Barrel_empty", _npos, [], 0, "CAN_COLLIDE"]; _veh setVectorDirAndUp [_vecd, _vecu]; _veh spawn {sleep 5; deleteVehicle _this};};hint "You have filled water bottle.\nBarrel is empty";} else {hint format["You have filled water bottle.\n(Water left: %1)", (_nobj getVariable "water")];};',0,false,false,"",'player distance (nearestobjects [player, ["Land_Barrel_water"],  5] select 0) < 5 and (player getVariable "water") < 4 and (nearestobjects [player, ["Land_Barrel_water"],  5] select 0) getVariable "water" > 0']];
aActionsIDs = aActionsIDs + [player addAction["Take bottle of water", "noscript.sqf", 'deleteVehicle (nearestobjects [player, ["Land_Teapot_EP1"],  5] select 0); player setVariable["water", (player getVariable "water")+1,true]; hint "You have taken a bottle of water."; player playmove "AinvPknlMstpSlayWrflDnon"',0,false,false,"",'player distance (nearestobjects [player, ["Land_Teapot_EP1"],  5] select 0) < 5 and (player getVariable "water")<4']];
aActionsIDs = aActionsIDs + [player addAction["Fill Water Bottle", "noscript.sqf", ' player setVariable["water",(player getVariable "water")+1,true]; hint "You have filled a water bottle";',1,false,false,"",' player distance (nearestobjects [player, ["Land_pumpa"],  3] select 0) < 3 and (player getVariable "water")<4']];

//Pickup Money
aActionsIDs = aActionsIDs + [player addAction["Pickup Money", "client\actions\pickupMoney.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["EvMoney"],  5] select 0) < 5']];

//Pickup SpawnBeacon (Satelit)
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#E01B1B"">Destroy spawn beacon</t>"), "client\actions\pickupBeacon.sqf", 1, 1, false, false, "", '_currBeacon = (nearestobjects [player, ["Satelit"],  5]); player distance (_currBeacon select 0) < 5; ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "ownerUID") == (getPlayerUID player) OR str(playerSide) == "GUER" OR str(playerSide) != ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "faction") OR ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "faction") == "WORLD"']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#21DE31"">Repack spawn beacon</t>"), "client\actions\pickupBeacon.sqf", 0, 1, false, false, "", '_currBeacon = (nearestobjects [player, ["Satelit"],  5]); player distance (_currBeacon select 0) < 5; ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "ownerUID") == (getPlayerUID player) OR str(playerSide) == "GUER" OR str(playerSide) != ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "faction") OR ((nearestObjects[player, ["Satelit"], 3] select 0) getVariable "faction") == "WORLD"']];

//Interact with radar trucks
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#21DE31"">Deploy radar</t>"), "client\functions\radarDeploy.sqf",nil, 6, false, false, "", '_currRadar = (nearestobjects [player, ["M1133_MEV_EP1"],  5]); player distance (_currRadar select 0) < 5; ((nearestObjects[player, ["M1133_MEV_EP1"], 10] select 0) getVariable "deployed") == 0 AND str(playerSide) != "GUER"']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#E01B1B"">Repack radar</t>"), "client\functions\radarPack.sqf", nil, 6, false, false, "", '_currRadar = (nearestobjects [player, ["M1130_HQ_unfolded_Base_EP1"],  5]); player distance (_currRadar select 0) < 5; ((nearestObjects[player, ["M1130_HQ_unfolded_Base_EP1"], 10] select 0) getVariable "deployed") == 1 AND str(playerSide) != "GUER"']];

//Mission interactions
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#21DE31"">Release VIP</t>"), "client\functions\releaseVIP.sqf", nil, 6, false, true, "", '_unitVIP = (nearestobjects [player, ["Functionary1"],  5] select 0); alive _unitVIP; (_unitVIP getVariable "released") == 0']];

//Camonet pickup
aActionsIDs = aActionsIDs + [player addAction["Pickup ChocoBomb", "client\actions\pickupcamonet.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Explosive"],  5] select 0) < 5']];
aActionsIDs = aActionsIDs + [player addAction["Activate ChocoBomb", "client\functions\chocobomb.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Explosive"],  5] select 0) < 5']];

//Cancel action
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#FFFFFF"">Cancel Action</t>"), "noscript.sqf", 'doCancelAction = true;', 1, false, false, "", 'mutexScriptInProgress']];

aActionsIDs = aActionsIDs + [player addAction["Get on Board", "client\functions\getonBoard.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Land_LHD_1"],  500] select 0) < 800 && ((getposatl player) select 2) < 102']];

aActionsIDs = aActionsIDs + [player addAction["Activate BaseCore", "client\functions\basecore.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Misc_cargo_cont_tiny"],  20] select 0) < 5; _obj = (nearestobjects [player, ["Misc_cargo_cont_tiny"],  5]); (_obj select 0 )getvariable"basecore"== 0;']];
aActionsIDs = aActionsIDs + [player addAction["Destroy BaseCore", "client\functions\basecore_d.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["Misc_cargo_cont_tiny"],  20] select 0) < 5; _obj = (nearestobjects [player, ["Misc_cargo_cont_tiny"],  5]); (_obj select 0 )getvariable"basecore"== 1;']];
aActionsIDs = aActionsIDs + [player addAction["Activate BaseCore2", "client\functions\basecore_1.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["76n6ClamShell"],  20] select 0) < 20; _obj = (nearestobjects [player, ["76n6ClamShell"],  20]); (_obj select 0 )getvariable"basecore" == 0;']];
aActionsIDs = aActionsIDs + [player addAction["Destroy BaseCore2", "client\functions\basecore_d1.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["76n6ClamShell"],  20] select 0) < 20; _obj = (nearestobjects [player, ["76n6ClamShell"],  20]); (_obj select 0 )getvariable"basecore" == 1;']];

aActionsIDs = aActionsIDs + [player addAction["Redeem chocos", "client\functions\satPhone.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["SatPhone"],  20] select 0) < 3']];
//HaloSpawn

aActionsIDs = aActionsIDs + [player addAction["Ready for HaloSpawn", "client\functions\spawnHalo.sqf", [], 1, false, false, "", 'player distance (nearestobjects [player, ["ProtectionZone_Ep1"],  30] select 0) < 30 And spawnHalo']];

// chocopack BEBEBE

aActionsIDs = aActionsIDs + [player addAction[("<t color=""#BEBEBE"">weapon to Chocopack</t>"), "addons\scripts\saveChocopack.sqf",[],-10,false,false,"", '_test = player getVariable "chocopack";_test != "";_primary = primaryWeapon player;_primary != ""']];
aActionsIDs = aActionsIDs + [player addAction[("<t color=""#BEBEBE"">Chocopack</t>"), "addons\scripts\createChocopack.sqf",[],-10,false,false,"", '_test = player getVariable "chocopack";_test != "";_primary = primaryWeapon player;_primary == ""']];
if(player getvariable"fly" == 1)then 
{playerflyId = player addAction [format ["<t color='#585858'>%1</t>", "FLY OFF"], "addons\proving_ground\fnc_fly1.sqf",[],-12,false,false,"","local player"];
 playerflyoff = player addAction [format ["<t color='#D8D8D8'>%1</t>", "FLY ON"], "addons\proving_ground\fnc_fly2.sqf",[],-10,false,false,"","local player"];
};
if(player getvariable"skin" == 1)then 
{ skinId = player addAction[('<t color=''#FF33CC''>' + ('get back to Player') +  '</t>'),'client\systems\FunStore\adds\reverseskin.sqf'];
  bombId = player addAction[('<t color=''#FF33CC''>' + ('BLEW UP!!!!') +  '</t>'),'client\systems\FunStore\adds\bomb.sqf'];
};
if(player getvariable"sat" == 1)then 
{playersatId = player addAction [format ["<t color='#585858'>%1</t>", "activate Sattelite"], "client\systems\FunStore\adds\fnc_sattelite_fnc.sqf",[],-12,false,false,"","local player"];
 player globalchat"check mouseWheel commands for Sattelite";
};
