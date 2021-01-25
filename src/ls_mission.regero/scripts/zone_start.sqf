_zoneMarker = (_this select 0);
_closestPlayer = (_this select 1);
_zoneMarker = _closestPlayer getPos [700, random 360];

//get first player


// _markerPos = _zoneMarker;
// _playerList = allPlayers apply {[_markerPos distanceSqr _x, _x]};
// _playerList sort true;
// _closestPlayer = (_playerList select 0) param [1, objNull];




_veh = createVehicle ["O_gethHoverArm_veh_F", _zoneMarker, [], 0, "NONE"];
createVehicleCrew _veh;

_veh2 = createVehicle ["O_gethHoverL_Arm_veh_F", _zoneMarker, [], 40, "NONE"];
createVehicleCrew _veh2;

_veh3 = createVehicle ["O_gethHoverArm_veh_F", _zoneMarker, [], 60, "NONE"];
createVehicleCrew _veh3;

_veh4 = createVehicle ["O_gethHoverL_Arm_veh_F", _zoneMarker, [], 80, "NONE"];
createVehicleCrew _veh4;

_veh5 = createVehicle ["O_gethHoverArm_veh_F", _zoneMarker, [], 100, "NONE"];
createVehicleCrew _veh5;

_veh6 = createVehicle ["O_gethHoverL_Arm_veh_F", _zoneMarker, [], 120, "NONE"];
createVehicleCrew _veh6;

_veh7 = createVehicle ["MEOP_reap_RachniTur_F", _zoneMarker, [], 140, "NONE"];
createVehicleCrew _veh7;

_veh8 = createVehicle ["MEOP_reap_RachniTur_F", _zoneMarker, [], 160, "NONE"];
createVehicleCrew _veh8;

_veh9 = createVehicle ["MEOP_reap_RachniTur_F", _zoneMarker, [], 180, "NONE"];
createVehicleCrew _veh9;

_veh10 = createVehicle ["MEOP_reap_RachniTur_F", _zoneMarker, [], 200, "NONE"];
createVehicleCrew _veh10;

_group1 = createGroup east;
for "_i" from 1 to 15 do {
	_unit = _group1 createUnit ["Reaper_husk_Z", _zoneMarker, [], 115, "FORM"];
};
_group2 = createGroup east;
for "_i" from 1 to 15 do {
	_unit = _group2 createUnit ["Reaper_husk_Z", _zoneMarker, [], 130, "FORM"];
};
_group3 = createGroup east;
for "_i" from 1 to 15 do {
	_unit = _group2 createUnit ["Reaper_husk_Z", _zoneMarker, [], 145, "FORM"];
};
_group4 = createGroup east;
for "_i" from 1 to 10 do {
	_rndClassNames = ["Geth_trooperBreach","Geth_trooperBreach","Geth_trooper","Geth_trooper","Geth_rocket","Geth_rocket","Geth_trooperSniper"] call BIS_fnc_SelectRandom;
	_unit = _group3 createUnit [_rndClassNames, _zoneMarker, [], 160, "FORM"];
};


//_warning = format ["%1 попал на вражескую территорию, отряды ИИ выдвинулись за ним!", name _closestPlayer];
//[_warning] remoteExec ["systemChat"];


//actual waypoint every 10 seconds
[_closestPlayer,_group1,_group2,_group3,_group4,_veh,_veh2,_veh3,_veh4,_veh5,_veh6,_veh7,_veh8,_veh9,_veh10] execVM "scripts\zone_ai_waypoints.sqf";



sleep 1;
waitUntil {!(alive _veh) and !(alive _veh2) and !(alive _veh3) and !(alive _veh4) and !(alive _veh5) and !(alive _veh6) and !(alive _veh7) and !(alive _veh8) and !(alive _veh9)};
missionNamespace setVariable ['cis_zone_started', 0, true];
