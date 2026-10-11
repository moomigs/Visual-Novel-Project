if entity_waitingfor_battle != noone and entity_waitingfor_battle.battle_target == noone {
	entity_waitingfor_battle = noone;
	paused = false;
	next_line();
} else {
	alarm_set(5, 5);
}