Visual novel engine commands:

name <id> <Full Name>

background <bg_sprite>
dissolve <bg_sprite> <seconds>
textbox <true/false>
text_speed <frames per letter>
autoskip <seconds>
pause (seconds)

new_title <id> <text>
title_setpos <id> <x> <y>
title_setscale <id> <scale>
title_fadein <id> <seconds>
title_fadeout <id> <seconds>

play_sound <sound>
loop_sound <sound>
set_sound_loop <sound> <start> <end>
set_sound_volume <sound> <volume>
set_sound_pitch <sound> <pitch>
sound_time <sound> <time>
stop_sound <sound>

new_character <character_name>
set_sprite <character_name> <sprite>
set_position <character_name> <x> <y>
set_face <character_name> <sprite>
set_alpha <character_name> <alpha 0-1> <interp>
slide <character_name> <x> <y>

goto_room <room>

node <int>
skipto <int>

<id> <dialogue>
# comment