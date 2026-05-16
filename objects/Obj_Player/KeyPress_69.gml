if !freeze {
	check_x = x;
	check_y = y;
	if direction == 0 {
		check_x += 1;	
	} else if direction == 90 {
		check_y -= 1;
	} else if direction == 180 {
		check_x -= 1;
	} else if direction == 270 {
		check_y += 1;	
	}
	var object = instance_place(check_x, check_y, Obj_Solid);
	show_debug_message(object);
	if object != noone {
		show_debug_message(object.interact);
		if object.interact != noone {
			object.interact();	
		}
	}
}