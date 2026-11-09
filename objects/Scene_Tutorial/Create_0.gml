collins = instance_find(Obj_Player, 0);
child = instance_find(Obj_Entity_Child, 0);

child_blindswings = false;
collins_defend = false;
collins_stab = false;
collins_slash = false;
collins_heavy = false;
collins_shoot = false;

collins.can_slash = false;
collins.can_stab = false;
collins.can_heavy = false;
collins.can_shoot = false;
collins.can_defend = false;

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.set_scene(self);
dialoguemaster.file_name = "tutorial.txt";
dialoguemaster.ended = function() {
	
};
dialoguemaster.go();
dialoguemaster.unpause();
