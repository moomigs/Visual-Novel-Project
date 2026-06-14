if freeze { return; }

check_x = x;
check_y = y;
if direction == 0 {
	check_x += 5;
} else if direction == 90 {
	check_y -= 5;
} else if direction == 180 {
	check_x -= 5;
} else if direction == 270 {
	check_y += 5;
}
var object = instance_place(check_x, check_y, Obj_Solid);
if object != noone {
	if variable_instance_exists(object, "interact") {
		object.interact();
	}
}