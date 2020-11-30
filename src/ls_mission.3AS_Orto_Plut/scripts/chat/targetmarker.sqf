_obj = cursorObject;
_pos = position _obj;
_type = typeOf _obj;
_name = (str _type) + (str _pos);//для полностью уникального ID задачи, хехе


//_numberOfAlarms = {"ACE_IR_Strobe_Item" == _x} count (itemCargo _obj);


if (((_obj isKindOf "LandVehicle") || (_obj isKindOf "Air")) && (alive _obj)) then {
if (("ACE_IR_Strobe_Item" in (itemCargo _obj)) isEqualTo true) then {
_tsk = [west,[_name],["Pidor-marker","Pidor",""], (_obj) ,"CREATED", 2, true] call BIS_fnc_taskCreate;//название-шутка, заменить при окончательной сборке

	} else {
	hint "Для слежки нужно поместить маячок";
	sleep 3;
	hintSilent "";
	};
};

//_exists = [_tsk] call BIS_fnc_taskExists;
waitUntil {("ACE_IR_Strobe_Item" in (itemCargo _obj)) isEqualTo false || !alive _obj};
_mar = createMarkerLocal [_name, position _obj];
_mar setMarkerTypeLocal "mil_warning";
_mar setMarkerColorLocal "ColorRed";
_mar setMarkerTextLocal "Связь пропала";
[_name] call BIS_fnc_deleteTask;
sleep 60;
deleteMarkerLocal _name;