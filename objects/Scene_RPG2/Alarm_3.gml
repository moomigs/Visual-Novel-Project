robo1.on_move_end = function() {
	instance_destroy(robo1);
}
robo2.on_move_end = function() {
	instance_destroy(robo2);
}
robo3.on_move_end = function() {
	instance_destroy(robo3);
}
robo4.on_move_end = function() {
	instance_destroy(robo4);
}

robo1.ignore_collision = true;
robo2.ignore_collision = true;
robo3.ignore_collision = true;
robo4.ignore_collision = true;

robo1.move_to(door.x, door.y);
robo2.move_to(door.x, door.y);
robo3.move_to(door.x, door.y);
robo4.move_to(door.x, door.y);