if defending { return; }
if freeze { return; }
if attack_pending { return; }

var attack = instance_create_depth(x, y, depth, Move_Shoot);
attack.mover = self;
attack.go(direction);