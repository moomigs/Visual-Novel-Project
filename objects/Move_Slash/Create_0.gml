event_inherited();

KNOCKBACK = 12;
STRENGTH = 20;
TRAVEL = bbox_right - bbox_left;
WIDTH = bbox_bottom - bbox_top;
TIME = sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);

_time = 0;
step = 0;

forward_offset = 16;
start_x = x;
start_y = y;

if mover != noone {
	start_x = mover.x;
	start_y = mover.y;
}

x = start_x;
y = start_y;