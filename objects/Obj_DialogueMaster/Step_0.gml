
if current_line != -1 {
	if string_length(display_scribble.get_text())>0 and typist.get_state() == 1 and !typist_finished {
		typist_finished = true;
		if global.dialogueSkipping == true {
			//paused = true;
			//alarm_set(0, 5);
		} else if auto_skip != -1 {
			paused = true;
			alarm_set(0, auto_skip*game_get_speed(gamespeed_fps));
		}
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

frame_count ++;