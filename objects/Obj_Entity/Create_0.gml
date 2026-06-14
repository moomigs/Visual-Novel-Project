event_inherited();

velocity_x = 0;
velocity_y = 0;

push_x = 0;
push_y = 0;
push_friction = 0.9;

up = false;
down = false;
left = false;
right = false;

facing = "down";

walking = false;
attacking = false;
defending = false;
attack_cooldown = 0;

show_healthbar = 0;

footstep_interval = game_get_speed(gamespeed_fps)/4;
footstep = 1;

function update_depth() {
	depth = room_height - y;
}

function die() {
	instance_destroy();
}

function damage(n) {
	if passive { return; }
	if hp == 0 { return; }
	hp = max(0, hp - n);
	show_healthbar = game_get_speed(gamespeed_fps);
	audio_play_sound(snd_hurt, 1, false, 2.5, 0, 0.9 + random(1) * 0.2);
	instance_create_depth(x, y, depth, Effect_entity_hurt).go(self);
	if hp == 0 { die(); }
}

function push(_x, _y) {
	if passive { return; }
	push_x += _x;
	push_y += _y;
}