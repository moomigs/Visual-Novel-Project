collins = noone;
phoebe = noone;
gordon = noone;
rey = noone;
mayor = noone;

richard = instance_find(Obj_Entity_Richard, 0);

robots_defeated = false;
robots = 6;
//alarm_set(1, 1);

new_player = instance_find(Obj_Player, 0);

fade_effect = instance_create_depth(0, 0, 0, Effect_transition_fade);

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "rpg6_1.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();
