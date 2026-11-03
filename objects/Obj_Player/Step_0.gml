event_inherited();

if !attacking and !freeze {
	defending = keyboard_check(vk_lcontrol);
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