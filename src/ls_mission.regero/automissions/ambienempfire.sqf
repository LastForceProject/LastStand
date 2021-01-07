_veh = _this select 0;

while {alive _veh} do {
sleep 20;
[_veh, "emp_sound", 1200] call CBA_fnc_globalSay3d;
if (alive _veh) then {
[[_veh, 1], "automissions\EMP_pre.sqf"] remoteExec ["execVM", 0, false];
};
sleep 5;
if (alive _veh) then {
[[_veh], "automissions\EMPFire.sqf"] remoteExec ["execVM", 0, false];
};
sleep 60;
};