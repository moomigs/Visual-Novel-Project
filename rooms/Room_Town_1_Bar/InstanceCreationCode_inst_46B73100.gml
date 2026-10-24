function interact() {
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	dialoguemaster.file_name = "gordonbar.txt";
	dialoguemaster.ended = function() {
		
	}
	face_entity(instance_find(Obj_Player, 0));
	dialoguemaster.go();
}