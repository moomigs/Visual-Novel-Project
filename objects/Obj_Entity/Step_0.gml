if can_move {
	if is_player {
		up = keyboard_check(ord("W"));
		down = keyboard_check(ord("S"));
		left = keyboard_check(ord("A"));
		right = keyboard_check(ord("D"));
	}

	velocity_x = 0;
	velocity_y = 0;

	if right { velocity_x += move_speed; }
	if left { velocity_x -= move_speed; }
	if up { velocity_y -= move_speed; }
	if down { velocity_y += move_speed; }
	
	if moving_to {
		velocity_x = goto_x - x;
		velocity_y = goto_y - y;
	}

	image_xscale = 1;

	if velocity_x > 0 {
		if velocity_y > 0 {
			direction = 270+45;
		} else if velocity_y < 0 {
			direction = 45;
		} else {
			direction = 0;
		}
	} else if velocity_x < 0 {
		if velocity_y > 0 {
			direction = 180+45;
		} else if velocity_y < 0 {
			direction = 90+45;
		} else {
			direction = 180;
		}
	} else if velocity_y > 0 {
		direction = 270;
	} else if velocity_y < 0 {
		direction = 90;
	} 
	
	if scene_setsprite != noone {
		sprite_index = scene_setsprite;
	} else {
		if (velocity_x == 0 and velocity_y == 0) or freeze {
			if direction == 0 {
				sprite_index = sprite_right;
				facing = "right";
			} else if direction == 45 {
				sprite_index = sprite_upright;
				facing = "upright";
			} else if direction == 90 {
				sprite_index = sprite_backward;
				facing = "up";
			} else if direction == 90+45 {
				image_xscale = -1;
				sprite_index = sprite_upright;
				facing = "upleft";
			} else if direction == 180 {
				image_xscale = -1;
				sprite_index = sprite_right;
				facing = "left";
			} else if direction == 180+45 {
				image_xscale = -1;
				sprite_index = sprite_downright;
				facing = "downleft";
			} else if direction == 270 {
				sprite_index = sprite_forward;
				facing = "down";
			} else if direction == 270+45 {
				image_xscale = -1;
				sprite_index = sprite_downright;
				facing = "downright";
			}
		} else {
			if direction == 0 {
				sprite_index = sprite_right_run;
				facing = "right";
			} else if direction == 45 {
				sprite_index = sprite_upright_run;
				facing = "upright";
			} else if direction == 90 {
				sprite_index = sprite_backward_run;
				facing = "up";
			} else if direction == 90+45 {
				image_xscale = -1;
				sprite_index = sprite_upright_run;
				facing = "upleft";
			} else if direction == 180 {
				image_xscale = -1;
				sprite_index = sprite_right_run;
				facing = "left";
			} else if direction == 180+45 {
				image_xscale = -1;
				sprite_index = sprite_downright_run;
				facing = "downleft";
			} else if direction == 270 {
				sprite_index = sprite_forward_run;
				facing = "down";
			} else if direction == 270+45 {
				sprite_index = sprite_downright_run;
				facing = "downright";
			}
		}
	}
	
	
	if !freeze {
		
		var real_speed = 0;
		
		if !moving_to {
			real_speed = point_distance(0, 0, velocity_x, velocity_y);
			if real_speed > move_speed {
				var i = 1;
				if !is_player { i = (move_speed/real_speed); }
				velocity_x *= i;
				velocity_y *= i;
			}
			if defending {
				velocity_x *= 0.5;
				velocity_y *= 0.5;
			}
		} else {
			real_speed = point_distance(0, 0, velocity_x, velocity_y);
			if real_speed > move_speed {
				var i = (move_speed/real_speed);
				velocity_x *= i;
				velocity_y *= i;
			} else {
				moving_to = false;
			}
		}
		
		var entity_pause = variable_global_exists("entity_pause");
		global_paused = entity_pause and global.entity_pause;
		if !global_paused and !pause {
			move_and_collide(velocity_x*movespeed_alpha + push_x, velocity_y*movespeed_alpha + push_y, Obj_Solid);
		
			push_x *= push_friction;
			push_y *= push_friction;
		
			if !walking and real_speed>0 {
				walking = true;
				alarm_set(0, footstep_interval);
			} else if walking and real_speed==0 {
				walking = false;
			}
		}
	} else { walking = false; }
	update_depth();
	image_speed = movespeed_alpha;
} else if freeze {
	image_speed = 0;
}

if show_healthbar > 0 {
	show_healthbar = max(0, show_healthbar - 1);	
}