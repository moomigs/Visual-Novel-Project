robo1 = instance_create_depth(672 + 352, 288, 0, Obj_NPC);
robo2 = instance_create_depth(672 + 352, 352, 0, Obj_NPC);
robo3 = instance_create_depth(672 - 352, 288, 0, Obj_NPC);
robo4 = instance_create_depth(672 - 352, 352, 0, Obj_NPC);

robo1.on_move_end = function() {
	robo1.face_direction("down");
}
robo2.on_move_end = function() {
	robo2.face_direction("down");
}
robo3.on_move_end = function() {
	robo3.face_direction("down");
}
robo4.on_move_end = function() {
	robo4.face_direction("down");
}

robo1.move_to_relative(-64, 0);
robo2.move_to_relative(-64, 0);
robo3.move_to_relative(64, 0);
robo4.move_to_relative(64, 0);