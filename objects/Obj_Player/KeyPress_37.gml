if defending { return; }
if freeze { return; }
if attack_pending { return; }
if attacking_disabled { return; }
if not can_stab { return; }

var attack = instance_create_depth(x, y, depth, Move_Stab);
attack.mover = self;
attack.go(direction);