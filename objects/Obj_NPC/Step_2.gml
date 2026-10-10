if battle_state != "idle" and battle_target != noone and battle_target.hp > 0 {
	//currently battling!
	
	lock_direction = true;
	if battle_target.x < x and (abs(battle_target.y-y) < abs(battle_target.x-x)) {
		face_direction("left");
	} else if battle_target.x > x and (abs(battle_target.y-y) < abs(battle_target.x-x)) {
		face_direction("right");
	} else if battle_target.y < y {
		face_direction("up");
	} else {
		face_direction("down");
	}
	
	if battle_state == "attack" {
		if point_distance(x, y, battle_target.x, battle_target.y) <= battle_attack_distance {
			//attack!!!!! or defend???
			if random(10) >= 7 {
				move_stop();
				battle_state_tick = 0;
				alarm_set(4, 1);
			} else {
				var attack = instance_create_depth(x, y, depth, Move_Slash);
				attack.mover = self;
				attack.set_direction(direction);
				attack_pending = attack;
				attack.charge();
				battle_charging = true;
				alarm_set(3, random_range(chargetime_min, chargetime_max));
			}
		} else if battle_charging == false {
			move_to(battle_target.x, battle_target.y);
		}
		movespeed_alpha = 1;
	} else if battle_state == "retreat" {
		move_to_relative(x - battle_target.x, y - battle_target.y);
		defending = (point_distance(x, y, battle_target.x, battle_target.y) <= battle_attack_distance);
		if defending {
			if facing == "down" {
				sprite_index = spr_Player_forward_defending;
			} else if facing == "up" {
				sprite_index = spr_Player_backward_defending;
			} else if facing == "right" or facing == "left" {
				sprite_index = spr_Player_right_defending;
			}
		}
		movespeed_alpha = 0.5;
	}
	
	battle_state_tick ++;
}