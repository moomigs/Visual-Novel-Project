
Arguments in <brackets> are mandatory. Arguments in (parentheses) are optional

Scribble text formatting:
https://www.jujuadams.com/Scribble/#/latest/text-formatting

	COMMANDS:

name <id> <full name>
	ex: 'name j John'
<name id> <dialogue>
	ex: 'j Hello world'
say <text>
	Display dialogue with no name

background <bg_sprite>
	Set background
dissolve <bg_sprite> <seconds>
	Fade to background
textbox <true/false>
	Set textbox visibility
text_speed <speed>
	Set text speed 0 to 1 or higher
autoskip <seconds>
	Start progressing dialogue automatically. Set to -1 to stop
pause (seconds)

new_character <id>
set_sprite <id> <sprite>
set_alpha <id> <alpha> (interpolation)
	Set alpha of a character. Interpolation 0 to 1 per frame, default 1
set_position <id> <x> <y>
	(0, 0) = Center, (-1, -1) = Top left
set_scale <id> <scale>
set_face <id> <sprite>
	Set sprite overlay of a character
slide <id> <x> <y>
	Slide character position

new_title <id> <text>
	Create title object
title_setpos <id> <x> <y>
	(0, 0) = Center, (-1, -1) = Top left
title_setscale <id> <scale>
title_fadein <id> <seconds>
title_fadeout <id> <seconds>

play_sound <sound> (fade time)
	Play sound once
loop_sound <sound> (fade time)
	Start looping sound
set_sound_loop <sound> <start> <end>
	Set loop region of a sound
set_sound_time <sound> <time>
	Set track time position of a sound
set_sound_volume <sound> <volume>
set_sound_pitch <sound> <pitch>
stop_sound <sound> (fade time)

choice [choice1] [choice2]
	Initiate a choice selection. Must use brackets around choices
	ex: 'choice [Yes] [No]'
case <number> <node id>
	Designate a node to a selection.
	ex: 'case 0 yes'
goto <node id>
	Go to node. Use for choice selection node jumping.
	
node <id>
	Node ID can be number or string
skipto <id>
	Skip to node. Do not use for choice selection node jumping.

goto_room <room>

call <function>
	Execute global function
script <script>
	Execute script

# comment