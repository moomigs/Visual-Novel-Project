lines = [];
current_line = -1;

display_final = "";
display = "";
display_name = "";

name_scribble = scribble("");
display_scribble = scribble("");
typist = scribble_typist();
typist.in(1, 0);

textbox_visible = false;
history = [];

// tidy up scribble implementation
// name colors

// choice selection
// text box input
// variables/ global variables
// run script

// menu function?

auto_skip = -1;

frame_count = 0;
text_speed = 1;

active = false;
working = false;
paused = false;
skippingto = -1;

background = noone;
background_dissolving = 0;
background_dissolving_final = 0;

titles = {};
characters = {};
names = {};
buttons = [];

padding = 20;

function next_line() {
	if display != display_final {
		display = display_final;
		return;
	}
	working = false;
	current_line ++;
	if array_length(lines) <= current_line {
		show_debug_message("EOF");
		instance_destroy();
	} else {
		lines[current_line] = string_trim_start(lines[current_line]);
		show_debug_message(string(current_line) + " " + lines[current_line]);
		display_final = "";
		display = "";
		display_name = "";
		var arguments = string_split(lines[current_line], " ")
		var command = arguments[0]
		working = true;
		if lines[current_line] == "" {
			//blank line
			next_line();
		} else if command == "background" {
			var arg = arguments[1];
			var bg = asset_get_index(arg);
		
			var lay_id = layer_get_id("Background_Top");
			var back_top = layer_background_get_id(lay_id);
			layer_background_alpha(back_top, 1);
			layer_background_blend(back_top, c_white);
			layer_background_sprite(back_top, bg);
		
			next_line();
		} else if command == "dissolve" {
			var arg = arguments[1];
			var arg_time = real(arguments[2]);
			var bg = asset_get_index(arg);
			
			var lay_top = layer_get_id("Background_Top");
			var lay_bottom = layer_get_id("Background_Bottom");
			
			var back_top = layer_background_get_id(lay_top);
			var back_bottom = layer_background_get_id(lay_bottom);
			
			if layer_background_get_sprite(back_top) != -1 {
				layer_background_alpha(back_bottom, 1);
				layer_background_blend(back_bottom, c_white);
				layer_background_sprite(back_bottom, layer_background_get_sprite(back_top));
			}
			
			layer_background_alpha(back_top, 0);
			layer_background_blend(back_top, c_white);
			layer_background_sprite(back_top, bg);
			
			background_dissolving_final = arg_time*game_get_speed(gamespeed_fps);
			background_dissolving = 0;
		
			next_line();
		} else if command == "textbox" {
			var arg1 = bool(arguments[1]);
			textbox_visible = arg1;
			
			next_line();
		} else if command == "text_speed" {
			var arg1 = real(arguments[1]);
			text_speed = arg1;
			
			next_line();
		} else if command == "autoskip" {
			var arg1 = real(arguments[1]);
			auto_skip = arg1;
			
			next_line();
		} else if command == "name" {
			var arg1 = arguments[1];
			var name = string_copy(lines[current_line], string_length(command)+1+string_length(arg1)+2, 100);
			//var arg2 = arguments[2];
			names[$ arg1] = name;
			
			next_line();
		} else if command == "new_title" {
			var arg = arguments[1];
			var text = string_copy(lines[current_line], string_length(command)+1+string_length(arg)+2, 255);
			
			var new_title = instance_create_depth(0, 0, 1, Obj_TitleText);
			new_title.text = text;
			titles[$ arg] = new_title;
			
			next_line();
		} else if command == "title_setpos" {
			var arg = arguments[1];
			var pos_x = real(arguments[2]);
			var pos_y = real(arguments[3]);
			
			titles[$ arg].set_position(pos_x, pos_y);
			
			next_line();
		} else if command == "title_setscale" {
			var arg = arguments[1];
			var scale = real(arguments[2]);
			
			titles[$ arg].scale = scale;
			
			next_line();
		} else if command == "title_fadein" {
			var arg = arguments[1];
			var fade_time = real(arguments[2]);
			
			titles[$ arg].fade_time = fade_time;
			titles[$ arg].fade_in();
			
			next_line();
		} else if command == "title_fadeout" {
			var arg = arguments[1];
			var fade_time = real(arguments[2]);
			
			titles[$ arg].fade_time = fade_time;
			titles[$ arg].fade_out();
			
			next_line();
		} else if command == "play_sound" {
			var arg = arguments[1];
			var sound = asset_get_index(arg);
			var fade = 0;
			if array_length(arguments)>2 {
				fade = real(arguments[2]);
			}
			var gain = audio_sound_get_gain(sound);
			audio_sound_gain(sound, 0);
			audio_play_sound(sound, 1, false);
			audio_sound_gain(sound, gain, fade*1000);
			
			next_line();
		} else if command == "loop_sound" {
			var arg = arguments[1];
			var sound = asset_get_index(arg);
			var fade = 0;
			if array_length(arguments)>2 {
				fade = real(arguments[2]);
			}
			var gain = audio_sound_get_gain(sound);
			audio_sound_gain(sound, 0);
			audio_play_sound(sound, 1, true);
			audio_sound_gain(sound, gain, fade*1000);
			
			next_line();
		} else if command == "set_sound_loop" {
			var arg = arguments[1];
			var start = real(arguments[2]);
			var stop = real(arguments[3]);
			var sound = asset_get_index(arg);
			audio_sound_loop_start(sound, start);
			audio_sound_loop_end(sound, start);
			
			next_line();
		} else if command == "set_sound_volume" {
			var arg = arguments[1];
			var gain = real(arguments[2]);
			var sound = asset_get_index(arg);
			audio_sound_gain(sound, gain);
			
			next_line();
		} else if command == "set_sound_pitch" {
			var arg = arguments[1];
			var pitch = real(arguments[2]);
			var sound = asset_get_index(arg);
			audio_sound_pitch(sound, pitch);
			
			next_line();
		} else if command == "sound_time" {
			var arg = arguments[1];
			var start = real(arguments[2]);
			var sound = asset_get_index(arg);
			audio_sound_set_track_position(sound, start);
			
			next_line();
		} else if command == "stop_sound" {
			var arg = arguments[1];
			var sound = asset_get_index(arg);
			var fade = real(arguments[2]);
			audio_sound_gain(sound, 0, fade*1000);
			sound_stop = sound;
			alarm_set(2, fade*game_get_speed(gamespeed_fps)+2)
			
			next_line();
		} else if command == "new_character" {
			var arg = arguments[1];
			var new_character = instance_create_depth(display_get_gui_width()/2, display_get_gui_height()/2, -1, Obj_Character);
			characters[$ arg] = new_character;
			
			next_line();
		} else if command == "set_sprite" {
			var arg1 = arguments[1];
			var arg2 = arguments[2];
			var character = characters[$ arg1];
			character.sprite_index = asset_get_index(arg2);
			
			next_line();
		} else if command == "set_position" {
			var arg1 = arguments[1];
			var arg_x = real(arguments[2]);
			var arg_y = real(arguments[3]);
			
			var character = characters[$ arg1];
			character.x = display_get_gui_width()/2 + arg_x*display_get_gui_width()/2;
			character.y = display_get_gui_height()/2 - arg_y*display_get_gui_height()/2;
			character.slide_x = arg_x;
			character.slide_y = arg_y;
			
			next_line();
		} else if command == "set_face" {
			var arg1 = arguments[1];
			var arg2 = arguments[2];
			var character = characters[$ arg1];
			if arg2 == "default" {
				character.face = -1;
			} else {
				character.face = asset_get_index(arg2);
			}
			
			next_line();
		} else if command == "set_alpha" {
			var arg1 = arguments[1];
			var arg_alpha = real(arguments[2]);
			var arg_time = real(arguments[3]);
			
			var character = characters[$ arg1];
			character.desired_alpha = arg_alpha;
			character.alpha_slide = arg_time;
			
			next_line();
		} else if command == "slide" {
			var arg1 = arguments[1];
			var arg_x = real(arguments[2]);
			var arg_y = real(arguments[3]);
			var character = characters[$ arg1];
			
			character.slide_x = arg_x;
			character.slide_y = arg_y;
			
			next_line();
		} else if command == "pause" {
			if skippingto {
				next_line();
			} else {
				if array_length(arguments)>1 and real(arguments[1]) != 0 {
					paused = true;
					alarm_set(0, real(arguments[1])*game_get_speed(gamespeed_fps));
				}
			}
		} else if command == "goto_room" {
			room_goto(asset_get_index(arguments[1]));
		} else if command == "skipto" {
			if skippingto == -1 {
				var arg = real(arguments[1]);
				skippingto = arg;
			}
			
			next_line();
		} else if command == "node" {
			var arg = real(arguments[1]);
			if arg == skippingto {
				skippingto = -1;
			}
			
			next_line();
		} else if command == "#" or string_copy(command,0,1)=="#" {
			//nothing
			next_line();
		} else if command == "call" {
			//function
			var arg = arguments[1];
			variable_global_get(arg)();
			
			next_line();
		} else {
			working = false;
			if is_string(names[$ command]) or command == "say" {
				if skippingto == -1 {
					//only display these lines
					cmd_length = string_length(command)+1;
					display_final = string_copy(lines[current_line], cmd_length+1, string_length(lines[current_line])-cmd_length);
					display_scribble = scribble(display_final);
					if command == "say" {
						display_name = "";
						array_push(history, display_final);
					} else {
						display_name = names[$ command];
						array_push(history, display_name + ": " + display_final);
					}
					name_scribble = scribble(display_name);
				} else {
					next_line();	
				}
			} else {
				show_error(" \n\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n\tUnable to interpret... \n\t"+lines[current_line]+"\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n\n ", true);
			}
		}

	}
}

function input() {
	if active and !paused and !working {
		next_line();
	}
}

function go() {
	if instance_exists(Obj_Player) {
		Obj_Player.freeze = true;
	}
	alarm_set(1, 10);
}