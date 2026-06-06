draw_set_alpha(255);
draw_set_colour(make_colour_rgb(255,255,255));
draw_set_valign(fa_top);
draw_set_halign(fa_left)
draw_set_font(font_dialogue);

var gui_textbox_x = display_get_gui_width() / 2 - sprite_get_width(spr_dialoguebox) / 2;
var gui_textbox_y = display_get_gui_height() - sprite_get_height(spr_dialoguebox) - padding*2;

//Draw textbox
if textbox_visible {
	draw_sprite(spr_dialoguebox, 0, gui_textbox_x, gui_textbox_y);
}

//Draw name
draw_set_colour(make_colour_rgb(180,180,255));
//draw_text(gui_textbox_x + padding, gui_textbox_y + padding/2, display_name);
if textbox_visible and typist.get_state() > 0 {
	name_scribble.starting_format("font_dialogue", c_white);
	name_scribble.draw(gui_textbox_x + padding, gui_textbox_y + padding/2);
}

//Draw dialogue
draw_set_colour(make_colour_rgb(255,255,255));
//draw_text_ext(gui_textbox_x + padding, gui_textbox_y + padding*1.5 + font_get_size(font_dialogue), display, 14+font_get_size(font_dialogue), sprite_get_width(spr_dialoguebox)-padding*2);

if textbox_visible and current_line != -1 {
	display_scribble.starting_format("font_dialogue", c_white);
	display_scribble.scale(text_scale);
	display_scribble.wrap(sprite_get_width(spr_dialoguebox)-padding*2);
	display_scribble.draw(gui_textbox_x + padding, gui_textbox_y + padding*1.5 + font_get_size(font_dialogue), typist);
}

//Draw next arrow sprite
//if display_final != "" and display == display_final and auto_skip == -1 {
//	draw_sprite(spr_nextarrow, 0,
//		gui_textbox_x + sprite_get_width(spr_dialoguebox) - padding*2 - abs(sin(12*current_time/1000)*24),
//		gui_textbox_y + sprite_get_height(spr_dialoguebox) - padding*2
//	);
//}