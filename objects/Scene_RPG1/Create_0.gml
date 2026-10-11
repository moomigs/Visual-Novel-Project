collins = instance_find(Obj_Entity_Collins, 0);
child = instance_find(Obj_Entity_Child, 0);
gordon = instance_find(Obj_Entity_Gordon, 0);
gordon.image_alpha = 0;

audio_stop_all();

new_player = noone;

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "rpg1.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();
