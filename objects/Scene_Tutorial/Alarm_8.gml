var heavy = instance_create_depth(child.x, child.y, child.depth, Move_Heavy);
heavy.mover = child;
heavy.set_direction(child.direction);
heavy.charge();
heavy.go(child.direction);