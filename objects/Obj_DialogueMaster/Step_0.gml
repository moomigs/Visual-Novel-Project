if current_line != -1 {
	var line = display_final;
	if (line != noone and display != line) {
		var next_length = string_length(display) + 1;
		var next_display = string_copy(line, 1, next_length);
		display = next_display;
	}
}

if background_dissolving_final > 0 {
	var lay_top = layer_get_id("Background_Top");
	var back_top = layer_background_get_id(lay_top);
	layer_background_alpha(back_top, background_dissolving / background_dissolving_final);
	background_dissolving ++;
	if background_dissolving > background_dissolving_final {
		background_dissolving_final = 0;
		background_dissolving = 0;
	}
}