if focus_object != noone {
	if instance_find(focus_object, 0) != noone {
		done();
		alarm_set(11, 10);
	} else {
		alarm_set(1, 1);
	}
}