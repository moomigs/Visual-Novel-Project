collins = instance_find(Obj_Entity_Collins, 0);
npc = instance_find(Obj_NPC, 0);

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.dialogue_code = @"
	name c Collins
	name ? ???
	
    entity_walk_to collins 288 384
	pause 0.5
    entity_walk_to npc 352 384
	entity_waitfor collins
	entity_waitfor npc
	entity_turn collins down
	pause 0.5
	entity_turn npc down
	pause 1
	
	textbox true
	entity_setsprite collins spr_Player_emoting
	c Hellomigs.
	textbox false
	pause 1
	textbox true
	c Goodbyemigs.
	textbox false
	
	trigger 0
	
	pause 1
	entity_freesprite collins
	entity_walk_to collins -64 384
	pause 3.5
	? Woah
	pause 1
	textbox false
	
	entity_walk npc 0 -64
	pause 0.1
	entity_walk npc -64 0
	pause 0.1
	entity_walk npc 0 64
	pause 0.1
	
    entity_walk_to npc 704 384
	entity_waitfor npc
";
dialoguemaster.ended = function() {room_goto_next();};
dialoguemaster.go();
dialoguemaster.unpause();