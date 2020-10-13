[] execVM "scripts\HC.sqf";

[] execVM "scripts\chat\init.sqf";

[] execVM "scripts\hideobject.sqf";

[] execVM "scripts\thermalvision.sqf";

[] execVM "scripts\arsenals.sqf";

[] execVM "scripts\zone.sqf";
Clear_Group = [] spawn {[] execVM "scripts\group_clear.sqf"};

if (!isServer) then {} else 
{
	//automissions
	automissions = false;
	publicVariable "automissions";
	missionNamespace setVariable ["taskID",1, true];
	automissions = [] execVM "automissions\create_auto_mission.sqf";
	missionNamespace setVariable ["automissionsStarted",1, true];
};

0 fadeRadio 0;
enableRadio false;
enableSentences false;
enableSaving [false, false];

//Distance restriction
CHVD_allowNoGrass = true; // Set 'false' if you want to disable "Low" option for terrain (default: true)
CHVD_maxView = 5500; // Set maximum view distance (default: 12000)
CHVD_maxObj = 5500; // Set maximimum object view distance (default: 12000)