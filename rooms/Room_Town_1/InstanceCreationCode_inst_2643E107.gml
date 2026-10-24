alarm_set(1, 1);

function interact() {
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	dialoguemaster.dialogue_code = @"
		name loc Local
		loc ^Hey sweetie.^
		loc ^Welcome to Mumbrux.^
		loc ^It's not often we see off-worlders.^
		loc ^I'd offer you a meal, but...^
		loc ^We barely have enough for ourselves.^
		loc ^Sorry. Come back again when things are better.^
		loc ^Power gem?^
		loc ^Wh-Why would you ask something like that?^
		loc ^Ask someone else! I don't want to bring those monsters here!^
	"; 
	dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
	dialoguemaster.ended = function() {
		
	}
	face_entity(instance_find(Obj_Player, 0));
	dialoguemaster.go();
	global.town1task1 = true;
}