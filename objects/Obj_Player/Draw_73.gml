event_inherited();

var chargebar_width = 32;
var chargebar_height = 4;

if attack_pending and attack_pending.charge and attack_pending.charge_value > 0 {
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_rectangle(x - chargebar_width/2, y + 32 - chargebar_height, x + chargebar_width/2, y + 32, true);
	draw_set_color(c_aqua);
	draw_rectangle(x - chargebar_width/2, y + 32 - chargebar_height, x - chargebar_width/2 + chargebar_width*attack_pending.charge_value, y + 32, false);
}