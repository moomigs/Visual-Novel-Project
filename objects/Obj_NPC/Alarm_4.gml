if random(10) >= 7 {
	battle_state = "attack";
	battle_state_tick = 0;
} else {
	battle_state = "retreat";
	battle_state_tick = 0;
	alarm_set(5, random_range(retreattime_min, retreattime_max));
}