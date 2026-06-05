
draw_set_alpha(alpha);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw_text_transformed(x, y, text, scale, scale, image_angle);

if text != noone {
	text.align(fa_center, fa_middle);
	text.scale(scale);
	text.blend(c_white, alpha);
	text.draw(x, y);
}