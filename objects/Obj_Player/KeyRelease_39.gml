if attack_pending != noone and attack_pending.object_index = Move_Heavy {
	attack_pending.go(direction);
	attack_pending = noone;
}