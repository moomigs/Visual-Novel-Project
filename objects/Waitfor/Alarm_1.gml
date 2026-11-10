if focus_object != noone {
	var _inst = instance_find(focus_object, 0)
	if _inst != noone {
		if (focus_variable != noone and variable_instance_get(_inst, focus_variable)==focus_value) or (focus_variable==noone) {
			done(_inst);
			alarm_set(11, 10);
		} else {
			alarm_set(1, 1);
		}
	} else {
		alarm_set(1, 1);
	}
}