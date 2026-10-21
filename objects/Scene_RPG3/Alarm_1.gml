
if new_robot != noone {
	new_robot.face_direction("down");
	new_robot.on_move_end = function() {
		new_robot.face_direction("down");
	}
}

new_robot = instance_create_depth(door.x, door.y, 0, Obj_Robot);
new_robot.move_to(robot_walkto_x, robot_walkto_y);
robot_n ++;
if robot_n == 1 {
	robot_walkto_x = door.x - 64;
	alarm_set(1, 20);
} else if robot_n == 2 {
	robot_walkto_x = door.x + 64;
	alarm_set(1, 20);
} else if robot_n == 3 {
	robot_walkto_x = door.x - 128;
	alarm_set(1, 20);
} else if robot_n == 4 {
	robot_walkto_x = door.x + 128;
	alarm_set(1, 20);
} else {
	//
}