event_inherited();

function interact() {
	if goto_room != noone {
		room_goto(goto_room);
		audio_stop_all();
	}
}