collins = instance_find(Obj_Entity_Collins, 0);
phoebe = instance_find(Obj_Entity_Phoebe, 0);
gordon = instance_find(Obj_Entity_Gordon, 0);

door = instance_find(Obj_BigDoor, 0);

//audio_stop_all();

new_player = noone;

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "rpg2.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();
