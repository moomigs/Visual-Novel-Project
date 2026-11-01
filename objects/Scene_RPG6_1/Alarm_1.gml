if robots > 0 {
	robots --;
	var spawner = instance_find(Spawn_Robot, random_range(0, 8));
	spawner.spawn_robot().start_battle(new_player);
	alarm_set(1, 60*8);
}