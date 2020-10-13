_zoneMarker = (_this select 0);
_closestPlayer = (_this select 1);
_zoneMarker = _closestPlayer getPos [700, random 360];

//get first player


// _markerPos = _zoneMarker;
// _playerList = allPlayers apply {[_markerPos distanceSqr _x, _x]};
// _playerList sort true;
// _closestPlayer = (_playerList select 0) param [1, objNull];




_veh = createVehicle ["ls_aat", _zoneMarker, [], 0, "NONE"];
createVehicleCrew _veh;

_veh2 = createVehicle ["O_OKalani_CIS_Heavy_Infantry_Transport_01", _zoneMarker, [], 50, "NONE"];
createVehicleCrew _veh2;

_veh3 = createVehicle ["RD501_Archer_CIS", _zoneMarker, [], 100, "NONE"];
createVehicleCrew _veh3;

_veh4 = createVehicle ["ls_aat", _zoneMarker, [], 150, "NONE"];
createVehicleCrew _veh4;

_veh5 = createVehicle ["RD501_Archer_CIS", _zoneMarker, [], 200, "NONE"];
createVehicleCrew _veh5;

_veh6 = createVehicle ["O_OKalani_CIS_Heavy_Infantry_Transport_01", _zoneMarker, [], 250, "NONE"];
createVehicleCrew _veh6;

_veh7 = createVehicle ["RD501_drone_cis_Hover_Droid", _zoneMarker, [], 300, "FLY"];
createVehicleCrew _veh7;

_group1 = createGroup east;
for "_i" from 1 to 8 do {
	_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
	_unit = _group1 createUnit [_rndClassNames, _zoneMarker, [], 115, "FORM"];
};
_group2 = createGroup east;
for "_i" from 1 to 8 do {
	_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
	_unit = _group2 createUnit [_rndClassNames, _zoneMarker, [], 115, "FORM"];
};
_group3 = createGroup east;
for "_i" from 1 to 8 do {
	_rndClassNames = ["SWLB_b1_base","SWLB_b1_sl_base","SWLB_b1_heavy_base","SWLB_b1_at_base"] call BIS_fnc_SelectRandom;
	_unit = _group3 createUnit [_rndClassNames, _zoneMarker, [], 115, "FORM"];
};


//_warning = format ["%1 попал на вражескую территорию, отряды КНС выдвинулись за ним!", name _closestPlayer];
//[_warning] remoteExec ["systemChat"];


//actual waypoint every 10 seconds
[_closestPlayer,_group1,_group2,_group3,_veh,_veh2,_veh3,_veh4,_veh5,_veh6,_veh7] execVM "scripts\zone_ai_waypoints.sqf";



sleep 1;
waitUntil {!(alive _veh) and !(alive _veh2) and !(alive _veh3) and !(alive _veh4) and !(alive _veh5) and !(alive _veh6)};
missionNamespace setVariable ['cis_zone_started', 0, true];
