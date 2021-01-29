_incoming_param = _this select 3;

switch (_incoming_param) do
{
case ("open") :
		{
			air_gate_up animate ["door_1_rot",1]; 
			air_gate_up animate ["door_2_rot",1]; 
			air_gate_up animate ["lock_1_rot",1]; 
			air_gate_up animate ["lock_2_rot",1];
			air_gate_down animate ["door_1_rot",1]; 
			air_gate_down animate ["door_2_rot",1]; 
			air_gate_down animate ["lock_1_rot",1]; 
			air_gate_down animate ["lock_2_rot",1];
		};
case ("close") :
		{
			air_gate_up animate ["door_1_rot",0]; 
			air_gate_up animate ["door_2_rot",0]; 
			air_gate_up animate ["lock_1_rot",0]; 
			air_gate_up animate ["lock_2_rot",0];
			air_gate_down animate ["door_1_rot",0]; 
			air_gate_down animate ["door_2_rot",0]; 
			air_gate_down animate ["lock_1_rot",0]; 
			air_gate_down animate ["lock_2_rot",0];
		};
};