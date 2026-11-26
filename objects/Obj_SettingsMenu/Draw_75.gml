
draw_set_alpha(1);

view_width = display_get_gui_width();
view_height = display_get_gui_height();
height = view_height * 0.67;
width = height * 1;

//main box
draw_set_colour(c_black);
draw_rectangle(view_width/2 - 2*width/3 , view_height/2 - height/2, view_width/2 + 2*width/3 , view_height/2 + height/2, false)
draw_set_colour(c_white);
draw_rectangle(view_width/2 - 2*width/3 , view_height/2 - height/2, view_width/2 + 2*width/3 , view_height/2 + height/2, true)

//gpu_set_scissor(view_width/2 - width/2, view_height/2 - height/2, width, height);
	
draw_set_colour(c_ltgrey);
draw_set_font(font_menu);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
	
draw_set_colour(c_white);
	
var _keys;
_keys = struct_get_names(global.game_settings.sliders);
for (var i = 0; i < array_length(_keys); i++) {
	var _x = view_width/2 - width/3
	var _y = view_height/2 - height/2 + padding + i*padding*5;
		
	var _name = _keys[i];
	var _value = global.game_settings.sliders[$ _name];
	draw_text(_x, _y, _name);
		
	//slider bar
	var slider_size = 2*width/3 - padding*4;
	draw_rectangle(_x-slider_size/2, _y+padding*3-3, _x+slider_size/2, _y+padding*3+3, true);
		
	//post
	var offset = slider_size * (_value - 0.5)
	draw_rectangle(_x, _y+padding*3-padding/2-3, _x+1, _y+padding*3+padding/2+3, false);
	draw_rectangle(_x+offset-3, _y+padding*3-padding/2-3, _x+offset+3, _y+padding*3+padding/2+3, false);
}
	
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
	
_keys = struct_get_names(global.game_settings.booleans);
for (var i = 0; i < array_length(_keys); i++) {
	var _x = view_width/2 + padding*2
	var _y = view_height/2 - height/2 + padding + i*padding*2.5;
		
	var _name = _keys[i];
	var _value = global.game_settings.booleans[$ _name];
	draw_text(_x+padding*2, _y+padding*2, _name);
		
	//check box
	draw_rectangle(_x-padding/2, _y+padding*2-padding/2, _x+padding/2, _y+padding*2+padding/2, true);
	if _value {
		draw_rectangle(_x-padding/2 +2, _y+padding*2-padding/2 +2, _x+padding/2 -3, _y+padding*2+padding/2 -3, false);
	}
}
	
	
//gpu_set_scissor(0, 0, window_get_width(), window_get_height());

close_button.x = view_width/2 + 2*width/3;
close_button.y = view_height/2 - height/2;