event_inherited();

velocity_x = 0;
velocity_y = 0;

up = false;
down = false;
left = false;
right = false;

facing = "down";

walking = false;

footstep_interval = game_get_speed(gamespeed_fps)/4;
footstep = 1;

function update_depth() {
	depth = room_height - y;
}