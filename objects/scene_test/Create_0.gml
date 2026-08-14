collins = Obj_Entity_Collins;

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.dialogue_code = @"
	name c Collins
	
    entity_walk collins 384 384
	pause 4
	entity_turn collins down
	pause 1
	
	textbox true
	c Hellomigs.
	textbox false
	pause 1
	textbox true
	c Goodbyemigs.
	textbox false
	
	pause 1
	entity_walk collins -64 384
	pause 4
";
dialoguemaster.ended = function() {room_goto_next();}
dialoguemaster.go();
dialoguemaster.unpause();