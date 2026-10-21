collins = instance_find(Obj_Player, 0);
phoebe = instance_find(Obj_Entity_Phoebe, 0);
gordon = instance_find(Obj_Entity_Gordon, 0);

door = instance_find(Obj_BigDoor, 0);

robot_walkto_x = door.x;
robot_walkto_y = door.y + 48;
robot_n = 0;
new_robot = noone;

//audio_stop_all();

new_player = noone;

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "rpg3.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();
