var stab = instance_create_depth(child.x, child.y, child.depth, Move_Stab);
stab.mover = child;
stab.set_direction(child.direction);
stab.go(child.direction);