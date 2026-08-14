event_inherited();

KNOCKBACK = 9;
STRENGTH = 65;
TRAVEL = bbox_right - bbox_left;
WIDTH = bbox_bottom - bbox_top;
TIME = sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);
DELAY = 8;

step = 0;

forward_offset = 32;
start_x = x;
start_y = y;
