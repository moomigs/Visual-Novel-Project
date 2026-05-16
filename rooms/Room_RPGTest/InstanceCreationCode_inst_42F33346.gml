function interact() {
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	
	dialoguemaster.dialogue_code = @"
	textbox true
	say It's a clown nose. You put it in your pocket.
	textbox false
	";
	
	dialoguemaster.go();
	
	dialoguemaster.ended = function() {
		global.clownNose = true;
		instance_destroy();
	}
}