
draw_set_color(make_colour_rgb(255,255,255));
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(font_menu);

var text = "Skip";
if global.dialogueSkipping {
	draw_set_alpha(1);
	text = "Skipping";
} else {
	draw_set_alpha(0.4);
}

if Obj_DialogueMaster.textbox_visible == false {
	draw_set_alpha(0);
}

view_width = display_get_gui_width();
view_height = display_get_gui_height();
x = view_width/2 + sprite_get_width(spr_menubutton) + padding/3;
y = view_height - sprite_get_height(spr_menubutton) - 3;

image_alpha = draw_get_alpha();
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

draw_text_transformed(x, y + image_yscale*sprite_get_height(sprite_index)/2, text, image_xscale, image_yscale, 0);