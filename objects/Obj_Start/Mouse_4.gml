

if instance_exists(Obj_MainMenuButton) and Obj_MainMenuButton.menuVisible {
	exit;
}



if clicked == true {return;}
clicked = true;
with(Obj_MainTitle) {
	audio_sound_gain(menu_music, 0, 3000);
}
with(Effect_transition_fade) {
	fade_out(3);
}
alarm_set(0, 60*3);