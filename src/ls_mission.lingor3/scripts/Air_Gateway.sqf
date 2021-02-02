_incoming_param = _this select 3;

switch (_incoming_param) do
{
case ("open1") :
		{
			air_gate_up animate ["lock_1_rot",1]; 
			air_gate_up animate ["lock_2_rot",1];
			air_gate_down animate ["lock_1_rot",1]; 
			air_gate_down animate ["lock_2_rot",1];
			sleep 15;
			air_gate_up animate ["door_1_rot",1]; 
			air_gate_up animate ["door_2_rot",1]; 
			air_gate_down animate ["door_1_rot",1]; 
			air_gate_down animate ["door_2_rot",1]; 
		};
case ("close1") :
		{
			air_gate_up animate ["door_1_rot",0]; 
			air_gate_up animate ["door_2_rot",0]; 
			air_gate_down animate ["door_1_rot",0]; 
			air_gate_down animate ["door_2_rot",0];
			sleep 18;			
			air_gate_down animate ["lock_1_rot",0]; 
			air_gate_down animate ["lock_2_rot",0];
			air_gate_up animate ["lock_1_rot",0]; 
			air_gate_up animate ["lock_2_rot",0];
		};
case ("open2") :
		{
			air_gate_up_1 animate ["lock_1_rot",1]; 
			air_gate_up_1 animate ["lock_2_rot",1];
			air_gate_down_1 animate ["lock_1_rot",1]; 
			air_gate_down_1 animate ["lock_2_rot",1];
			sleep 15;
			air_gate_up_1 animate ["door_1_rot",1]; 
			air_gate_up_1 animate ["door_2_rot",1]; 
			air_gate_down_1 animate ["door_1_rot",1]; 
			air_gate_down_1 animate ["door_2_rot",1]; 
		};
case ("close2") :
		{
			air_gate_up_1 animate ["door_1_rot",0]; 
			air_gate_up_1 animate ["door_2_rot",0]; 
			air_gate_down_1 animate ["door_1_rot",0]; 
			air_gate_down_1 animate ["door_2_rot",0];
			sleep 18;			
			air_gate_down_1 animate ["lock_1_rot",0]; 
			air_gate_down_1 animate ["lock_2_rot",0];
			air_gate_up_1 animate ["lock_1_rot",0]; 
			air_gate_up_1 animate ["lock_2_rot",0];
		};
};