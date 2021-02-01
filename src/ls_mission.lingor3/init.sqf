[] execVM "scripts\HC.sqf";

[] execVM "scripts\chat\init.sqf";


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
[west,5000,[
["3as_Backless_Mortar_Pit_Trench",50],
["land_3as_Bunker",100],
["3as_Barricade_2_C_prop",20],
["3as_Barricade_3_prop",20],
["3as_Barricade_prop",20],
["3as_Barricade_Cover_2_Prop",20],
["3as_Cover2",10],
["3as_Cover1",10],
["3as_Barricade_Cover_1_Prop",20],
["3as_shield_3_prop",20],
["3as_shield_5_prop",20],
["3as_shield_1_prop",20],
["3as_shield_C_prop",20],
["442_barricade4",20],
["442_barricade5",20],
["442_barricade1_rep",20],
["442_barricade2",20],
["3as_Backless_Short_Trench",50]
]]call acex_fortify_fnc_registerObjects;
};