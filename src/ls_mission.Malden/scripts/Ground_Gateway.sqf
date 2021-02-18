_incoming_param	= _this select 3;

switch (_incoming_param) do
{
case ("open") :
		{
			ground_gate_2 animate ["lock_1_rot",1]; 
			ground_gate_2 animate ["lock_2_rot",1];
			ground_gate_1 animate ["lock_1_rot",1]; 
			ground_gate_1 animate ["lock_2_rot",1];
			sleep 15;
			ground_gate_1 animate ["door_1_rot",1]; 
			ground_gate_1 animate ["door_2_rot",1]; 
			ground_gate_2 animate ["door_1_rot",1]; 
			ground_gate_2 animate ["door_2_rot",1]; 
			
		};
case ("close") :
		{
			ground_gate_1 animate ["door_1_rot",0]; 
			ground_gate_1 animate ["door_2_rot",0]; 
			ground_gate_2 animate ["door_1_rot",0]; 
			ground_gate_2 animate ["door_2_rot",0];
			sleep 18;				
			ground_gate_1 animate ["lock_1_rot",0]; 
			ground_gate_1 animate ["lock_2_rot",0];
			ground_gate_2 animate ["lock_1_rot",0]; 
			ground_gate_2 animate ["lock_2_rot",0];
		};
};
