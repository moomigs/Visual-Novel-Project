focus_instance = noone;
focus_variable = noone;
focus_value = noone;

focus_object = noone;

waitfor = function(_inst, _var, _val) {
	focus_instance = _inst;
	focus_variable = _var;
	focus_value = _val;
	alarm_set(0, 1);
}

waitfor_instance = function(_obj, _var=noone, _val=noone) {
	focus_object = _obj;
	focus_variable = _var;
	focus_value = _val;
	alarm_set(1, 1);
}

done = function() {}