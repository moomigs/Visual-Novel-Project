duration = .25;
flash_frames = 2;
flash = false;
current_fps = game_get_speed(gamespeed_fps);
entity = noone;

function go(_entity) {
	entity = _entity;
	initial_blend = entity.image_blend;
	
	if entity.passive { instance_destroy(); return; }
	entity.passive = true;
	
	alarm_set(0, 1);
}
