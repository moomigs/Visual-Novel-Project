global.dialogueSkipping = false;

function click() {
	global.dialogueSkipping = !global.dialogueSkipping;
	if global.dialogueSkipping {
		Obj_DialogueMaster.input();
		Obj_DialogueMaster.alarm[3] = 1;
	}
}

padding = 20;

view_width = display_get_gui_width();
view_height = display_get_gui_height();