if call_menu_open != false and variable_global_exists("link") and is_array(global.link) {
	var _index = call_menu_open - 1;
	var _dialogue = global.link[_index].dialogue;
	call_menu_open = false;
	
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	dialoguemaster.set_scene(self);
	dialoguemaster.dialogue_code = _dialogue;
	dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
	dialoguemaster.ended = function() {
	
	};
	dialoguemaster.go();
	dialoguemaster.unpause();

}