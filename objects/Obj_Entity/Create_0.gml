event_inherited();

velocity_x = 0;
velocity_y = 0;

movespeed_alpha = 1;
lock_direction = false;
ignore_collision = false;
follow = noone;

pause = false;
global_paused = false;

push_x = 0;
push_y = 0;
push_friction = 0.9;

scene_setsprite = noone;
moving_to = false
goto_x = 0;
goto_y = 0;

up = false;
down = false;
left = false;
right = false;

facing = "down";

walking = false;
attacking = false;
defending = false;
attack_cooldown = 0;
attack_pending = noone;

show_healthbar = 0;

footstep_interval = game_get_speed(gamespeed_fps)/4;
footstep = 1;

function update_depth() {
	depth = room_height - y;
}

function die() {
	audio_play_sound(snd_die, 1, false, 4, 0, 1.5);
	instance_destroy();
}

function damage(n) {
	if passive { return; }
	if hp == 0 { return; }
	audio_play_sound(snd_hurt, 1, false, 2.5, 0, 0.9 + random(1) * 0.2);
	if defending { return; }
	hp = max(0, hp - n);
	show_healthbar = 2*game_get_speed(gamespeed_fps);
	instance_create_depth(x, y, depth, Effect_entity_hurt).go(self);
	if hp == 0 {
		if can_die {
			on_die();
			die();
		} else {
			on_die();
			battle_target = noone;
			battle_state = "idle";
			move_stop();
		}
	}
}

/// @function entity_move_and_collide(dx, dy, [num_iterations], [xoff], [yoff], [max_x_move], [max_y_move])
/// @desc Custom move_and_collide for Obj_Entity.
///       Ignores other Obj_Entity instances that share the same "friendly" value
///       and have can_move == true. Collides with everything else under Obj_Solid.
/// @param {Real} dx
/// @param {Real} dy
/// @param {Real} [num_iterations=4]
/// @param {Real} [xoff=0]
/// @param {Real} [yoff=0]
/// @param {Real} [max_x_move=-1]
/// @param {Real} [max_y_move=-1]
/// @return {Array} Array of instance IDs collided with (same as built-in)
function entity_move_and_collide(_dx, _dy, _num_iterations = 4, _xoff = 0, _yoff = 0, _max_x_move = -1, _max_y_move = -1)
{
    var _colliders = [];

    with (Obj_Solid)
    {
        // Always skip self
        if (id == other.id) continue;

        var _ignore = false;

        // Only consider ignoring if this is an Obj_Entity (or a child of it)
        if (object_index == Obj_Entity || object_is_ancestor(object_index, Obj_Entity))
        {
            if variable_instance_exists(other, "friendly") and variable_instance_exists(other, "can_move") and (can_move && friendly == other.friendly)
            {
                _ignore = true;
            }
        }

        if (!_ignore)
        {
            array_push(_colliders, id);
        }
    }

    // Call the real function with only the instances we care about
    return move_and_collide(_dx, _dy, _colliders, _num_iterations, _xoff, _yoff, _max_x_move, _max_y_move);
}

function move_to(_x, _y) {
	goto_x = _x;
	goto_y = _y;
	moving_to = true;
}
function move_to_relative(_x, _y) {
	goto_x = x+_x;
	goto_y = y+_y;
	moving_to = true;
}
function move_stop() {
	goto_x = x;
	goto_y = y;
	moving_to = false;
}

function face_direction(d) {
	if d == "up" then direction = 90 facing = d;
	if d == "down" then direction = 270 facing = d;
	if d == "right" then direction = 0 facing = d;
	if d == "left" then direction = 180 facing = d;
}
function face_entity(e) {
	if e.x < x and (abs(e.y-y) < abs(e.x-x)) {
		face_direction("left");
	} else if e.x > x and (abs(e.y-y) < abs(e.x-x)) {
		face_direction("right");
	} else if e.y < y {
		face_direction("up");
	} else {
		face_direction("down");
	}
}

function push(_x, _y) {
	if passive { return; }
	if freeze { return; }
	push_x += _x;
	push_y += _y;
}


on_move_end = function() {}
restart_room_on_die = false;
on_die = function() {
	movespeed_alpha = 1;
	if restart_room_on_die {
		var fade = instance_create_depth(0, 0, 0, Effect_transition_fade);
		fade.transition = function() {
			room_restart();
		}
		fade.start(1);
	}
}