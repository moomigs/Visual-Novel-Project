Obj_Player.can_move = true;
camera_set_view_target(view_camera[0], Obj_Player);

with (Obj_Robot) {
	start_battle(instance_find(Obj_Player, 0));
}
with (Spawn_Robot) {
	spawn_robot().attack_proximity = true;
}