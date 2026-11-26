if !variable_global_exists("game_settings") {
	global.game_settings = {
		sliders: {
			"Text speed": 0.5,
			"Font size": 1,
			"Volume": 0.5
		},
		booleans: {
			"Fullscreen": false
		}
	}
}

height = display_get_gui_height() * 0.67;
width = height * 1;
padding = 20;

mousex = 0;
mousey = 0;
view_width = display_get_gui_width();
view_height = display_get_gui_height();

close_button = instance_create_depth(view_width/2 + 2*width/3, view_height/2 - height/2, -1, Obj_CloseButton);
close_button.close = function() {
	instance_destroy();
}

function fullscreen(v) {
	global.game_settings.booleans[$ "Fullscreen"] = v;
	window_set_fullscreen(v);
	if v {
		display_set_gui_size(display_get_width(), display_get_height());
	} else {
		display_set_gui_size(global.default_width, global.default_height);
	}
}