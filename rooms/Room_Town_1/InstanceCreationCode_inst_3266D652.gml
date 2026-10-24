alarm_set(1, 1);

function interact() {
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	dialoguemaster.dialogue_code = @"
		name loc Local
		loc ^Ha! Look at you.^
		loc ^You've even got the robes.^
		loc ^Once, I wanted to be like you.^
		loc ^I dreamed of traveling to different worlds, crossing swords with pirates.^
		loc ^Got a wife and kid now.^
		loc ^Different kind of adventure.^
		loc ^What? You're asking about a power gem?^
		loc ^...^
		loc ^You're a star runner.^
		loc ^I was just starting to like you.^
		loc ^Don't go bringing those things here.^
	"; 
	dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
	dialoguemaster.ended = function() {
		
	}
	face_entity(instance_find(Obj_Player, 0));
	dialoguemaster.go();
	global.town1task1 = true;
}