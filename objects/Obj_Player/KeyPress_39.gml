if defending { return; }
if freeze { return; }
if attack_pending { return; }
if attacking_disabled { return; }
if not can_heavy { return; }

if heavy_cooldown > 0 { return; }

var attack = instance_create_depth(x, y, depth, Move_Heavy);
attack.mover = self;
attack.set_direction(direction);

heavy_cooldown = attack.COOLDOWN_PERIOD;

attack_pending = attack;
attack.charge();