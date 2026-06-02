
if historyVisible {
	draw_set_alpha(1);
} else {
	draw_set_alpha(0.4);
}
if Obj_DialogueMaster.textbox_visible == false {
	draw_set_alpha(0);
}

close_button.visible = historyVisible;

draw_set_color(make_colour_rgb(255,255,255));
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(font_menu);


view_width = display_get_gui_width();
view_height = display_get_gui_height();
x = view_width/2 - sprite_get_width(spr_menubutton) - padding/3;
y = view_height - sprite_get_height(spr_menubutton) - 3;
height = view_height * 0.67;
width = height * 1;

close_button.x = view_width/2 + width/2;
close_button.y = view_height/2 - height/2;

image_alpha = draw_get_alpha();
draw_sprite_ext(spr_menubutton, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_text_transformed(x, y + image_yscale*sprite_get_height(sprite_index)/2, "History", image_xscale, image_yscale, 0);

if historyVisible {
	
	var minScrollHeight = height - padding/2;
	var maxScrollHeight = minScrollHeight;
	
	draw_set_alpha(1);
	
	draw_set_colour(c_black);
	draw_rectangle(view_width/2 - width/2 , view_height/2 - height/2, view_width/2 + width/2 , view_height/2 + height/2, false)
	
	draw_set_colour(c_white);
	draw_rectangle(view_width/2 - width/2 , view_height/2 - height/2, view_width/2 + width/2 , view_height/2 + height/2, true)

	gpu_set_scissor(view_width/2 - width/2, view_height/2 - height/2, width, height);
	
	draw_set_colour(c_ltgrey);
	
	draw_set_font(font_dialogue);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	
	var line_y = 0;
	var sep = 14+font_get_size(font_dialogue);
	var text_width = width-padding*2;
	for (var i = 0; i < array_length(Obj_DialogueMaster.history); i += 1) {
		var value = array_get(Obj_DialogueMaster.history, i);
		var text_height = string_height_ext(value, sep, text_width);
		line_y += text_height + padding;
		maxScrollHeight = max(minScrollHeight, line_y);
	}
	scroll_y = clamp(scroll_y, 0, maxScrollHeight - minScrollHeight);
	line_y = 0;
	for (var i = 0; i < array_length(Obj_DialogueMaster.history); i += 1) {
		draw_set_colour(c_ltgrey);
		var value = array_get(Obj_DialogueMaster.history, i);
		draw_text_ext(view_width/2, view_height/2 - height/2 + line_y + padding - scroll_y, value, sep, text_width);
		var text_height = string_height_ext(value, sep, text_width);
		line_y += text_height + padding;
		draw_set_colour(c_dkgray);
		draw_line_width(
			view_width/2 - width/2 + 3*padding,
			view_height/2 - height/2 + line_y + padding/2 - scroll_y,
			view_width/2 + width/2 - 3*padding,
			view_height/2 - height/2 + line_y + padding/2 - scroll_y,
			1);
	}
	
	draw_set_colour(c_white);
	if maxScrollHeight > minScrollHeight {
		var scrollbar_x = view_width/2 + width/2 - padding/2;
		var scrollbar_ytop = view_height/2 - height/2 + padding;
		var scrollbar_ybtm = view_height/2 + height/2 - padding;
		var scrollbar_percent = minScrollHeight / maxScrollHeight;
		
		scrollbar_ybtm = scrollbar_ybtm + (scrollbar_ytop - scrollbar_ybtm) * (1-scrollbar_percent);
		
		var travel = ((view_height/2 + height/2 - padding)-scrollbar_ybtm) * scroll_y / (maxScrollHeight - minScrollHeight);
		
		draw_rectangle(scrollbar_x, scrollbar_ytop + travel, scrollbar_x+8, scrollbar_ybtm + travel, false);
	}
	
	gpu_set_scissor(0, 0, window_get_width(), window_get_height());
}