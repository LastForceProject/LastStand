// while {true} do{
// 	{
// 		if ((side _x == East) and (typeOf _x == 'O_Soldier_VR_F')) then  {
// 			_zoneMarker = _x;
//
// 			_numPlayersByEntity = {isPlayer _x} count nearestObjects [getPos _zoneMarker, ["Man","Car","Tank","Ship","Air","StaticWeapon"], 1500];
//
// 			if (_numPlayersByEntity >= 1) then {
// 				_varName = format ["zone_%1", str mapGridPosition _zoneMarker];
// 				_started = missionNamespace getVariable [_varName, 0];
//
// 				if(_started == 0) then{
// 					[_zoneMarker] execVM "scripts\zone_start.sqf";
// 					missionNamespace setVariable [_varName, 1, true];
// 				}
// 			};
// 		}
// 	}forEach allUnits;
//
// 	sleep 10;
// }

_prevArr = [];
while {true} do{
	//get all points
	_zones = [];
	{
		if (typeOf _x == 'C_Soldier_VR_F') then  {
			_zoneMarker = _x;
			_zones pushBack _zoneMarker;
		}
	}forEach allUnits;

	//need to draw polygon
	_cnt = count _zones;
	if(_cnt >= 3) then{

		coords = [];
		{
			coords pushBack (getPos _x);
		} forEach _zones;

		findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw",
		{
			params ["_control"];
			_control drawPolygon [coords, [0.73,0.24,0.11,1]];
		}];

		_playerPos = getPos player;
		_isInside = _playerPos inPolygon coords;
		//if player inside polygon make actions with drids
		if((_isInside and side player == West) || (_isInside and side player == Resistance )) then{
			_started = missionNamespace getVariable ['cis_zone_started', 0];
			if(_started == 0) then{
				[_playerPos, player] execVM "scripts\zone_start.sqf";
				missionNamespace setVariable ['cis_zone_started', 1, true];
			}
		};
	};
	sleep 5;
};
