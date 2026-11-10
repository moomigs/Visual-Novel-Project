var shoot = instance_create_depth(child.x, child.y, child.depth, Move_Shoot);
shoot.mover = child;
shoot.set_direction(child.direction);
shoot.charge();

var waitfor = instance_create_depth(0,0,0,Waitfor)
waitfor.waitfor_instance(Move_Shoot, "complete", true);
waitfor.done = function(_inst) {
	if _inst.blocked {
		shot_blocked = true;
	} else {
		dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
		dialoguemaster.dialogue_code = @"
			name child Child
			child ^...^
			child ^Were you trying?^
		"; 
		dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
		dialoguemaster.ended = function() {
			alarm_set(10, 90);
		}
		dialoguemaster.go();
	}
}

shoot.go(child.direction, 40);