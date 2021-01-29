_incoming_param	= _this select 5;

switch (_incoming_param) do
{
case ("open") :
		{
			ground_gate_1 animate ["door_1_rot",1]; 
			ground_gate_1 animate ["door_2_rot",1]; 
			ground_gate_1 animate ["lock_1_rot",1]; 
			ground_gate_1 animate ["lock_2_rot",1];
			
		};
case ("close") :
		{
			ground_gate_1 animate ["door_1_rot",0]; 
			ground_gate_1 animate ["door_2_rot",0]; 
			ground_gate_1 animate ["lock_1_rot",0]; 
			ground_gate_1 animate ["lock_2_rot",0];
		};
};
