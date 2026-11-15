if warning != noone {
	instance_destroy(warning);
}

audio_play_sound(snd_laser, 1, false, 1.7, 0, 0.9+random(1)*0.2);

var x_direction = x_velocity;
var y_direction = y_velocity;

var nearest = instance_nearest(x, y, Obj_Enemy);
if nearest != noone {
	var dist = point_distance(x, y, nearest.x, nearest.y);
	if dist > 0 {
		x_direction = (nearest.x - x) / dist;
		y_direction = (nearest.y - y) / dist;
	}
}

var range = view_get_wport(0)/2 + 128;

var _hits = ds_list_create();

// Direction vector (assume x_direction / y_direction are already normalized)
var _end_x = x + x_direction * range;
var _end_y = y + y_direction * range;

// Thin thickness perpendicular to the shot (0.5–2 works well; higher = more forgiving)
var _thick = 2;
var _perp_x = -y_direction * _thick;
var _perp_y =  x_direction * _thick;

var drop = 0;
if x_direction != 0 {
	drop = 26;
}

var _nHits = collision_rectangle_list(
    min(x, _end_x) + _perp_x, min(y, _end_y) + _perp_y,
    max(x, _end_x) - _perp_x, max(y, _end_y) - _perp_y + drop,
    Obj_Entity, false, true, _hits, true
);

show_debug_message(_nHits);

inst = noone;

if _nHits > 0 {
	for (var i = 0; i < _nHits; ++i)
	{
		inst = _hits[| i];
		if (inst != mover.id) and inst.passive == false/* and (inst.object_index != mover.object_index)*/ {
			var _d = point_distance(inst.x, inst.y, mover.x, mover.y);
			var _x = (inst.x - mover.x) / _d;
			var _y = (inst.y - mover.y) / _d;
			
			//blocked = false;
			with(Move_Slash) {
				if mover.id == other.inst and ((current_time/1000)-_time)<winddown {
					other.blocked = true;
				}
			}
			if blocked == false and inst.object_index != Obj_Player and inst.battle_target != noone {
				if random(1) > 0.17 {
					//auto block
					var slash = instance_create_depth(inst.x, inst.y, inst.depth, Move_Slash);
					slash.mover = inst;
					slash.set_direction(inst.direction);
					if random(1) > 0.33 {
						slash.go(inst.direction);
						blocked = true;
					} else {
						slash.go(inst.direction, random_range(4, 8));
						blocked = false;
					}
				}
			}
			complete = true;
			
			if blocked != true {
				inst.push(_x * KNOCKBACK, _y * KNOCKBACK);
				inst.damage(STRENGTH, mover, true);
			} else {
				audio_play_sound(snd_block, 1, false, 1.7, 0, 0.9+random(1)*0.2)
			}
		}
	}
}

tracer_alpha = 1;
tracer_x1 = x;
tracer_x2 = x + x_direction*range;
tracer_y1 = y;
tracer_y2 = y + y_direction*range;