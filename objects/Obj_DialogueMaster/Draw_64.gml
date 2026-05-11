draw_set_alpha(255);
draw_set_colour(make_colour_rgb(255,255,255));
draw_set_valign(fa_top);
draw_set_halign(fa_left)
draw_set_font(font_dialogue);

//Draw textbox
if textbox_visible {
	draw_sprite(spr_dialoguebox, 0, textbox_x, textbox_y);
}

//Draw name
draw_set_colour(make_colour_rgb(180,180,255));
draw_text(textbox_x + padding, textbox_y + padding/2, display_name);

//Draw dialogue
draw_set_colour(make_colour_rgb(255,255,255));
draw_text_ext(textbox_x + padding, textbox_y + padding*1.5 + font_get_size(font_dialogue), display, 14+font_get_size(font_dialogue), sprite_get_width(spr_dialoguebox)-padding*2);

//Draw next arrow sprite
if display_final != "" and display == display_final and auto_skip == -1 {
	draw_sprite(spr_nextarrow, 0,
		textbox_x + sprite_get_width(spr_dialoguebox) - padding*2 - abs(sin(12*current_time/1000)*24),
		textbox_y + sprite_get_height(spr_dialoguebox) - padding*2
	);
}