alarm_set(1, 1);

function interact() {
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	dialoguemaster.dialogue_code = @"
		name loc Local
		loc ^Oh, hello.^
		loc ^Did you just arrive?^
		loc ^Funny place to pick for a pit-stop. We don't see off-worlders too often.^
		loc ^Make yourself at home. Mumbrux prides itself on its hospitality.^
		loc ^Huh? You want to know about a power gem?^
		loc ^...Yeah. There's one around.^
		loc ^Not on Mumbrux though. Elsewhere in the sector.^
		loc ^It's known as the Red Stone.^
		loc ^For good reasons, if you ask me.^
		loc ^You're better off forgetting about it.^
		loc ^That thing is bad news, you hear?^
		loc ^It's... well guarded.^
	"; 
	dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
	dialoguemaster.ended = function() {
		
	}
	face_entity(instance_find(Obj_Player, 0));
	dialoguemaster.go();
}