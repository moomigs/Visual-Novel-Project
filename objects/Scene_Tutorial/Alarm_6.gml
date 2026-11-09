var slash = instance_create_depth(child.x, child.y, child.depth, Move_Slash);
slash.mover = child;
slash.set_direction(child.direction);
slash.charge();
slash.go(child.direction);