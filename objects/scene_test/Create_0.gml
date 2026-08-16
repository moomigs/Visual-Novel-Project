collins = Obj_Entity_Collins;

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.dialogue_code = @"
	name c Collins
	name ? ???
	
    entity_walk collins 384 384
	entity_waitfor collins
	entity_turn collins down
	pause 1
	
	textbox true
	c Hellomigs.
	textbox false
	pause 0.5
	entity_setsprite collins spr_entity_Gordon_clownnose
	pause 1
	textbox true
	c Goodbyemigs.
	textbox false
	
	pause 1
	entity_freesprite collins
	entity_walk collins -64 384
	entity_waitfor collins
	? Scene over
";
dialoguemaster.ended = function() {room_goto_next();};
dialoguemaster.go();
dialoguemaster.unpause();