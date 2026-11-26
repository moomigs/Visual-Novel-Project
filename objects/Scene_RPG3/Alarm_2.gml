Obj_Player.can_move = true;
camera_set_view_target(view_camera[0], Obj_Player);

with (Obj_Robot) {
	start_battle(instance_find(Obj_Player, 0));
}
with (Spawn_Robot) {
	spawn_robot().attack_proximity = true;
}

dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
dialoguemaster.dialogue_code = @"
	entity_unpause
	player_enable
	new_title tutorial_pushpull Press Q and E to push/pull
	title_setpos tutorial_pushpull 0 0.3
	title_fadein tutorial_pushpull 0.5
	pause 3
	title_fadeout tutorial_pushpull 0.5
";
dialoguemaster.dont_freeze = true;
dialoguemaster.go();