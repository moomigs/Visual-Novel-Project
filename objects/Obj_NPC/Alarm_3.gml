if attack_pending != noone {
	if attack_pending.object_index = Move_Slash {
		attack_pending.go(direction);
		var winddown = attack_pending.winddown*game_get_speed(gamespeed_fps);
		attack_pending = noone;
		battle_charging = false;
		battle_state = "fatigued";
		move_stop();
		battle_state_tick = 0;
		alarm_set(4, max(attack_postcooldown, winddown));
	} else if attack_pending.object_index = Move_Stab {
		attack_pending.go(direction);
		attack_pending = noone;
		battle_charging = false;
		battle_state = "fatigued";
		move_stop();
		battle_state_tick = 0;
		alarm_set(4, attack_postcooldown);
	} else if attack_pending.object_index = Move_Heavy {
		attack_pending.go(direction);
		var winddown = attack_pending.winddown*game_get_speed(gamespeed_fps);
		attack_pending = noone;
		battle_charging = false;
		battle_state = "fatigued";
		move_stop();
		battle_state_tick = 0;
		alarm_set(4, max(attack_postcooldown, winddown));
	} else if attack_pending.object_index = Move_Shoot {
		attack_pending.go(direction, 40);
		attack_pending = noone;
		battle_charging = false;
		battle_state = "fatigued";
		move_stop();
		battle_state_tick = 0;
		alarm_set(4, attack_postcooldown);
	}
}