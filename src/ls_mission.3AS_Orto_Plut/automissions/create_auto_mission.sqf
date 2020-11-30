
sprintFromFire = {
_unit = _this select 0;
if (
!(isPlayer _unit) and
!(animationState _unit == "AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDf") and
!(animationState _unit == "AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDfr") and
!(animationState _unit == "AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDf") and
!(animationState _unit == "AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDfl")
) then {
_unit disableAI "ANIM";
_unit disableAI "MOVE";
_rndAnim = [
"AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDf",
"AmovPercMrunSrasWrflDfl_AmovPercMrunSrasWrflDfr",
"AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDf",
"AmovPercMrunSrasWrflDfr_AmovPercMrunSrasWrflDfl"
] call BIS_fnc_SelectRandom;
[[_unit, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
sleep 0.75;
_unit enableAI "ANIM";
_unit enableAI "MOVE";
};
};



_rndTask = ["LAAT_Support","ATTE_Support","OfficerKill","ClearEnemiPresence","DestroyTank","DestroyAA","SearchAndStealData","DestroedEnemyStarShip","StashDestroy","EnemyNearBase"] call BIS_fnc_SelectRandom;

_taskId = missionNamespace getVariable "taskID";
_actTaskId = str _taskId;
_taskId = _taskId + 1;
missionNamespace setVariable ["taskID",_taskId, true];



if (_rndTask == "DestroyTank") then {

_coordinates = [
"mark_rndTask_enemyTank_1",
"mark_rndTask_enemyTank_2",
"mark_rndTask_enemyTank_3",
"mark_rndTask_enemyTank_4",
"mark_rndTask_enemyTank_5"
];


_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["Наша разведка заметила тяжелую технику противника в данном районе. Нужно уничтожить её, пока она не начала действовать. Также, по сообщениям, наземную технику сопровождает воздушная. Для уничтожения техники, не забудьте взять ракетные установки. ", "Стальные звери", "Уничтожить"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"destroy"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 1950];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;
_veh = createVehicle ["O_OKalani_King_AAT_Green_01", getMarkerPos _rndPoint, [], 0, "NONE"];
[_veh] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh;
_veh1 = createVehicle ["O_OKalani_MTT_01", getMarkerPos _rndPoint, [], 100, "NONE"];
[_veh1] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh1;



_veh addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (currentWeapon _hitMan == secondaryWeapon _hitMan) then {
_whoHitted setDamage ((damage _whoHitted) + 0.3);
};
}];

_veh1 addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (currentWeapon _hitMan == secondaryWeapon _hitMan) then {
_whoHitted setDamage ((damage _whoHitted) + 0.3);
};
}];


/*
_veh24 = [getMarkerPos _rndPoint, 180, "RD501_light_infantry_transport_CIS_Mkii", east] call BIS_fnc_spawnVehicle;
_veh2 = _veh24 select 0;
[_veh2] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh2;
_veh2 engineOn true;

хз че, темпест взрывается при спавне

*/

_veh2 addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (currentWeapon _hitMan == secondaryWeapon _hitMan) then {
_whoHitted setDamage ((damage _whoHitted) + 0.3);
};
}];







[["Стальные звери", _veh, 2100], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];




_group1 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group2 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group2 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group2, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group3 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group3 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group3, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};

_group4 = createGroup east;
for "_i" from 1 to 6 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group4 createUnit [_rndClassNames, getPosATL _veh1, [], 25, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group4, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};





_group5 = createGroup east;
for "_i" from 1 to 3 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group5 createUnit [_rndClassNames, getPosATL _veh1, [], 5, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
};


_group6 = createGroup east;
for "_i" from 1 to 3 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group6 createUnit [_rndClassNames, getPosATL _veh, [], 5, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
};




sleep 0.1;
waitUntil {!(alive _veh) and !(alive _veh1)};
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";






}else{
_waitTill = 0;
sleep 1;
};

};


};







if (_rndTask == "StashDestroy") then {
_coordinates = [
"mark_rndTask_destroyedShip_1",
"mark_rndTask_destroyedShip_2",
"mark_rndTask_destroyedShip_3",
"mark_rndTask_destroyedShip_4",
"mark_rndTask_destroyedShip_5"
];
_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["Внимание всем! Наша разведка засекла, что в данном районе КНС разместила топливный бак и припасы для близлежайшего МТТ. Мы не можем позволить, чтобы они перезаправили транспортник. Нужно уничтожить припасы противника, но всё не так просто. Дроиды разместили энергощит над припасами, так что придётся подрывать всё вручную. Выдвигайтесь как можно скорее. ", "Важные ресурсы", "Уничтожить"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"container"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 1950];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;
_veh = createVehicle ["SWOP_containerTank", getMarkerPos _rndPoint, [], 0, "NONE"];
_veh setDir (random 360);
_veh setVectorUp surfaceNormal getposatl _veh;
_veh3 = createVehicle ["land_BlasterStaticShield", getMarkerPos _rndPoint, [], 35, "NONE"];
_veh3 attachTo [_veh,[0,0,0]];







_veh4 = createVehicle ["swop_mtt_static", getMarkerPos _rndPoint, [], 70, "NONE"];
_veh4 setDir (random 360);
_veh4 setVectorUp surfaceNormal getposatl _veh4;
{
_x setDamage 1;
} forEach nearestTerrainObjects [_veh4, [], 50, false];


_veh5 = createVehicle ["RD501_droideka_normal", getPosATL _veh4, [], 15, "NONE"];
[_veh5] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh5;



[[_veh, ["Заложить заряд взрывчатки",{
_del = _this select 0;
_un = _this select 1;
if ((_un distance _del) <= 10) then {
_un playActionNow "PutDown";
sleep 2;
hint "Заряд установлен. Время до взрыва: 30 секунд";
sleep 30;
_mine = createMine ["IEDUrbanBig_F", getPosATL _del, [], 0];
sleep 0.5;
_mine setDamage 1;
_del setDamage 1;
[[_del, 2], "automissions\EMP_pre.sqf"] remoteExec ["execVM", 0, false];
}else{
systemChat "Подойдите ближе";
};

}]],"addAction",true,true] call BIS_fnc_MP;




[["Важные ресурсы", _veh, 2100], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];




_group1 = createGroup east;
for "_i" from 1 to 17 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group2 = createGroup east;
for "_i" from 1 to 7 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group2 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group2, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group3 = createGroup east;
for "_i" from 1 to 7 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group3 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group3, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};

_group4 = createGroup east;
for "_i" from 1 to 6 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group4 createUnit [_rndClassNames, getPosATL _veh4, [], 25, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group4, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};





_group5 = createGroup east;
for "_i" from 1 to 5 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group5 createUnit [_rndClassNames, getPosATL _veh, [], 5, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
};


_group6 = createGroup east;
for "_i" from 1 to 5 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group6 createUnit [_rndClassNames, getPosATL _veh, [], 5, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
};




sleep 0.1;
waitUntil {!(alive _veh)};
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";







}else{
_waitTill = 0;
sleep 1;
};

};


};



if (_rndTask == "LAAT_Support") then {

[1001, ["Пилот СНДК: Всем, кто меня слышит, это...*помехи*...у меня 16 раненых и 7 мертвых. Мы совершили вынужденную посадку, и нас окружили. Взлёт невозможен, они повсюду!  ", "PLAIN DOWN"]] remoteExec ["cutText"];
{playSound ["LATT_sup_start",true];} remoteExec ["call",0];

sleep 13.5;
[1001, ["Пилот СНДК: Кто нибудь слышит?! Нам нужна помощь, сейчас же...*помехи*", "PLAIN DOWN"]] remoteExec ["cutText"];
sleep 1.9;




_coordinates = [
"mark_rndTask_destroyedShip_1",
"mark_rndTask_destroyedShip_2",
"mark_rndTask_destroyedShip_3",
"mark_rndTask_destroyedShip_4",
"mark_rndTask_destroyedShip_5"
];
_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["Внимание! Один из наших транспортных СНДК был подбит и совершил вынужденную посадку в данной локации. Пилот сообщает, что у него на борту были раненые. Нужно во что бы то ни стало вытащить наших бойцов. Запаситесь медикаментами, они вам понадобятся. Стабилизируйте состояние раненых бойцов и зачистите район от неприятеля. Как только местность будет очищена - мы вышлем 2 медицинских СНДК. Выдвигайтесь в ближайшее время.   ", "Падший ангел", "Спасти"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"heal"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 1950];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;
_veh = createVehicle ["land_Destroyed_LAAT", getMarkerPos _rndPoint, [], 0, "NONE"];
_veh setDir (random 360);
_veh setVectorUp surfaceNormal getposatl _veh;
_veh1 = createVehicle ["CraterLong", getMarkerPos _rndPoint, [], 35, "NONE"];
_veh2 = createVehicle ["land_BlasterStaticShield", getMarkerPos _rndPoint, [], 35, "NONE"];
_veh1 attachTo [_veh,[0,0,-2.2]];
_veh2 attachTo [_veh,[0,0,0.5]];

_group = createGroup west;
_unitPilot = _group createUnit ["SWLB_clone_pilot_base_P2", getPosATL _veh, [], 7, "FORM"];
_unitPilot allowDamage false;
removeHeadgear _unitPilot;
_unitPilot addHeadgear "SWLB_P1_Pilot_Helmet";
_unitPilot setVariable ["WBK_Healed",0,true];
[_unitPilot] execVM "automissions\deleteDeadObject.sqf";
_unitCover = _group createUnit ["SWLB_clone_base_P2", getPosATL _veh, [], 7, "FORM"];
[_unitCover] joinSilent grpNull;
_unitCover allowDamage false;
_unitCover disableAI "MOVE";
_unitCover setVariable ["WBK_Healed",0,true];
[_unitCover] execVM "automissions\deleteDeadObject.sqf";
[[_unitCover, "Acts_CrouchingIdleRifle01"],"switchMove",true,true] call BIS_fnc_MP;
[[_unitCover, ((getDir  _veh) - 180)],"setDir",true,true] call BIS_fnc_MP;
_unitCover attachTo [_veh,[1.3,-2.1,-1.5]];
detach _unitCover;
[_unitCover] spawn {
_un = _this select 0;
while {(alive _un)} do {
_un disableAI "ANIM";
_rndUn = ["Acts_CrouchingIdleRifle01","Acts_CrouchingWatchingRifle01","Acts_CrouchingWatchingRifle02","Acts_CrouchingReloadingRifle01"] call BIS_fnc_SelectRandom;
[[_un, _rndUn],"switchMove",true,true] call BIS_fnc_MP;
sleep 3.8;
};

};

_unitPilot attachTo [_veh,[0.15,1.2,-1.5]];
detach _unitPilot;
_unitPilot disableAI "MOVE";
[[_unitPilot, "Acts_Injured_Driver_Loop"],"switchMove",true,true] call BIS_fnc_MP;
[[_unitPilot, (random 360)],"setDir",true,true] call BIS_fnc_MP;


[[_unitPilot, ["Стабилизировать",{
_del = _this select 0;
_un = _this select 1;
if ((_un distance _del) <= 3) then {
if (_del getVariable "WBK_Healed" == 0) then {
_del setVariable ["WBK_Healed",1,true];
[[_del, "Acts_Injured_Driver_go"],"switchMove",true,true] call BIS_fnc_MP;
_un playActionNow "PutDown";
sleep 1.5;
1001 cutText ["Пилот СНДК: ...нет, нет! Лучше помогите остальным, они критически ранены. Дай сюда бакту... Так, я сам справлюсь... Скорее помогите остальным!","PLAIN DOWN"];
sleep 7.5;
[[_del, "Acts_Injured_Driver_Loop"],"switchMove",true,true] call BIS_fnc_MP;
}else{
1001 cutText ["Пилот СНДК: Я в порядке... Оклемаюсь, иди лучше помоги остальным!","PLAIN DOWN"];
};
}else{
systemChat "Подойдите ближе";
};
}]],"addAction",true,true] call BIS_fnc_MP;



_rndClassNames = ["SWLB_clone_base_P2","SWLB_clone_sergeant_base_P2"] call BIS_fnc_SelectRandom;
_unit5 = _group createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 10, "FORM"];
_unit5 disableAI "ANIM";
_unit5 setVariable ["WBK_Healed",0,true];
_rndUn = ["Acts_CivilInjuredArms_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredLegs_1"] call BIS_fnc_SelectRandom;
[[_unit5, _rndUn],"switchMove",true,true] call BIS_fnc_MP;
_rndClassNames = ["SWLB_clone_base_P2","SWLB_clone_sergeant_base_P2"] call BIS_fnc_SelectRandom;
_unit1 = _group createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 10, "FORM"];
_unit1 disableAI "ANIM";
_unit1 setVariable ["WBK_Healed",0,true];
_rndUn = ["Acts_CivilInjuredArms_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredLegs_1"] call BIS_fnc_SelectRandom;
[[_unit1, _rndUn],"switchMove",true,true] call BIS_fnc_MP;
_rndClassNames = ["SWLB_clone_base_P2","SWLB_clone_sergeant_base_P2"] call BIS_fnc_SelectRandom;
_unit2 = _group createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 15, "FORM"];
_unit2 disableAI "ANIM";
_unit2 setVariable ["WBK_Healed",0,true];
_rndUn = ["Acts_CivilInjuredArms_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredLegs_1"] call BIS_fnc_SelectRandom;
[[_unit2, _rndUn],"switchMove",true,true] call BIS_fnc_MP;
_rndClassNames = ["SWLB_clone_base_P2","SWLB_clone_sergeant_base_P2"] call BIS_fnc_SelectRandom;
_unit3 = _group createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 15, "FORM"];
_unit3 disableAI "ANIM";
_unit3 setVariable ["WBK_Healed",0,true];
_rndUn = ["Acts_CivilInjuredArms_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredLegs_1"] call BIS_fnc_SelectRandom;
[[_unit3, _rndUn],"switchMove",true,true] call BIS_fnc_MP;
_rndClassNames = ["SWLB_clone_base_P2","SWLB_clone_sergeant_base_P2"] call BIS_fnc_SelectRandom;
_unit4 = _group createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 20, "FORM"];
_unit4 disableAI "ANIM";
_unit4 setVariable ["WBK_Healed",0,true];
_rndUn = ["Acts_CivilInjuredArms_1","Acts_CivilInjuredChest_1","Acts_CivilInjuredGeneral_1","Acts_CivilInjuredLegs_1"] call BIS_fnc_SelectRandom;
[[_unit4, _rndUn],"switchMove",true,true] call BIS_fnc_MP;


{
_x allowDamage false;
[[_x, ["Стабилизировать",{
_del = _this select 0;
_un = _this select 1;
if ((_un distance _del) <= 3) then {
if (_del getVariable "WBK_Healed" == 0) then {
_del setVariable ["WBK_Healed",1,true];
_un playActionNow "PutDown";
sleep 1.5;
hint "Юнит стабилизирован";
[[_del, "Acts_InjuredSpeakingRifle01"],"switchMove",true,true] call BIS_fnc_MP;
};
}else{
systemChat "Подойдите ближе";
};
}]],"addAction",true,true] call BIS_fnc_MP;
[_x] joinSilent grpNull;
} forEach [_unit5,_unit1,_unit2,_unit3,_unit4];


Min15BF = {
_unit = _this select 0;
sleep 940;
_unit remoteExec ["removeAllActions", 0, true];
_unit setDamage 1;
};

{
[_x] spawn Min15BF;
} forEach [_unitPilot,_unit5,_unit1,_unit2,_unit3,_unit4];

[["Падший ангел", _veh, 2100], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];



_group24 = createGroup west;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_clone_base_P2","SWLB_clone_sergeant_base_P2"] call BIS_fnc_SelectRandom;
_unitLeg = _group24 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 15, "FORM"];
_unitLeg setDamage 0;
_unitLeg addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unitLeg addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[[_unitLeg, "UP"],"setUnitPos",false,false] call BIS_fnc_MP;
};






_veh5 = createVehicle ["RD501_droideka_normal", getPosATL _veh, [], 90, "NONE"];
[_veh5] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh5;





_group228 = createGroup east;
for "_i" from 1 to 45 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit12 = _group228 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 250, "FORM"];
[_unit12] execVM "automissions\deleteDeadObject.sqf";
_unit12 addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit12 addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[[_unit12, "MIDDLE"],"setUnitPos",false,false] call BIS_fnc_MP;
_unit12 doMove (getPosATL _veh);
};

_unit148 = _group228 createUnit ["RD501_opfor_unit_B2_droid_Standard", getMarkerPos _rndPoint, [], 250, "FORM"];
[_unit148] execVM "automissions\deleteDeadObject.sqf";
_unit248 = _group228 createUnit ["RD501_opfor_unit_B2_droid_Standard", getMarkerPos _rndPoint, [], 250, "FORM"];
[_unit248] execVM "automissions\deleteDeadObject.sqf";


_unit148 addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
_unit248 addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];





_veh5 = createVehicle ["O_OKalani_DSD1_Dwarf_Spider_Droid_01", getMarkerPos _rndPoint, [], 15, "FLY"];
[_veh5] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh5;
_veh5 addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
_veh5 addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
_whoHitted setDamage 1;
}];








sleep 0.1;
// waitUntil {(!(_unitPilot getVariable "WBK_Healed" == 0) and !(_unit5 getVariable "WBK_Healed" == 0) and !(_unit1 getVariable "WBK_Healed" == 0) and !(_unit2 getVariable "WBK_Healed" == 0) and !(_unit3 getVariable "WBK_Healed" == 0) and !(_unit4 getVariable "WBK_Healed" == 0)) || (!(alive _unitPilot) and !(alive _unit5) and !(alive _unit1) and !(alive _unit2) and !(alive _unit3) and !(alive _unit4))};

waitUntil {(!(_unitPilot getVariable "WBK_Healed" == 0) and !(_unit1 getVariable "WBK_Healed" == 0) and !(_unit4 getVariable "WBK_Healed" == 0)) || (!(alive _unitPilot) and !(alive _unit1) and !(alive _unit4))};

if (
!(alive _unitPilot) and
!(alive _unit1) and
!(alive _unit4)
) then {
[_actTaskId,"FAILED"] call BIS_fnc_taskSetState;
}else{
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
};
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";







}else{
_waitTill = 0;
sleep 1;
};

};


};







if (_rndTask == "DestroedEnemyStarShip") then {
_coordinates = [
"mark_rndTask_destroyedShip_1",
"mark_rndTask_destroyedShip_2",
"mark_rndTask_destroyedShip_3",
"mark_rndTask_destroyedShip_4",
"mark_rndTask_destroyedShip_5"
];
_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["Около часа назад нам удалось подбить транспортный корабль КНС вместе с сопровождающей его *Гиеной*. Однако, как стало известно, корабли совершили аварийную посадку в данном районе, и почти весь экипаж и *груз* выжил. Сейчас в данном районе уже находятся инженерные части дроидов для починки кораблей. Мы не можем этого допустить, нужно уничтожить инженерную группу вместе с выжившим экипажем, а так же остовы техники.  Для подрыва остовов используйте взрывчатку, из-за энергетических щитов попасть с ракет в обломки невозможно.  ", "Падение", "Уничтожить"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"mine"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 1950];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;
_veh = createVehicle ["swop_vulture_wreckstatic", getMarkerPos _rndPoint, [], 0, "NONE"];
_veh setDir (random 360);
_veh setVectorUp surfaceNormal getposatl _veh;
_veh1 = createVehicle ["swop_hbomber_wreckstatic", getMarkerPos _rndPoint, [], 35, "NONE"];
_veh1 setVectorUp surfaceNormal getposatl _veh1;
_veh1 setDir (random 360);
_veh2 = createVehicle ["CraterLong", getMarkerPos _rndPoint, [], 35, "NONE"];
_veh3 = createVehicle ["land_BlasterStaticShield", getMarkerPos _rndPoint, [], 35, "NONE"];
_veh2 attachTo [_veh,[0,0,-2.7]];
_veh3 attachTo [_veh,[0,0,0]];




_group = createGroup east;
_unitPilot = _group createUnit ["SWLB_b1_pilot_base", getPosATL _veh, [], 15, "FORM"];
[_unitPilot] execVM "automissions\deleteDeadObject.sqf";



_veh6 = createVehicle ["CraterLong", getMarkerPos _rndPoint, [], 35, "NONE"];
_veh7 = createVehicle ["land_BlasterStaticShield", getMarkerPos _rndPoint, [], 35, "NONE"];
_veh6 attachTo [_veh1,[0,0,-1.3]];
_veh7 attachTo [_veh1,[0,0,-0.5]];




_veh4 = createVehicle ["swop_mtt_static", getMarkerPos _rndPoint, [], 70, "NONE"];
_veh4 setDir (random 360);
_veh4 setVectorUp surfaceNormal getposatl _veh4;
{
_x setDamage 1;
} forEach nearestTerrainObjects [_veh4, [], 50, false];


_veh5 = createVehicle ["RD501_droideka_normal", getPosATL _veh4, [], 15, "NONE"];
[_veh5] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh5;



[[_veh1, ["Заложить заряд взрывчатки",{
_del = _this select 0;
_un = _this select 1;
if ((_un distance _del) <= 10) then {
_un playActionNow "PutDown";
sleep 2;
hint "Заряд установлен. Время до взрыва: 30 секунд";
sleep 30;
_mine = createMine ["IEDUrbanBig_F", getPosATL _del, [], 0];
sleep 0.5;
_mine setDamage 1;
_del setDamage 1;
[[_del, 2], "automissions\EMP_pre.sqf"] remoteExec ["execVM", 0, false];
}else{
systemChat "Подойдите ближе";
};

}]],"addAction",true,true] call BIS_fnc_MP;





[[_veh, ["Заложить заряд взрывчатки",{
_del = _this select 0;
_un = _this select 1;
if ((_un distance _del) <= 10) then {
_un playActionNow "PutDown";
sleep 2;
hint "Заряд установлен. Время до взрыва: 30 секунд";
sleep 30;
_mine = createMine ["IEDUrbanBig_F", getPosATL _del, [], 0];
sleep 0.5;
_mine setDamage 1;
_del setDamage 1;
[[_del, 2], "automissions\EMP_pre.sqf"] remoteExec ["execVM", 0, false];
}else{
systemChat "Подойдите ближе";
};

}]],"addAction",true,true] call BIS_fnc_MP;




[["Падение", _veh, 2100], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];




_group1 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group2 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group2 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group2, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group3 = createGroup east;
for "_i" from 1 to 7 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group3 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group3, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};

_group4 = createGroup east;
for "_i" from 1 to 7 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group4 createUnit [_rndClassNames, getPosATL _veh4, [], 25, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[_group4, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};





_group5 = createGroup east;
for "_i" from 1 to 5 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group5 createUnit [_rndClassNames, getPosATL _veh1, [], 5, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
};


_group6 = createGroup east;
for "_i" from 1 to 4 do {
_rndClassNames = ["SWLB_b1_heavy_base","SWLB_b1_at_base","O_Kalani_BX_Commando_Droid_01"] call BIS_fnc_SelectRandom;
_unit = _group6 createUnit [_rndClassNames, getPosATL _veh, [], 5, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
};




sleep 0.1;
waitUntil {!(alive _veh) and !(alive _veh1)};
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";







}else{
_waitTill = 0;
sleep 1;
};

};


};








if (_rndTask == "DestroyAA") then {
_coordinates = [
"mark_rndTask_enemyArt_1",
"mark_rndTask_enemyArt_2",
"mark_rndTask_enemyArt_3",
"mark_rndTask_enemyArt_4",
"mark_rndTask_enemyArt_5"
];
_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["Итак, у нас большие проблемы. Наша разведка доложила, что в данном районе КНС установила специального дроида паука OG-9. Данный дроид выпускает электро-магнитные импульсы на орбиту, что отключает большинство электроники у нашей техники и, соответственно, делает их лёгкой мишенью. Нужно в кратчайшие сроки уничтожить данного дроида. Но будьте осторожны, при выстреле электро-магнитный импульс ударяет и по земле, что может помешать вашему выполнению задания. Советуем приземляться примерно за 1 км от цели, иначе вы рискуете потерять технику. Для уничтожения дроида понадобится ракетная установка. И будьте бдительны, разведка сообщила нам о 2-3 отрядов дроидах защищающих *паука*.   ", "Импульс", "Уничтожить"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"destroy"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 1950];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;
_veh = createVehicle ["O_OKalani_OG_10_Homing_Spider_01", getMarkerPos _rndPoint, [], 0, "NONE"];
[_veh] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh;
[_veh] execVM "automissions\ambienEMPFire.sqf";
[["Импульс", _veh, 2100], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];

_veh addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (currentWeapon _hitMan == secondaryWeapon _hitMan) then {
_whoHitted setDamage 1;
};
}];


_group1 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group1 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group1 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};

_group1 = createGroup east;
for "_i" from 1 to 5 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 55, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};




sleep 0.1;
waitUntil {!(alive _veh)};
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";








}else{
_waitTill = 0;
sleep 1;
};

};


};







if (_rndTask == "SearchAndStealData") then {
_coordinates = [
"mark_rndTask_officer_1",
"mark_rndTask_officer_2",
"mark_rndTask_officer_3",
"mark_rndTask_officer_4",
"mark_rndTask_officer_5"
];
_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["Мы обнаружили дроида-командира в данном районе, однако его поведение вызывает у нас много вопросов. Скорее всего это так называемый *носитель* и в его голове может содержаться много ценной информации. Ваша задача - уничтожить дроида, при этом не повредив его чип, и скачать всю информацию из его головы. Однако, если информация будет верна, и это действительно *носитель*, после уничтожения у него сработает защитная система, и по истечению 30 секунд он взворвётся, прихватив все данные с собой, так что, после его устранения, вы должны поторопиться! Помните, что считывание данных займёт примерно от 5 до 10 секунд.  Выступайте, как только будете готовы.  ", "Ценная информация", "Убить"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"intel"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 2000];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;
_group = createGroup east;
_officer = _group createUnit ["O_OKalani_TSeries_Black_01", getMarkerPos _rndPoint, [], 10, "FORM"];
_officer setVariable ["DataTaken",0,true];
_unit1 = _group createUnit ["RD501_opfor_unit_B2_droid_Standard", getPosATL _officer, [], 3, "FORM"];
[_unit1] execVM "automissions\deleteDeadObject.sqf";
_unit2 = _group createUnit ["RD501_opfor_unit_B2_droid_Standard", getPosATL _officer, [], 3, "FORM"];
[_unit2] execVM "automissions\deleteDeadObject.sqf";
[_group, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
[["Ценная информация", _officer, 2200], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];

_veh = createVehicle ["RD501_droideka_normal", getPosATL _officer, [], 5, "NONE"];
[_veh] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh;

_group1 = createGroup east;
for "_i" from 1 to 13 do {
_rndClassNames = ["SWLB_b1_Security"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group1 = createGroup east;
for "_i" from 1 to 7 do {
_rndClassNames = ["SWLB_b1_Security"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group1 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_Security"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};

_group1 = createGroup east;
for "_i" from 1 to 5 do {
_rndClassNames = ["SWLB_b1_Security","O_Kalani_BX_Commando_Droid_01"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 55, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};




sleep 0.1;
waitUntil {!(alive _officer)};
[[_officer, ["Начать скачивание данных",{
_del = _this select 0;
_un = _this select 1;
if ((_un distance _del) <= 3) then {
_un playActionNow "PutDown";
hint "Скачивание начато. Ожидайте.";
sleep 7;
_del setVariable ["DataTaken",1,true];
}else{
systemChat "Подойдите ближе";
};

}]],"addAction",true,true] call BIS_fnc_MP;

sleep 30;
if (_officer getVariable "DataTaken" == 0) then {
[_actTaskId,"FAILED"] call BIS_fnc_taskSetState;
}else{
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
};
sleep 0.5;
_mine = createMine ["IEDUrbanSmall_F", getPosATL _officer, [], 0];
_mine setDamage 1;
deleteVehicle _officer;
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";
}else{
_waitTill = 0;
sleep 1;
};
};
};




if (_rndTask == "OfficerKill") then {
_coordinates = [
"mark_rndTask_officer_1",
"mark_rndTask_officer_2",
"mark_rndTask_officer_3",
"mark_rndTask_officer_4",
"mark_rndTask_officer_5"
];
_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["Наша разведка доложила о вражеском дроиде-командире в этом районе. Устраните его, чтобы ослабить противника в данном секторе.  ", "Особо важная цель", "Убить"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"kill"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 2000];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;
_group = createGroup east;
_officer = _group createUnit ["SWLB_b1_officer_base", getMarkerPos _rndPoint, [], 10, "FORM"];
[_officer] execVM "automissions\deleteDeadObject.sqf";
_unit1 = _group createUnit ["RD501_opfor_unit_B2_droid_Standard", getPosATL _officer, [], 3, "FORM"];
[_unit1] execVM "automissions\deleteDeadObject.sqf";
_unit2 = _group createUnit ["RD501_opfor_unit_B2_droid_Standard", getPosATL _officer, [], 3, "FORM"];
[_unit2] execVM "automissions\deleteDeadObject.sqf";
[_group, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
[["Особо важная цель", _officer, 2200], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];

_veh = createVehicle ["RD501_droideka_normal", getPosATL _officer, [], 5, "NONE"];
[_veh] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh;

_group1 = createGroup east;
for "_i" from 1 to 7 do {
_rndClassNames = ["SWLB_b1_Security"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group1 = createGroup east;
for "_i" from 1 to 8 do {
_rndClassNames = ["SWLB_b1_Security"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};


_group1 = createGroup east;
for "_i" from 1 to 7 do {
_rndClassNames = ["SWLB_b1_Security"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 115, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};

_group1 = createGroup east;
for "_i" from 1 to 5 do {
_rndClassNames = ["SWLB_b1_Security","O_Kalani_BX_Commando_Droid_01"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 55, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};




sleep 0.1;
waitUntil {!(alive _officer)};
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";
}else{
_waitTill = 0;
sleep 1;
};
};
};






if (_rndTask == "EnemyNearBase") then {





_coordinates = [
"mark_rndTask_enemyNear_1",
"mark_rndTask_enemyNear_2",
"mark_rndTask_enemyNear_3",
"mark_rndTask_enemyNear_4",
"mark_rndTask_enemyNear_5"
];
_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["Наша разведка обнаружила вражеский диверсионный отряд недалёко от нашей базы. Пока противник находится вблизи, он может перехватывать наши радиопереговоры, а также следить за нашими перемещениями и передавать всё это в штаб. Необходимо как можно скорее уничтожить отряд неприятиля.", "Враг у ворот", "Зачистить"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"defend"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 2000];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;



_group1 = createGroup east;



for "_i" from 1 to 15 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base","O_Kalani_BX_Commando_Droid_01"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 15, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[[_unit, "MIDDLE"],"setUnitPos",false,false] call BIS_fnc_MP;
};

_unit1 = _group1 createUnit ["RD501_opfor_unit_B2_droid_Standard", getMarkerPos _rndPoint, [], 3, "FORM"];
[_unit1] execVM "automissions\deleteDeadObject.sqf";
_unit2 = _group1 createUnit ["RD501_opfor_unit_B2_droid_Standard", getMarkerPos _rndPoint, [], 3, "FORM"];
[_unit2] execVM "automissions\deleteDeadObject.sqf";


_unit1 addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
_unit2 addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];


_veh = createVehicle ["RD501_drone_cis_Hover_Droid", getMarkerPos _rndPoint, [], 5, "FLY"];
[_veh] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh;
_veh setPosATL [getPosATL _veh select 0,getPosATL _veh select 1,(getPosATL _veh select 2) + 10];
_veh addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
_veh addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
_whoHitted setDamage 1;
}];


_veh1 = createVehicle ["O_OKalani_DSD1_Dwarf_Spider_Droid_01", getMarkerPos _rndPoint, [], 15, "FLY"];
[_veh1] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh1;
_veh1 addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
_veh1 addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
_whoHitted setDamage 1;
}];


[["Враг у ворот", _veh, 2200], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];

sleep 0.1;
waitUntil {(count units _group1 <= 0) and !(alive _veh) and !(alive _veh1)};
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";
}else{
_waitTill = 0;
sleep 1;
};
};






};









if (_rndTask == "ClearEnemiPresence") then {


[1001, ["Командир Клонов: Всем кто меня слышит, мы столкнулись с большим количеством вражеских дроидов в районе...*помехи*...нам нужна помощь как с земли, так и с воздуха! Кто нибудь нас слышит?!", "PLAIN DOWN"]] remoteExec ["cutText"];


{playSound ["clear_enemyPresence_start",true];} remoteExec ["call",0];
sleep 9;

_coordinates = [
"mark_rndTask_enemyPresence_1",
"mark_rndTask_enemyPresence_2",
"mark_rndTask_enemyPresence_3",
"mark_rndTask_enemyPresence_4",
"mark_rndTask_enemyPresence_5"
];
_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["В данном районе бойцы Республиканских солдат вступили в бой, сообщив о большом количестве дроидов КНС в секторе. Они запрашивают подкрепление как можно скорее. Подоспейте, пока стало не слишком поздно. По прибытию зачистите район от неприятеля.", "Зачистка", "Зачистить"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"attack"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 2000];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;



_veh = createVehicle ["RD501_drone_cis_Hover_Droid", getMarkerPos _rndPoint, [], 5, "FLY"];
[_veh] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh;
_veh setPosATL [getPosATL _veh select 0,getPosATL _veh select 1,(getPosATL _veh select 2) + 10];
_veh addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
_veh addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
_whoHitted setDamage 1;
}];

[["Зачистка", _veh, 2200], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];


_group1 = createGroup east;
for "_i" from 1 to 40 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 25, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[[_unit, "UP"],"setUnitPos",false,false] call BIS_fnc_MP;
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};





_group = createGroup west;
for "_i" from 1 to 5 do {
_rndClassNames = ["SWLB_clone_base_P1","SWLB_clone_sergeant_base_P1","O_Kalani_BX_Commando_Droid_01"] call BIS_fnc_SelectRandom;
_unit = _group createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 20, "FORM"];
_unit setDamage 0.9;
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[[_unit, "UP"],"setUnitPos",false,false] call BIS_fnc_MP;
};




_rndHeli = random 100;
if (_rndHeli >= 65) then {
[1001, ["Командир Клонов: ...*помехи*...десь вражеский боевой корабль! Мы установ...*помехи*...и оступаем к подкреплению! Те, кто сомневаются - сами по себе! Повторяю, вы....вот чёрт! ЧЁРТ!...*помехи*...", "PLAIN DOWN"]] remoteExec ["cutText"];
{playSound ["clear_enemyPresence_heliSpawn",true];} remoteExec ["call",0];
_veh24 = [getMarkerPos _rndPoint, 180, "MEOP_veh_a61_batar_red", east] call BIS_fnc_spawnVehicle;
_veh2 = _veh24 select 0;
[_veh2] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh2;
_veh2 engineOn true;
_veh2 addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (currentWeapon _hitMan == secondaryWeapon _hitMan) then {
_whoHitted setDamage ((damage _whoHitted) + 0.3);
};
}];
}else{
_rndAllDead = random 100;
if (_rndAllDead >= 65) then {
[1001, ["Неизвестно: ...*помехи*...Всем, кто меня слышит...это..Эхо-3 Джульет. Моя команда...большинство из них...Я..я ранен...я теряю много крови...у меня осталось где-то... ", "PLAIN DOWN"]] remoteExec ["cutText"];
{playSound ["clear_enemyPresence_lastUnit",true];} remoteExec ["call",0];
sleep 13;
[1001, ["Неизвестно: Эхо-3 Джульет, это ...*помехи*...немедленно используй бакту, распыли её в районе раны..*помехи*... ", "PLAIN DOWN"]] remoteExec ["cutText"];
sleep 9;
[1001, ["Эхо-3 Джульет: Я...я потерял свою бакту...", "PLAIN DOWN"]] remoteExec ["cutText"];
sleep 2;
[1001, ["Неизвестно: Не слышно, повтори..*помехи*... ", "PLAIN DOWN"]] remoteExec ["cutText"];
sleep 2;
[1001, ["Эхо-3 Джульет: У меня нет бакты...я...*выстрелы*...*помехи*...", "PLAIN DOWN"]] remoteExec ["cutText"];
sleep 5;
[1001, ["Неизвестно: Хорошо, тебе нужно будет найти медикаменты и постараться добраться до наших парней, что выдвинулись к тебе..*помехи*... ", "PLAIN DOWN"]] remoteExec ["cutText"];
sleep 5;
[1001, ["Неизвестно: Приём, ты тут?", "PLAIN DOWN"]] remoteExec ["cutText"];
sleep 3;
[1001, ["Неизвестно: Эхо-3 Джульет, ты слышишь меня?", "PLAIN DOWN"]] remoteExec ["cutText"];
};
};









sleep 0.1;
waitUntil {(count units _group1 <= 0)};
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";
}else{
_waitTill = 0;
sleep 1;
};
};






};








if (_rndTask == "ATTE_Support") then {


[1001, ["Командир АТ-ТЕ: Всем, кто меня слышит, мы попали в засаду противника по пути на аванпост, нам нужна помощь, срочно! Противник на 3 часа, 150 метров...", "PLAIN DOWN"]] remoteExec ["cutText"];
{playSound ["AT_TE_help_start",true];} remoteExec ["call",0];

sleep 7;
[1001, ["Командир АТ-ТЕ: Воздух, у нас воздух! Чёрт, ого...*помехи*", "PLAIN DOWN"]] remoteExec ["cutText"];
sleep 1.9;
[1001, ["Командир АТ-ТЕ: Назад, я сказал назад, НАЗАД!....*помехи*", "PLAIN DOWN"]] remoteExec ["cutText"];


_coordinates = [
"mark_rndTask_enemyTank_1",
"mark_rndTask_enemyTank_2",
"mark_rndTask_enemyTank_3",
"mark_rndTask_enemyTank_4",
"mark_rndTask_enemyTank_5"
];

_rndPoint = _coordinates call BIS_fnc_SelectRandom;
[true, [_actTaskId], ["При доставке припасов наши АТ-ТЕ попали под массированый вражеский огонь как с земли, так и с воздуха. Сами они долго не протянут. Нужно помочь нашим ребятам. По прибытию, даже если не удастся спасти наших, зачистите район полностью.", "Капкан", "Помочь"], getMarkerPos _rndPoint, 1, 2, true] call BIS_fnc_taskCreate;
[_actTaskId,"meet"] call BIS_fnc_taskSetType;

_waitTill = 0;
while {_waitTill == 0} do {
_numPlayersByEntity = {isPlayer _x} count nearestObjects [getMarkerPos _rndPoint, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 2000];
if (_numPlayersByEntity >= 1) then {
_waitTill = 1;



_veh = createVehicle ["RD501_ATTE_MkII", getMarkerPos _rndPoint, [], 25, "FLY"];
createVehicleCrew _veh;
_veh addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];

_veh1 = createVehicle ["RD501_ATTE_MkII", getMarkerPos _rndPoint, [], 55, "FLY"];
createVehicleCrew _veh1;
_veh1 addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];



_veh24 = [getMarkerPos _rndPoint, 180, "RD501_marid_MkII_CIS", east] call BIS_fnc_spawnVehicle;
_veh2 = _veh24 select 0;
[_veh2] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh2;
_veh2 engineOn true;
_veh2 addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (currentWeapon _hitMan == secondaryWeapon _hitMan) then {
_whoHitted setDamage ((damage _whoHitted) + 0.3);
};
}];


_veh3 = createVehicle ["RD501_AAT_Medium_tropical_MkII", getMarkerPos _rndPoint, [], 55, "FLY"];
[_veh3] execVM "automissions\deleteDeadObject.sqf";
createVehicleCrew _veh3;
_veh3 addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];

_veh3 addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (currentWeapon _hitMan == secondaryWeapon _hitMan) then {
_whoHitted setDamage ((damage _whoHitted) + 0.4);
};
}];




[["Капкан", _veh, 2200], "automissions\createMissionName.sqf"] remoteExec ["execVM", 0, false];


_group1 = createGroup east;
for "_i" from 1 to 45 do {
_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
_unit = _group1 createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 55, "FORM"];
[_unit] execVM "automissions\deleteDeadObject.sqf";
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[[_unit, "UP"],"setUnitPos",false,false] call BIS_fnc_MP;
[_group1, getMarkerPos _rndPoint, 30, 7, "MOVE", "SAFE", "YELLOW", "FULL", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
};





_group = createGroup west;
for "_i" from 1 to 5 do {
_rndClassNames = ["SWLB_clone_base_P1","SWLB_clone_sergeant_base_P1","O_Kalani_BX_Commando_Droid_01"] call BIS_fnc_SelectRandom;
_unit = _group createUnit [_rndClassNames, getMarkerPos _rndPoint, [], 20, "FORM"];
_unit setDamage 0.9;
_unit addEventHandler ["Hit",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
if (alive _whoHitted) then {
_rndPlayMove = random 100;
if (_rndPlayMove >= 10) then {
if (stance _whoHitted == "STAND") then {
[_whoHitted] spawn sprintFromFire;
}else{
if ((stance _whoHitted == "CROUCH") and !(animationState _whoHitted == "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr")) then {
[[_whoHitted, "AmovPknlMstpSrasWrflDnon_AmovPknlMevaSrasWrflDr"],"switchMove",true,true] call BIS_fnc_MP;
}else{
if ((stance _whoHitted == "PRONE") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl") and !(animationState _whoHitted == "AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr")) then {
_rndAnim = ["AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDl","AmovPpneMstpSrasWrflDnon_AmovPpneMevaSlowWrflDr"] call BIS_fnc_SelectRandom;
[[_whoHitted, _rndAnim],"switchMove",true,true] call BIS_fnc_MP;
};
};
};
};
};
}];
_unit addEventHandler ["Killed",{
_whoHitted = _this select 0;
_hitMan = _this select 1;
[_whoHitted] joinSilent grpNull;
}];
[[_unit, "UP"],"setUnitPos",false,false] call BIS_fnc_MP;
};












sleep 0.1;
waitUntil {(count units _group1 <= 0) and !(alive _veh2) and !(alive _veh3)};
[_actTaskId,"SUCCEEDED"] call BIS_fnc_taskSetState;
sleep 1800;
automissions = [] execVM "automissions\create_auto_mission.sqf";
}else{
_waitTill = 0;
sleep 1;
};
};






};
