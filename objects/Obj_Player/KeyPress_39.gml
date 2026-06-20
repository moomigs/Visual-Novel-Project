if defending { return; }
if freeze { return; }
if attack_pending { return; }

var attack = instance_create_depth(x, y, depth, Move_Heavy);
attack.mover = self;
attack.set_direction(direction);

attack_pending = attack;
attack.charge();