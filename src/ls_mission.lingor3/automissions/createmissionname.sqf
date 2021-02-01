_missionName = _this select 0;
_obj = _this select 1;
_distance = _this select 2;



if ((player distance _obj) <= _distance) then {
_dayTime = [daytime] call BIS_fnc_timeToString;

[
 [
 [str _missionName,"size = '0.7'"],
 ["","<br/>"],
 ["Планета: Марктет I","size = '0.7'"],
 ["","<br/>"],
 ["Местное время: ","size = '0.7'"],
 [str _dayTime,"size = '0.7'"],
 ["","<br/>"],
 ["Выполняющий юнит: ","size = '0.7'"],
 [str name player,"size = '0.7'"]
 ],
 safeZoneX / 45.5, safeZoneH / 2,
 true,
 "<t font='PuristaBold'>%1</t>",
 [],
 { false },
 true
] spawn BIS_fnc_typeText2;
sleep 3;
playSound ["mission_start_music",true];
};
