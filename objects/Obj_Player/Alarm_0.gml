alarm_set(0, footstep_interval);
footstep *= -1;
if velocity_y != 0 {
	instance_create_depth(x + 4*footstep, y + 8, 1, Obj_Footstep);
	audio_play_sound(snd_footstep, 1, false);
} else if velocity_x != 0 {
	instance_create_depth(x, y + 8 + 0.5*footstep, 1, Obj_Footstep);
	audio_play_sound(snd_footstep, 1, false);
}