

if menuVisible {
	var cl = camera_get_view_x(view_camera[0])
	var ct = camera_get_view_y(view_camera[0])
	var off_x = mouse_x - cl
	var off_y = mouse_y - ct
	var off_x_percent = off_x / camera_get_view_width(view_camera[0])
	var off_y_percent = off_y / camera_get_view_height(view_camera[0])
	mousex = off_x_percent * display_get_gui_width()
	mousey = off_y_percent * display_get_gui_height()
	
	var _keys = struct_get_names(global.dialogue_settings.booleans);
	for (var i = 0; i < array_length(_keys); i++) {
		var _name = _keys[i];
		var _value = global.dialogue_settings.booleans[$ _name];
		
		var _x = view_width/2 + padding*2
		var _y = view_height/2 - height/2 + padding + i*padding*2.5;
		var x1, y1, x2, y2;
		x1 = _x-padding/2;
		y1 = _y+padding*2-padding/2;
		x2 = _x+padding/2;
		y2 = _y+padding*2+padding/2;
		
		if mousex > x1 and mousex < x2 and mousey > y1 and mousey < y2 {
			var nvalue = !_value;
			if _name == "Fullscreen" {
				fullscreen(nvalue);
			}
		}
	}
}