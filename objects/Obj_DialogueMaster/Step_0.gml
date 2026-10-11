
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

vp_x = camera_get_view_x(view_camera[0]);
vp_y = camera_get_view_y(view_camera[0]);
if floor(vp_x+0.5) != pan_to_x or floor(vp_y+0.5) != pan_to_y {
	camera_set_view_pos(view_camera[0], vp_x + (pan_to_x - vp_x) * 0.25, vp_y + (pan_to_y - vp_y) * 0.25);
}

frame_count ++;