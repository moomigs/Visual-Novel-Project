draw_set_alpha(255);
draw_set_colour(c_white);
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
draw_set_colour(c_white);
//draw_text_ext(gui_textbox_x + padding, gui_textbox_y + padding*1.5 + font_get_size(font_dialogue), display, 14+font_get_size(font_dialogue), sprite_get_width(spr_dialoguebox)-padding*2);

if textbox_visible and current_line != -1 {
	display_scribble.starting_format("font_dialogue", c_white);
	display_scribble.scale(text_scale);
	display_scribble.wrap(sprite_get_width(spr_dialoguebox)-padding*2);
	if skip {
		skip = false;
		typist.skip();
	}
	display_scribble.draw(gui_textbox_x + padding, gui_textbox_y + padding*1.5 + font_get_size(font_dialogue), typist);
}

var view_width = display_get_gui_width();
var view_height = display_get_gui_height();

var number_of_choices = array_length(choices)
if choices_visible and number_of_choices>0 {
	var choice_width = global.default_width * 0.45;
	var choice_height = choice_width / 10;
	
	for (var i = 0; i < number_of_choices; i++) {
		var centered_index = (i - (number_of_choices - 1) * 0.5);
		var choice_y = view_height/2 + (choice_height + padding)* centered_index;
		var choice_x = view_width/2;
		
		draw_set_colour(c_black);
		draw_rectangle(choice_x - choice_width/2, choice_y - choice_height/2, choice_x + choice_width/2, choice_y + choice_height/2, false);
		draw_set_colour(c_white);
		draw_rectangle(choice_x - choice_width/2, choice_y - choice_height/2, choice_x + choice_width/2, choice_y + choice_height/2, true);
		var text = choices[i];
		text.draw(choice_x, choice_y);
	}
}

//Draw next arrow sprite
//if display_final != "" and display == display_final and auto_skip == -1 {
//	draw_sprite(spr_nextarrow, 0,
//		gui_textbox_x + sprite_get_width(spr_dialoguebox) - padding*2 - abs(sin(12*current_time/1000)*24),
//		gui_textbox_y + sprite_get_height(spr_dialoguebox) - padding*2
//	);
//}