if fade == 1 and alpha < fade {
	alpha += (1/game_get_speed(gamespeed_fps)) / fade_time;
} else if fade == -1 and alpha > fade {
	alpha -= (1/game_get_speed(gamespeed_fps)) / fade_time;
}