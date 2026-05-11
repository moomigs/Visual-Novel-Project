draw_set_alpha(255);
draw_set_colour(make_colour_rgb(255,255,255));

//Draw textbox
draw_sprite(Sprite1, 0, textbox_x, textbox_y);

//Draw dialogue
draw_set_font(font_dialogue);
draw_text(textbox_x + padding, textbox_y + padding, display);

//Draw name
draw_text(textbox_x + padding, textbox_y - padding*2, display_name);