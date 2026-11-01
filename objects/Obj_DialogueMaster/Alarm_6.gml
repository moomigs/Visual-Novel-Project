if variable_waitfor != noone and variable_instance_get(scene, variable_waitfor) == true {
	variable_waitfor = noone;
	paused = false;
	next_line();
} else {
	alarm_set(6, 5);
}