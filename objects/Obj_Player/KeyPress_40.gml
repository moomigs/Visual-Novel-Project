if call_menu_open != false and variable_global_exists("link") {
	var _len = array_length(global.link);
	call_menu_open = (((call_menu_open - 2) mod _len + _len) mod _len) + 1;
	return;
}

if defending { return; }
if freeze { return; }
if attack_pending { return; }

var attack = instance_create_depth(x, y, depth, Move_Slash);
attack.mover = self;
attack.set_direction(direction);

attack_pending = attack;
attack.charge();