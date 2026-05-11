lines = [];
display_final = "";
display = "";
display_name = "";

working = false;
paused = false;

background = noone;
background_dissolving = 0;
background_dissolving_final = 0;

characters = {};
names = {};

textbox_x = room_width / 2 - sprite_get_width(Sprite1) / 2;
textbox_y = room_height - sprite_get_height(Sprite1) - 20;
padding = 20;

if (file_exists("test.txt")) {
    var _file = file_text_open_read("test.txt");
	var i = 0;
	while (!file_text_eof(_file))
	{
	    var s = file_text_read_string(_file);
		lines[i] = s;
	    file_text_readln(_file);
		i ++;
	}
	file_text_close(_file);
}

current_line = -1;

function next_line() {
	if display != display_final {
		display = display_final;
		return;
	}
	working = false;
	current_line ++;
	show_debug_message(current_line);
	if array_length(lines) <= current_line {
		show_debug_message("EOF");
		instance_destroy();
	} else {
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
			
			show_debug_message(layer_background_get_sprite(back_top) == -1);
			if layer_background_get_sprite(back_top) != -1 {
				layer_background_alpha(back_bottom, 1);
				layer_background_blend(back_bottom, c_white);
				layer_background_sprite(back_bottom, layer_background_get_sprite(back_top));
			}
			
			layer_background_alpha(back_top, 0);
			layer_background_blend(back_top, c_white);
			layer_background_sprite(back_top, bg);
			
			background_dissolving_final = arg_time*fps;
			background_dissolving = 0;
		
			next_line();
		} else if command == "name" {
			var arg1 = arguments[1];
			var name = string_copy(lines[current_line], string_length(command)+1+string_length(arg1)+2, 100);
			//var arg2 = arguments[2];
			names[$ arg1] = name;
			
			next_line();
		} else if command == "new_character" {
			var arg = arguments[1];
			var new_character = instance_create_depth(room_width/2, room_height/2, 0, Obj_Character);
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
			character.x = room_width/2 + arg_x*room_width/2;
			character.y = room_height/2 - arg_y*room_height/2;
			character.slide_x = character.x;
			character.slide_y = character.y;
			
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
			character.slide_x = room_width/2 + arg_x*room_width/2;
			character.slide_y = room_height/2 - arg_y*room_height/2;
			
			next_line();
		} else if command == "pause" {
			if array_length(arguments)>1 and real(arguments[1]) != 0 {
				paused = true;
				alarm_set(0, real(arguments[1])*fps);
			}
		} else if command == "goto_room" {
			room_goto(asset_get_index(arguments[1]));
		} else if command == "#" {
			//nothing
			next_line();
		} else {
			working = false;
			if is_string(names[$ command]) {
				//only display these lines
				display_name = names[$ command];
				cmd_length = string_length(command)+1;
				display_final = string_copy(lines[current_line], cmd_length+1, string_length(lines[current_line])-cmd_length);
			} else {
				show_error("Unable to interpret... "+lines[current_line], true);
			}
		}
	}
}

alarm_set(0, 60);