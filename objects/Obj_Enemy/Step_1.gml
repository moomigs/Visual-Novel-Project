target = instance_find(Obj_Player, 0);

if target != noone {
	if abs(y-target.y) > move_speed {
		if target.y < y { up = true; down = false; }
		else if target.y > y { down = true; up = false; }
	} else { up = false; down = false; }
	if abs(x-target.x) > 3 {
		if target.x < x { left = true; right = false; }
		else if target.x > x { right = true; left = false; }
	} else { left = false; right = false; }

	if point_distance(target.x, target.y, x, y) <= 48 {
		if defending { return; }
		if freeze { return; }
		var attack = instance_create_depth(x, y, depth, Move_Stab);
		attack.mover = self;
		attack.TRAVEL = 48;
		attack.winddown = 0.25;
		attack.go(direction);
	}
}