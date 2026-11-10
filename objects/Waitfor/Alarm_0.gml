if focus_instance != noone and focus_variable != noone {
	var _val = variable_instance_get(focus_instance, focus_variable);
	if _val == focus_value {
		done(focus_instance);
		alarm_set(11, 10);
	} else {
		alarm_set(0, 1);
	}
}