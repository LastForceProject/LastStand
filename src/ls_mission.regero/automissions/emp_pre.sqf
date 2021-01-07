_veloMan = _this select 0;
_stance = _this select 1;

if (_stance == 1) then {
if ((player distance _veloMan) <= 1000) then {

_electra2 = "#particlesource" createVehicleLocal position _veloMan; 
_electra2 setParticleCircle [0, [0, 0, 0]];  
_electra2 setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];  
_electra2 setDropInterval 0.01;  
_electra2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 1, 0, 1],"", "Billboard", 0.4, 0.4, [0,0,0], [0,0,0], 0,0.3,0.233,0, [0.1,0.1,0.1], [[1,1,1,0.5],[0.5,0.5,0.5,0.1]], [1], 5, 5, "", "", "",0,true]; 
_electra2 attachto [_veloMan,[0,0,2]];  
_electra2 setParticleClass "HDustVTOL1"; 
detach _electra2;


_electra3 = "#particlesource" createVehicleLocal position _veloMan; 
_electra3 setParticleCircle [6, [-2, -2, 2]];
_electra3 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_electra3 setParticleParams [["\A3\data_f\cl_leaf", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 2, 11, 7.9, 0.075, [6, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _veloMan];
_electra3 setDropInterval 0.04;


_electra4 = "#particlesource" createVehicleLocal position _veloMan; 
_electra4 setParticleCircle [6, [-2, -2, 2]];
_electra4 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_electra4 setParticleParams [["\A3\data_f\cl_grass1", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 2, 11, 7.9, 0.075, [6, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _veloMan];
_electra4 setDropInterval 0.04;


_electra5 = "#particlesource" createVehicleLocal position _veloMan; 
_electra5 setParticleCircle [6, [-2, -2, 2]];
_electra5 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_electra5 setParticleParams [["\A3\data_f\cl_leaf3", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 2, 11, 7.9, 0.075, [6, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _veloMan];
_electra5 setDropInterval 0.04;


_electra6 = "#particlesource" createVehicleLocal position _veloMan; 
_electra6 setParticleCircle [6, [-2, -2, 2]];
_electra6 setParticleRandom [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_electra6 setParticleParams [["\A3\data_f\cl_rock1", 1, 0, 1], "", "SpaceObject", 1, 12.5, [0, 0, 0], [0, 0, 0.75], 2, 11, 7.9, 0.075, [6, 2, 4], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0.08], 1, 0, "", "", _veloMan];
_electra6 setDropInterval 0.04;



sleep 5.2;





_electra = "#particlesource" createVehicleLocal position _veloMan;   
_electra setParticleCircle [0, [0, 0, 0]];   
_electra setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];   
_electra setDropInterval 0.01;   
_electra setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 1, 0, 1],"", "Billboard", 0.4, 0.4, [0,0,0], [0,0,0], 0,0.3,0.233,0, [0.1,0.1,0.1], [[1,1,1,0.5],[0.5,0.5,0.5,0.1]], [1], 5, 5, "", "", "",0,true];  
_electra attachto [_veloMan,[0,0,2]];   
_electra setParticleClass "BombDust";  
detach _electra; 




sleep 12;
deleteVehicle _electra;
deleteVehicle _electra2;
deleteVehicle _electra3;
deleteVehicle _electra4;
deleteVehicle _electra5;
deleteVehicle _electra6;
};
};

if (_stance == 2) then {
_electra = "#particlesource" createVehicleLocal position _veloMan;   
_electra setParticleCircle [0, [0, 0, 0]];   
_electra setParticleRandom [0, [0, 0, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 0];   
_electra setDropInterval 0.01;   
_electra setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 1, 0, 1],"", "Billboard", 0.4, 0.4, [0,0,0], [0,0,0], 0,0.3,0.233,0, [0.1,0.1,0.1], [[1,1,1,0.5],[0.5,0.5,0.5,0.1]], [1], 5, 5, "", "", "",0,true];  
_electra attachto [_veloMan,[0,0,2]];   
_electra setParticleClass "BombDust";  
detach _electra; 
sleep 12;
deleteVehicle _electra;
};