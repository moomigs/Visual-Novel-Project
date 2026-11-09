if call_menu_open != false and variable_global_exists("link") {
	call_menu_open = (call_menu_open mod array_length(global.link)) + 1;
	return;
}

if defending { return; }
if freeze { return; }
if attack_pending { return; }
if attacking_disabled { return; }
if not can_shoot { return; }

var attack = instance_create_depth(x, y, depth, Move_Shoot);
attack.mover = self;
attack.go(direction);