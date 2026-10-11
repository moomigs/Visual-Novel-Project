show_debug_message(entity_waitingfor != noone);
show_debug_message(entity_waitingfor.moving_to);
show_debug_message("===");
if entity_waitingfor != noone and entity_waitingfor.moving_to == false {
	entity_waitingfor = noone;
	paused = false;
	next_line();
} else {
	alarm_set(4, 1);
}