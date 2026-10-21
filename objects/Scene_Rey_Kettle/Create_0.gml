collins = instance_find(Obj_Entity_Collins, 0);
rey = instance_find(Obj_Entity_Rey, 0);

audio_stop_all();

new_player = noone;

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "reykettle.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();
