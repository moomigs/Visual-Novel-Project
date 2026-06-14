var healthbar_width = 32;
var healthbar_height = 4;

if show_healthbar > 0 {
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_rectangle(x - healthbar_width/2, y - 48 - healthbar_height, x + healthbar_width/2, y - 48, true);
	if (hp/max_health) > .67 {
		draw_set_colour(c_lime);
	} else if (hp/max_health) > .34 {
		draw_set_colour(c_yellow);
	} else {
		draw_set_colour(c_red);
	}
	draw_rectangle(x - healthbar_width/2, y - 48 - healthbar_height, x - healthbar_width/2 + healthbar_width*(hp/max_health), y - 48, false);
}