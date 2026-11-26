view_width = display_get_gui_width();
view_height = display_get_gui_height();
height = view_height * 0.67;
width = height * 1;

var __x = x;
var __y = y;

if menuVisible {
	draw_set_alpha(1);
} else {
	draw_set_alpha(0.4);
}
if Obj_DialogueMaster.textbox_visible == false {
	draw_set_alpha(0);
}
__x = view_width/2;
__y = Obj_DialogueMaster.textbox_y - sprite_get_height(sprite_index) - 3;
	
x = __x;
y = __y;

draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(font_menu);
image_alpha = draw_get_alpha();

draw_x = __x;
draw_y = __y;

draw_sprite_ext(sprite_index, 0, __x, __y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
draw_text_transformed(__x, __y + image_yscale*sprite_get_height(sprite_index)/2, button_text, image_xscale, image_yscale, 0);
