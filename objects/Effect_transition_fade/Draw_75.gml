if fade > fade_to {
	fade = max(fade - fade_per_tick, fade_to);
} else if fade < fade_to {
	fade = min(fade + fade_per_tick, fade_to);
}
if fade == fade_to {
	fade_done = true;
	if auto_fadein {
		auto_fadein = false;
		transition();
		fade_in(seconds);
	}
}

draw_set_alpha(fade);
draw_set_colour(c_black);
draw_rectangle(0, 0, room_width, room_height, false);