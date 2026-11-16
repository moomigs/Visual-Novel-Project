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
if fade_sprite != noone {
	draw_sprite_stretched(fade_sprite, 0, 0, 0, room_width, room_height);
} else {
	draw_rectangle(-1, -1, room_width+1, room_height+1, false);
}
draw_set_alpha(1);
draw_set_colour(c_white);
