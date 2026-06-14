if defending { return; }
if freeze { return; }
var attack = instance_create_depth(x, y, depth, Move_Slash);
attack.mover = self;
attack.set_direction(direction);
attack.go();