if attack_pending != noone and attack_pending.object_index = Move_Slash {
	attack_pending.go(direction);
	attack_pending = noone;
	battle_charging = false;
	battle_state = "fatigued";
	move_stop();
	battle_state_tick = 0;
	alarm_set(4, attack_postcooldown);
}