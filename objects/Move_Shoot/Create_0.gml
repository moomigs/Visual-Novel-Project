event_inherited();

warning = noone;
blocked = false;
blocked_x = 0;
blocked_y = 0;
complete = false;

charge = function() {
	warning = instance_create_depth(x, y - 40, depth, Obj_Warning);
}

KNOCKBACK = 2;
STRENGTH = 16;

step = 0;
start_x = x;
start_y = y;

tracer_alpha = 0;
tracer_x1 = 0;
tracer_x2 = 0;
tracer_y1 = 0;
tracer_y2 = 0;