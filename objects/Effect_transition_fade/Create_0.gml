fade_to = 0;
fade_per_tick = 0;
fade_done = true;

seconds = 1;

auto_fadein = false;

function transition(){}

function fade_out(_seconds) {
	seconds = _seconds;
	fade_per_tick = (1/game_get_speed(gamespeed_fps))/seconds;
	fade_to = 1;
	fade_done = false;
}
function fade_in(_seconds) {
	seconds = _seconds;
	fade_per_tick = (1/game_get_speed(gamespeed_fps))/seconds;
	fade_to = 0;
	fade_done = false;
}

function start(_seconds) {
	seconds = _seconds;
	auto_fadein = true;
	fade_out(seconds);
}