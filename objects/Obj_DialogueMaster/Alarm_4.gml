if entity_waitingfor != noone and entity_waitingfor.moving_to == false {
	entity_waitingfor = noone;
	pause = false;
	next_line();
} else {
	alarm_set(4, 1);
}