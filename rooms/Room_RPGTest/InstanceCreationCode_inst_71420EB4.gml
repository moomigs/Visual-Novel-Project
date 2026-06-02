
saidThanks = false;

function interact() {
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	
	var clownNose = variable_global_exists("clownNose");
	if clownNose and global.clownNose == true {
		if !saidThanks {
			saidThanks = true;
			dialoguemaster.dialogue_code = @"
			name g Gordon

			new_character Gordon
			set_alpha Gordon 100 1
			set_sprite Gordon spr_gordon_1
			set_position Gordon 0 0

			textbox true
			g Aw, thanks bro.
			textbox false
			";
			dialoguemaster.ended = function() {
				sprite_index = spr_entity_Gordon_clownnose;
			}
		} else {
			dialoguemaster.dialogue_code = @"
			name g Gordon

			new_character Gordon
			set_alpha Gordon 100 1
			set_sprite Gordon spr_gordon_1
			set_face Gordon spr_gordon_clown_1
			set_position Gordon 0 0

			textbox true
			g Alright you can go now.
			textbox false
			";
		}
	} else {
		dialoguemaster.dialogue_code = @"
		name g Gordon

		new_character Gordon
		set_alpha Gordon 100 1
		set_sprite Gordon spr_gordon_1
		set_position Gordon 0 0.1

		textbox true
		g Greetmigs.
		slide Gordon 0 0
		g This is my little world.
		pause 1
		slide Gordon -0.1 0
		g Say, have you seen my clown nose?
		slide Gordon 0 0
		g I lost it a while ago. Would you find it for me?
		g Thanks twin.
		textbox false
		";
	}
	
	dialoguemaster.go();
}