

view_width = display_get_gui_width();
view_height = display_get_gui_height();
height = view_height * 0.67;
width = height * 1;

var __x = x;
var __y = y;


draw_set_alpha(1);
draw_set_color(make_colour_rgb(255,255,255));
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(font_menu);

__x = x/room_width * display_get_gui_width();
__y = y/room_height * display_get_gui_height();
image_xscale = display_get_gui_width()/room_width;
image_yscale = display_get_gui_height()/room_height;

draw_sprite_ext(sprite_index, 0, __x, __y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_text_transformed(__x, __y + image_yscale*sprite_get_height(sprite_index)/2, button_text, image_xscale, image_yscale, 0);
