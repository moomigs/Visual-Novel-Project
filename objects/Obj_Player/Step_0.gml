event_inherited();

if !attacking and !freeze and can_defend {
	defending = keyboard_check(vk_lshift);
	if defending {
		if facing == "down" {
			sprite_index = spr_Player_forward_defending;
		} else if facing == "up" {
			sprite_index = spr_Player_backward_defending;
		} else if facing == "right" or facing == "left" {
			sprite_index = spr_Player_right_defending;
		}
	}
}

if tutorial_interact and not freeze {
	var check_x = x;
	var check_y = y;
	if direction == 0 {
		check_x += 5;
	} else if direction == 90 {
		check_y -= 5;
	} else if direction == 180 {
		check_x -= 5;
	} else if direction == 270 {
		check_y += 5;
	}
	var object = instance_place(check_x, check_y, Obj_Solid);
	if object != noone {
		if variable_instance_exists(object, "interact") {
			tutorial_interact = false;
			dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
			dialoguemaster.dialogue_code = @"
				entity_unpause
				player_enable
				new_title tutorial_interact Press Z to interact
				title_setpos tutorial_interact 0 0.3
				title_fadein tutorial_interact 0.5
				pause 3
				title_fadeout tutorial_interact 0.5
			";
			dialoguemaster.dont_freeze = true;
			dialoguemaster.go();
		}
	}
}

if gem_cooldown > 0 {
	gem_cooldown -= 1;
}