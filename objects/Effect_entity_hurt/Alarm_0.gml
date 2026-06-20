
flash = not flash;
duration -= flash_frames/current_fps;

if duration > 0 {
	if flash {
		entity.image_blend = c_black;
	} else {
		entity.image_blend = c_white;
	}
	alarm_set(0, flash_frames);
} else {
	flash = false;
	entity.image_blend = initial_blend;
	entity.passive = false;
	instance_destroy();
}