var frames = TIME*game_get_speed(gamespeed_fps);

if mover != noone {
	start_x = mover.x;
	start_y = mover.y;
}

x = start_x + (x_velocity * TRAVEL) * sqrt((step/frames));
y = start_y + (y_velocity * TRAVEL) * sqrt((step/frames));

if step == frames {
	//instance_destroy();
}

step ++;