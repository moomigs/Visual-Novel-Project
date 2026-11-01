slash = instance_create_depth(collins.x, collins.y, collins.depth, Move_Slash);
slash.mover = collins;
slash.set_direction(collins.direction);
slash.charge();

alarm_set(9, 10);