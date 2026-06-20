event_inherited();

KNOCKBACK = 9;
STRENGTH = 65;
TRAVEL = bbox_right - bbox_left;
WIDTH = bbox_bottom - bbox_top;
TIME = sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);

step = 0;

forward_offset = 48;
start_x = x;
start_y = y;
