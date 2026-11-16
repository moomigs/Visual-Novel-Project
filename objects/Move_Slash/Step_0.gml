var frames = TIME*game_get_speed(gamespeed_fps);

if step == frames {
	image_alpha = 0;
}

if image_alpha != 0 {
	step ++;
}