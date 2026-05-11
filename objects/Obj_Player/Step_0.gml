
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));

velocity_x = 0;
velocity_y = 0;

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
		sprite_index = spr_Player_right;
	} else if direction == 90 {
		sprite_index = spr_Player_backward;
	} else if direction == 180 {
		image_xscale = -1;
		sprite_index = spr_Player_right;
	} else if direction == 270 {
		sprite_index = spr_Player_forward;
	}
} else {
	if direction == 0 {
		sprite_index = spr_Player_right_running;
	} else if direction == 90 {
		sprite_index = spr_Player_backward_running;
	} else if direction == 180 {
		image_xscale = -1;
		sprite_index = spr_Player_right_running;
	} else if direction == 270 {
		sprite_index = spr_Player_forward_running;
	}
}

move_and_collide(velocity_x, velocity_y, Obj_Solid);