_object = _this select 0;
waitUntil {!(alive _object)};
if (_object isKindOf "MAN") then { 
sleep 60;
hideBody _object;
sleep 20;
deleteVehicle _object;
}else{
sleep 15;
if (!(_object isKindOf "StaticWeapon")) then {
_mine = createMine ["IEDUrbanSmall_F", getPosATL _object, [], 0];
_mine attachTo [_object, [0, 0, 0.2] ]; 
detach _mine;
_mine setDamage 1;
};
{
deleteVehicle _x;
} forEach crew _object;
deleteVehicle _object;
};