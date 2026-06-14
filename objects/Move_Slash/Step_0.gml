var frames = TIME*game_get_speed(gamespeed_fps);

if mover != noone {
	start_x = mover.x;
	start_y = mover.y;
}
x = start_x;
y = start_y;

if step == frames {
	instance_destroy();
}


step ++;