



var gx = device_mouse_x_to_gui(0);
var gy = device_mouse_y_to_gui(0);

var bx1 = draw_x - sprite_get_xoffset(sprite_index) * image_xscale;
var by1 = draw_y - sprite_get_yoffset(sprite_index) * image_yscale;
var bx2 = bx1 + sprite_get_width(sprite_index) * image_xscale;
var by2 = by1 + sprite_get_height(sprite_index) * image_yscale;

var button_shown = !instance_exists(Obj_DialogueMaster) || Obj_DialogueMaster.textbox_visible;

if button_shown && point_in_rectangle(gx, gy, bx1, by1, bx2, by2) {
	
	if not menuVisible {
		if not instance_exists(Obj_DialogueMaster) {
			menuVisible = true;
		}
	}
	exit;
}







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
				return;
			}
		}
	}
	if not instance_exists(Obj_DialogueMaster) {
		if mousex >= (close_button.x-sprite_get_xoffset(close_button.sprite_index)) and mousey >= (close_button.y-sprite_get_yoffset(close_button.sprite_index)) and mousex <= (close_button.x-sprite_get_xoffset(close_button.sprite_index)+close_button.sprite_width*close_button.image_xscale) and mousey <= (close_button.y-sprite_get_yoffset(close_button.sprite_index)+close_button.sprite_height*close_button.image_yscale) {
			close_button.close();
			if x < 0 and y < 0 {
				instance_destroy();
			}
		}
	}
}