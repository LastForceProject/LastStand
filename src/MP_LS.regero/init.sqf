[] execVM "scripts\HC.sqf";

[] execVM "scripts\chat\init.sqf";

[] execVM "scripts\rpchat.sqf";

[] execVM "scripts\hideobject.sqf";

[] execVM "scripts\arsenals.sqf";

[] execVM "scripts\zone.sqf";
//Clear_Group = [] spawn {[] execVM "scripts\group_clear.sqf"};

//if (!isServer) then {} else 
//{
	//automissions
	//automissions = false;
	//publicVariable "automissions";
	//missionNamespace setVariable ["taskID",1, true];
	//automissions = [] execVM "automissions\create_auto_mission.sqf";
	//missionNamespace setVariable ["automissionsStarted",1, true];
//};

0 fadeRadio 0;
enableRadio false;
enableSentences false;
enableSaving [false, false];

//Distance restriction
CHVD_allowNoGrass = true; // Set 'false' if you want to disable "Low" option for terrain (default: true)
CHVD_maxView = 5500; // Set maximum view distance (default: 12000)
CHVD_maxObj = 5500; // Set maximimum object view distance (default: 12000)

if(isServer)then{
[west,15000,[
["Land_BagFence_Corner_F",3],
["Land_BagFence_Round_F",3],
["Land_BagFence_Short_F",2],
["Land_BagFence_Long_F",4],
["Land_fort_bagfence_long",5],
["Land_fort_bagfence_round",5],
["Land_fort_bagfence_corner",5],
["Land_Plank_01_4m_F",2],
["Land_HBarrierTower_F",25],
["Land_BagBunker_Large_F",25],
["Land_HBarrier_5_F",15],
["Land_Cargo_Patrol_V3_F",20],
["Land_BagBunker_Small_F",15],
["Land_Canal_WallSmall_10m_F",15],
["CamoNet_BLUFOR_big_F",15],
["Land_HighVoltageColumn_F",15],
["Land_Research_house_V1_F",15],
["Land_Cargo_Tower_V1_F",15],
["Land_BarGate_F",15]
]]call acex_fortify_fnc_registerObjects;
};