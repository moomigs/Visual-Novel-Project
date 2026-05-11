
draw_set_alpha(0.4);
draw_set_color(make_colour_rgb(255,255,255));
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(font_menu);

image_alpha = draw_get_alpha();
draw_self();

draw_text(x, y + sprite_get_height(sprite_index)/2, "Menu");