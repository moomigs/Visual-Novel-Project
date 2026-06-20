
x_velocity = 0;
y_velocity = 0;

right_x = 0;
right_y = 0;

image_alpha = 0;
image_speed = 0;

function set_direction(dir) {
	direction = dir;
	if dir == 0 {
		x_velocity = 1;
		right_y = 1;
	} else if dir == 90 {
		y_velocity = -1;
		image_angle = 90;
		image_yscale = -1;
		right_x = 1;
	} else if dir == 270 {
		y_velocity = 1;
		image_angle = 270;
		right_x = -1;
	} else if dir == 180 {
		x_velocity = -1;
		image_xscale = -1;
		right_y = -1;
	}
}

charge_begin = 0;
charge_value = -1;

function charge() {
	charge_begin = current_time/1000;
	charge_value = 0;
	mover.freeze = true;
}

function go(_direction) {
	if _direction != noone {
		set_direction(_direction);
	}
	mover.freeze = true;
	var timeCharging = (current_time/1000)-charge_begin;
	if not charge { timeCharging = 0 };
	if timeCharging <= windup {
		alarm_set(0,
			(windup-timeCharging)*game_get_speed(gamespeed_fps)+1
		);
		alarm_set(1, ((windup-timeCharging)+winddown)*game_get_speed(gamespeed_fps)+1);
	} else {
		alarm_set(0, 1);
		alarm_set(1, winddown*game_get_speed(gamespeed_fps)+1);
	}
	alarm_set(1, (windup+winddown)*game_get_speed(gamespeed_fps)+1);
}