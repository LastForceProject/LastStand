_closestPlayer = (_this select 0);
_group1 = (_this select 1);
_group2 = (_this select 2);
_group3 = (_this select 3);
_group4 = (_this select 4);
_veh = (_this select 5);
_veh2 = (_this select 6);
_veh3 = (_this select 7);
_veh4 = (_this select 8);
_veh5 = (_this select 9);
_veh6 = (_this select 10);
_veh7 = (_this select 11);
_veh8 = (_this select 12);
_veh9 = (_this select 13);
_veh10 = (_this select 14);

_wp1 = false;
while {true} do{

	if(alive(_veh10)) then{
		while {(count (waypoints _group1)) > 0} do{
			deleteWaypoint ((waypoints _group1) select 0);
		};

		_wp1 = _group1 addWaypoint [getPos _closestPlayer, 5];
		_wp1 setWaypointType "SAD";
		[_group1, 2] setWaypointBehaviour "AWARE";
		[_group1, 2] setWaypointSpeed "FULL";

		while {(count (waypoints _group2)) > 0} do{
			deleteWaypoint ((waypoints _group2) select 0);
		};

		_wp2 = _group2 addWaypoint [getPos _closestPlayer, 5];
		_wp2 setWaypointType "SAD";
		[_group2, 2] setWaypointBehaviour "AWARE";
		[_group2, 2] setWaypointSpeed "FULL";

		while {(count (waypoints _group3)) > 0} do{
			deleteWaypoint ((waypoints _group3) select 0);
		};

		_wp3 = _group3 addWaypoint [getPos _closestPlayer, 5];
		_wp3 setWaypointType "SAD";
		[_group3, 2] setWaypointBehaviour "AWARE";
		[_group3, 2] setWaypointSpeed "FULL";
		
		while {(count (waypoints _group4)) > 0} do{
			deleteWaypoint ((waypoints _group4) select 0);
		};

		_wp4 = _group4 addWaypoint [getPos _closestPlayer, 5];
		_wp4 setWaypointType "SAD";
		[_group4, 2] setWaypointBehaviour "AWARE";
		[_group4, 2] setWaypointSpeed "FULL";

		while {(count (waypoints group commander _veh)) > 0} do{
			deleteWaypoint ((waypoints group commander _veh) select 0);
		};

		_wpVeh = group commander _veh addWaypoint [getPos _closestPlayer, 5];
		_wpVeh setWaypointType "MOVE";
		_wpVeh setWaypointSpeed "LIMITED";
		_wpVeh setWaypointBehaviour "SAFE";

		while {(count (waypoints group commander _veh2)) > 0} do{
			deleteWaypoint ((waypoints group commander _veh2) select 0);
		};

		_wpVeh2 = group commander _veh2 addWaypoint [getPos _closestPlayer, 5];
		_wpVeh2 setWaypointType "MOVE";
		_wpVeh2 setWaypointSpeed "LIMITED";
		_wpVeh2 setWaypointBehaviour "SAFE";

		while {(count (waypoints group commander _veh3)) > 0} do{
			deleteWaypoint ((waypoints group commander _veh3) select 0);
		};

		_wpVeh3 = group commander _veh3 addWaypoint [getPos _closestPlayer, 5];
		_wpVeh3 setWaypointType "MOVE";
		_wpVeh3 setWaypointSpeed "LIMITED";
		_wpVeh3 setWaypointBehaviour "SAFE";

		while {(count (waypoints group commander _veh4)) > 0} do{
			deleteWaypoint ((waypoints group commander _veh4) select 0);
		};

		_wpVeh4 = group commander _veh4 addWaypoint [getPos _closestPlayer, 5];
		_wpVeh4 setWaypointType "MOVE";
		_wpVeh4 setWaypointSpeed "LIMITED";
		_wpVeh4 setWaypointBehaviour "SAFE";

		while {(count (waypoints group commander _veh5)) > 0} do{
			deleteWaypoint ((waypoints group commander _veh5) select 0);
		};

		_wpVeh5 = group commander _veh5 addWaypoint [getPos _closestPlayer, 5];
		_wpVeh5 setWaypointType "MOVE";
		_wpVeh5 setWaypointSpeed "LIMITED";
		_wpVeh5 setWaypointBehaviour "SAFE";

		while {(count (waypoints group commander _veh6)) > 0} do{
			deleteWaypoint ((waypoints group commander _veh6) select 0);
		};

		_wpVeh6 = group commander _veh6 addWaypoint [getPos _closestPlayer, 5];
		_wpVeh6 setWaypointType "MOVE";
		_wpVeh6 setWaypointSpeed "LIMITED";
		_wpVeh6 setWaypointBehaviour "SAFE";


		while {(count (waypoints group driver _veh7)) > 0} do{
			deleteWaypoint ((waypoints group driver _veh7) select 0);
		};

		_wpVeh7 = group driver _veh7 addWaypoint [getPos _closestPlayer, 5];
		_wpVeh7 setWaypointType "MOVE";
		_wpVeh7 setWaypointSpeed "LIMITED";
		_wpVeh7 setWaypointBehaviour "SAFE";
		
		while {(count (waypoints group driver _veh8)) > 0} do{
			deleteWaypoint ((waypoints group driver _veh8) select 0);
		};

		_wpVeh8 = group driver _veh8 addWaypoint [getPos _closestPlayer, 5];
		_wpVeh8 setWaypointType "MOVE";
		_wpVeh8 setWaypointSpeed "LIMITED";
		_wpVeh8 setWaypointBehaviour "SAFE";
		
		while {(count (waypoints group driver _veh9)) > 0} do{
			deleteWaypoint ((waypoints group driver _veh9) select 0);
		};

		_wpVeh9 = group driver _veh9 addWaypoint [getPos _closestPlayer, 5];
		_wpVeh9 setWaypointType "MOVE";
		_wpVeh9 setWaypointSpeed "LIMITED";
		_wpVeh9 setWaypointBehaviour "SAFE";
		
		while {(count (waypoints group driver _veh10)) > 0} do{
			deleteWaypoint ((waypoints group driver _veh10) select 0);
		};

		_wpVeh10 = group driver _veh10 addWaypoint [getPos _closestPlayer, 5];
		_wpVeh10 setWaypointType "MOVE";
		_wpVeh10 setWaypointSpeed "LIMITED";
		_wpVeh10 setWaypointBehaviour "SAFE";

	};

	if(!(isPlayer _closestPlayer)) exitWith{
		missionNamespace setVariable ['cis_zone_started', 0, true];
		sleep 3000;
		{
			deleteVehicle _x;
		}forEach units _group1;
		deleteGroup _group1;
		{
			deleteVehicle _x;
		}forEach units _group2;
		deleteGroup _group2;
		{
			deleteVehicle _x;
		}forEach units _group3;
		deleteGroup _group3;
		{
			deleteVehicle _x;
		}forEach units _group4;
		deleteGroup _group4;

		{_x setDamage 1} forEach crew _veh;
		deleteVehicle _veh;
		{_x setDamage 1} forEach crew _veh2;
		deleteVehicle _veh2;
		{_x setDamage 1} forEach crew _veh3;
		deleteVehicle _veh3;
		{_x setDamage 1} forEach crew _veh4;
		deleteVehicle _veh4;
		{_x setDamage 1} forEach crew _veh5;
		deleteVehicle _veh5;
		{_x setDamage 1} forEach crew _veh6;
		deleteVehicle _veh6;
		{_x setDamage 1} forEach crew _veh7;
		deleteVehicle _veh7;
		{_x setDamage 1} forEach crew _veh8;
		deleteVehicle _veh8;
		{_x setDamage 1} forEach crew _veh9;
		deleteVehicle _veh9;
		{_x setDamage 1} forEach crew _veh10;
		deleteVehicle _veh10;

	};

	sleep 10000;
};
