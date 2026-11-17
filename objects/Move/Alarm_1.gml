if mover != noone and not instance_exists(mover) { instance_destroy(); return; }
mover.freeze = false;
mover = noone;

instance_destroy();