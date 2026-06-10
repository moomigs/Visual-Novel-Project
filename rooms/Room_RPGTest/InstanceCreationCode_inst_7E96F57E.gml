

function interact() {
	audio_sound_gain(snd_gordontalk, 3);
	audio_sound_pitch(snd_gordontalk, 1.5);
	freeze = true;
	dialoguemaster = instance_create_depth(x, y, -2, Obj_DialogueMaster);
	dialoguemaster.dialogue_code = @"
		name ? NPC
		textbox true
		? [typistSoundPerChar,snd_gordontalk,.9,1]Hello twin.
		? [typistSoundPerChar,snd_gordontalk,.9,1]What a splendid little place this is.[delay,400] Don't you agree?
		choice [Yes] [No]
			case 0 yes
			case 1 no
			
			node yes
			? [typistSoundPerChar,snd_gordontalk,.9,1]Ahaha yes...
			goto end
			
			node no
			? [typistSoundPerChar,snd_gordontalk,.9,1]Hmm... Okay...
			goto end
		node end
		textbox false
	";
	dialoguemaster.ended = function() {
		freeze = false;
	}
	dialoguemaster.go();
}