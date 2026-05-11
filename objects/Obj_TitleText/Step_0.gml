if fade == 1 and alpha < fade {
	alpha += (1/fps) / fade_time;
} else if fade == -1 and alpha > fade {
	alpha -= (1/fps) / fade_time;
}