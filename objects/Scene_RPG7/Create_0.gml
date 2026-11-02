collins = noone
richard = noone;
vampire = instance_find(Obj_Entity_Vampire, 0);

new_player = instance_find(Obj_Player, 0);

fade_effect = instance_create_depth(0, 0, 0, Effect_transition_fade);

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "rpg7.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();

new_player.max_health = 100; new_player.hp = 100;
vampire.max_health = 3000; vampire.hp = 3000;

vampire.start_battle(new_player);