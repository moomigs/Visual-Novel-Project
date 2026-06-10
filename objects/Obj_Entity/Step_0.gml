if can_move {
	if is_player {
		up = keyboard_check(ord("W"));
		down = keyboard_check(ord("S"));
		left = keyboard_check(ord("A"));
		right = keyboard_check(ord("D"));
	}

	velocity_x = 0;
	velocity_y = 0;

	if !freeze {

		if right { velocity_x += move_speed; }
		if left { velocity_x -= move_speed; }
		if up { velocity_y -= move_speed; }
		if down { velocity_y += move_speed; }

		image_xscale = 1;

		if velocity_y > 0 {
			direction = 270;
		} else if velocity_y < 0 {
			direction = 90;
		} else if velocity_x > 0 {
			direction = 0;
		} else if velocity_x < 0 {
			direction = 180;
		}

		if velocity_x == 0 and velocity_y == 0 {
			if direction == 0 {
				sprite_index = sprite_right;
				facing = "right";
			} else if direction == 90 {
				sprite_index = sprite_backward;
				facing = "up";
			} else if direction == 180 {
				image_xscale = -1;
				sprite_index = sprite_right;
				facing = "left";
			} else if direction == 270 {
				sprite_index = sprite_forward;
				facing = "down";
			}
		} else {
			if direction == 0 {
				sprite_index = sprite_right_run;
				facing = "right";
			} else if direction == 90 {
				sprite_index = sprite_backward_run;
				facing = "up";
			} else if direction == 180 {
				image_xscale = -1;
				sprite_index = sprite_right_run;
				facing = "left";
			} else if direction == 270 {
				sprite_index = sprite_forward_run;
				facing = "down";
			}
		}

		var real_speed = point_distance(0, 0, velocity_x, velocity_y);
		if real_speed > move_speed {
			var i = 1;
			if !is_player { i = (move_speed/real_speed); }
			velocity_x *= i;
			velocity_y *= i;
		}

		move_and_collide(velocity_x, velocity_y, Obj_Solid);
	
		if !walking and real_speed>0 {
			walking = true;
			alarm_set(0, footstep_interval);
		} else if walking and real_speed==0 {
			walking = false;
		}
	}
	update_depth();
}