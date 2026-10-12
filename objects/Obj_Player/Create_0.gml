event_inherited();

ignore_collision = true;

die = function() {
	audio_stop_all();
	audio_play_sound(snd_die, 1, false, 7, 0, .5);
	instance_destroy();
}