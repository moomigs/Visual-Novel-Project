event_inherited();

KNOCKBACK = 7;
STRENGTH = 45;
TRAVEL = bbox_right - bbox_left;
WIDTH = bbox_bottom - bbox_top;
TIME = sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);
DELAY = 8;
COOLDOWN_PERIOD = 60; // 1 sec

step = 0;

forward_offset = 32;
start_x = x;
start_y = y;
