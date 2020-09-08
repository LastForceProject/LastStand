[
	{{if (count (units _x select {isPlayer _x}) == 0) then {_x setGroupOwner owner HC;};}forEach allGroups;},30,[]] call CBA_fnc_addPerFrameHandler;