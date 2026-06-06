velocity_x = 0;
velocity_y = 0;

footstep_interval = game_get_speed(gamespeed_fps)/4;
footstep = 1;
alarm_set(0, footstep_interval);