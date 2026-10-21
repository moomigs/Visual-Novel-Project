face_direction("left");

function interact() {
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	dialoguemaster.dialogue_code = @"
		p ^I'm busy.^
	"; 
	dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
	dialoguemaster.ended = function() {
		face_direction("left");
	}
	face_entity(instance_find(Obj_Player, 0));
	dialoguemaster.go();
}