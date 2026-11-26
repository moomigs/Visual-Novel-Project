
draw_set_color(make_colour_rgb(255,255,255));
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(font_menu);

var _x = x/room_width * display_get_gui_width();
var _y = y/room_height * display_get_gui_height();
image_xscale = display_get_gui_width()/room_width;
image_yscale = display_get_gui_height()/room_height;

image_alpha = draw_get_alpha();
draw_sprite_ext(sprite_index, 0, _x, _y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_text_transformed(_x, _y + image_yscale*sprite_get_height(sprite_index)/2, "Start Game", image_xscale, image_yscale, 0);
