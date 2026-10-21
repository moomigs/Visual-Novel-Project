function interact() {
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	dialoguemaster.dialogue_code = @"
		r ^Crew member Collins spotted!^
	"; 
	dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
	dialoguemaster.ended = function() {
		
	}
	face_entity(instance_find(Obj_Player, 0));
	dialoguemaster.go();
}