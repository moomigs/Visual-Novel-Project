//text
//alpha
//fade_time

fade = 0;

function set_position(_x, _y) {
	x = display_get_gui_width()/2 + _x*display_get_gui_width()/2;
	y = display_get_gui_height()/2 - _y*display_get_gui_height()/2;
}

function fade_in() {
	fade = 1;
}
function fade_out() {
	fade = -1;
	alarm_set(0, fade_time*game_get_speed(gamespeed_fps) +1);
}