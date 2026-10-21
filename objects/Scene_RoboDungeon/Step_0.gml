if not fight_robo1 {
	if abs(enemy_robo1.y - scene_player.y) <= 128 {
		fight_robo1 = true;
		dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
		dialoguemaster.set_scene(self);
		dialoguemaster.dialogue_code = @"
			robo ^For the queen!^
		";
		dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
		dialoguemaster.ended = function() {
			enemy_robo1.start_battle(scene_player);
			with (enemy_robo1) {
				on_die = function() {
					instance_destroy(unlock_wall1);
				}
			}
		};
		dialoguemaster.go();
		dialoguemaster.unpause();
		enemy_robo1.passive = false;
	}
}

if not fight_robo2 {
	if abs(enemy_robo2.y - scene_player.y) <= 128 {
		fight_robo2 = true;
		dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
		dialoguemaster.set_scene(self);
		dialoguemaster.dialogue_code = @"
			robo ^Statement: I am definitely a robot.^
			c ^What?^
			p ^They're messing with you.^
			p ^Manipulative little buggers.^
		";
		dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
		dialoguemaster.ended = function() {
			enemy_robo2.start_battle(scene_player);
			with (enemy_robo2) {
				on_die = function() {
					instance_destroy(unlock_wall2);
				}
			}
		};
		dialoguemaster.go();
		dialoguemaster.unpause();
		enemy_robo2.passive = false;
	}
}

if not fight_robo3 {
	if abs(enemy_robo3.y - scene_player.y) <= 128 {
		fight_robo3 = true;
		dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
		dialoguemaster.set_scene(self);
		dialoguemaster.dialogue_code = @"
			robo ^Come at me, fleshies!^
			p ^Wow. Can they really say that word?^
			g ^You clanky!^
		";
		dialoguemaster.dialogue_code = string_replace_all(dialoguemaster.dialogue_code, "^", chr(34));
		dialoguemaster.ended = function() {
			enemy_robo3.start_battle(scene_player);
			with (enemy_robo3) {
				on_die = function() {
					instance_destroy(unlock_wall3);
				}
			}
		};
		dialoguemaster.go();
		dialoguemaster.unpause();
		enemy_robo3.passive = false;
	}
}

if scene_player.y < 0 {
	room_goto(Room_VN_3)
} else {
	//Obj_Entity_Gordon.follow = scene_player;
	//Obj_Entity_Phoebe.follow = scene_player;
}