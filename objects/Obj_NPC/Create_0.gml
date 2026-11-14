event_inherited();

attack_pending = noone;
chargetime_min = 1;
chargetime_max = 30;
attack_postcooldown = 10;

retreattime_min = 10;
retreattime_max = 120;

if variable_instance_exists(self, "defence") and defence == 1.0 {
	attack_postcooldown = 1;
	retreattime_min = 20;
	retreattime_max = 40;
	chargetime_max = 10;
}

battle_target = noone;
battle_attack_distance = 64;
battle_charging = false;
battle_state = "idle"; // attack, retreat, fatigued
battle_state_tick = 0;
battle_preferred_attack = Move_Slash;
battle_will_defend = true;

function start_battle(target) {
	battle_target = target;
	battle_state = "attack";
}

function start_wandering() {
	alarm_set(1, random_range(60, 180));
}
