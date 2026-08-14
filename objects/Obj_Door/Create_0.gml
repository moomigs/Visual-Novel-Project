event_inherited();

function interact() {
	if goto_room != noone {
		if instance_exists(Obj_Player) {
			Obj_Player.freeze = true;
		}
		global.entity_pause = true;
		
		room_goto(goto_room);
		audio_stop_all();
	}
}