collins = instance_find(Obj_Entity_Collins, 0);
richard = instance_find(Obj_Entity_Richard, 0);
gordon = instance_find(Obj_Entity_Gordon, 0);
phoebe = instance_find(Obj_Entity_Phoebe, 0);
rey = instance_find(Obj_Entity_Rey, 0);

fade_effect = instance_create_depth(0, 0, 0, Effect_transition_fade);
//fade_effect.fade = 1;

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "rpg7_1.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();