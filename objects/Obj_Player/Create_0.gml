event_inherited();

//ignore_collision = true;

call_menu_open = false;

can_slash = true;
can_stab = true;
can_heavy = true;
can_shoot = true;
can_defend = true;

die = function() {
	audio_stop_all();
	audio_play_sound(snd_die, 1, false, 7, 0, .5);
	instance_destroy();
}