collins = instance_find(Obj_Entity_Collins, 0);
phoebe = instance_find(Obj_Entity_Phoebe, 0);
gordon = instance_find(Obj_Entity_Gordon, 0);
rey = instance_find(Obj_Entity_Rey, 0);

new_player = noone;

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "rpg5.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();
