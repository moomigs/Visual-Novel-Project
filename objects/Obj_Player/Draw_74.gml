if variable_global_exists("link") and array_length(global.link) > 0 {
	draw_set_colour(c_white);
	draw_set_font(font_menu);
	draw_set_halign(fa_center);
	draw_text(window_get_width() / 2, 24, "[C] Call");
	if call_menu_open != false {
		var call_menu_length = array_length(global.link);
		
		view_width = display_get_gui_width();
		view_height = display_get_gui_height();
		_x = view_width/2;
		_y = view_height - sprite_get_height(spr_menubutton) - 3;
		item_height = sprite_get_height(spr_menubutton)
		height = item_height * (1+call_menu_length) * 2;
		width = view_width/8;
		
		//draw_text_transformed(x, y + image_yscale*sprite_get_height(sprite_index)/2, "Menu", image_xscale, image_yscale, 0);

		draw_set_alpha(1);
	
		draw_set_colour(c_black);
		draw_rectangle(view_width/2 - 2*width/3 , view_height - height/2, view_width/2 + 2*width/3 , view_height, false)
	
		draw_set_colour(c_white);
		draw_rectangle(view_width/2 - 2*width/3 , view_height - height/2, view_width/2 + 2*width/3 , view_height, true)

		//gpu_set_scissor(view_width/2 - width/2, view_height/2 - height/2, width, height);
	
		draw_set_colour(c_ltgrey);
	
		draw_set_font(font_menu);
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
	
		draw_set_colour(c_white);
		array_foreach(global.link, function(_element, _index){
			draw_text_transformed(view_width/2, view_height - (_index+0.5)*item_height, _element.name, 1, 1, 0);
			if call_menu_open == (_index+1) {
				draw_rectangle(view_width/2 - 2*width/3 + 4 , view_height - (_index+0.5)*item_height - item_height, view_width/2 + 2*width/3 - 4 , view_height - (_index+0.5)*item_height, true)
			}
		})
	}
}