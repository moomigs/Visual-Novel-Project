//text
//alpha
//fade_time

fade = 0;

function set_position(_x, _y) {
	x = room_width/2 + _x*room_width/2;
	y = room_height/2 - _y*room_height/2;
}

function fade_in() {
	fade = 1;
}
function fade_out() {
	fade = -1;
	alarm_set(0, fade_time*fps +1);
}