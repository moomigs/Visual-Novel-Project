direction = 270;

function interact() {
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	dialoguemaster.dialogue_code = @"
		name ? Collins
		
		? Hello
		? Goodbye
	";
	dialoguemaster.ended = function() {
		down = true;
	}
	dialoguemaster.go();
}