collins = instance_find(Obj_Entity_Collins, 0);
phoebe = instance_find(Obj_Entity_Phoebe, 0);
gordon = instance_find(Obj_Entity_Gordon, 0);
richard = instance_find(Obj_Entity_Richard, 0);

new_player = noone;

fade_effect = instance_create_depth(0, 0, 0, Effect_transition_fade);

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "rpg6.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();
