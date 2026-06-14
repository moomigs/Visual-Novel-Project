event_inherited();

KNOCKBACK = 6;
STRENGTH = 20;
TRAVEL = bbox_right - bbox_left;
WIDTH = bbox_bottom - bbox_top;
TIME = sprite_get_number(sprite_index)/sprite_get_speed(sprite_index);

step = 0;

forward_offset = 16;
start_x = x;
start_y = y;

function go() {
	var _hits = ds_list_create();
	
	var _x1 = start_x + x_velocity*forward_offset - abs(right_x)*WIDTH/2;
	var _y1 = start_y + y_velocity*forward_offset - abs(right_y)*WIDTH/2;
	var _x2 = start_x + x_velocity*forward_offset + x_velocity*TRAVEL + abs(right_x)*WIDTH/2;
	var _y2 = start_y + y_velocity*forward_offset + y_velocity*TRAVEL + abs(right_y)*WIDTH/2;
	
	var x1 = min(_x1, _x2);
	var y1 = min(_y1, _y2);
	var x2 = max(_x1, _x2);
	var y2 = max(_y1, _y2);
	
	var _nHits = collision_rectangle_list(x1, y1, x2, y2, Obj_Entity, false, true, _hits, true);
	if _nHits > 0 {
	    for (var i = 0; i < _nHits; ++i)
	    {
			var inst = _hits[| i];
			if inst != mover.id {
				var _d = point_distance(inst.x, inst.y, mover.x, mover.y);
				var _x = (inst.x - mover.x) / _d;
				var _y = (inst.y - mover.y) / _d;
				inst.push(_x * KNOCKBACK, _y * KNOCKBACK);
				inst.damage(STRENGTH);
			}
	    }
	}
}