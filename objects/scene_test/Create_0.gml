player = instance_find(Obj_Player, 0);
npc1 = instance_find(Obj_NPC, 0);
npc2 = instance_find(Obj_NPC, 1);
npc3 = instance_find(Obj_NPC, 2);

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
	c Prepare to die...
	textbox false
";
dialoguemaster.ended = function() {
	//npc.start_battle(collins);
	//collins.start_battle(npc);
};
//dialoguemaster.go();
//dialoguemaster.unpause();

alarm_set(0, 2);