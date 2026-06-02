
view_width = display_get_gui_width();
view_height = display_get_gui_height();

var xscale = view_width / global.default_width;
var yscale = view_height / global.default_height;

draw_sprite_ext(sprite_index, 0, x, y, image_xscale*xscale, image_yscale*yscale, image_angle, image_blend, image_alpha);
if face != -1 {
	draw_sprite_ext(face, 0, x, y, image_xscale*xscale, image_yscale*yscale, image_angle, image_blend, image_alpha);	
}