if (!isNull (getAssignedCuratorLogic player)) then 
{
	started = missionNamespace getVariable "automissionsStarted";
	if (started == 1) then
	{
		_taskId = missionNamespace getVariable "taskID";
		_actTaskId = _taskId - 1;
		[str _actTaskId,"CANCELED"] call BIS_fnc_taskSetState;
		missionNamespace setVariable ["automissionsStarted", 0, true];
		terminate automissions;
	} 
	else 
	{
		hint "Автомиссии уже выключены";
		sleep 3;
		hintSilent "";
	}
} 
else 
{
	hint "Недостаточно прав";
	sleep 3;
	hintSilent "";
};