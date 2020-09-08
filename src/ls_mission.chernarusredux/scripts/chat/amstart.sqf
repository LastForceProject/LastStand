if (!isNull (getAssignedCuratorLogic player)) then 
{
	started = missionNamespace getVariable "automissionsStarted";
	if (started == 1) then 
	{
		hint "Автомиссии уже запущены";
		sleep 3;
		hintSilent "";
	} 
	else 
	{
		automissions = [] execVM "automissions\create_auto_mission.sqf";
		missionNamespace setVariable ["automissionsStarted", 1, true];
	}
} 
else 
{
	hint "Недостаточно прав";
	sleep 3;
	hintSilent "";
};