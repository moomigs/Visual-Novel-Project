if battle_target != noone {
	battle_state = "attack";
	if abs(battle_target.x - x) <= 12 or abs(battle_target.y - y) <= 12 {
		if random(1) > 0.6 {
			var attack = instance_create_depth(x, y, depth, Move_Shoot);
			attack.mover = self;
			attack.set_direction(direction);
			attack_pending = attack;
			attack.charge();
			battle_charging = true;
			alarm_set(3, 1+random(1)*attack.windup*game_get_speed(gamespeed_fps));
		}
	}
}