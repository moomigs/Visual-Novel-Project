event_inherited();

attack_pending = noone;
chargetime_min = 1;
chargetime_max = 30;
attack_postcooldown = 10;

retreattime_min = 10;
retreattime_max = 120;

battle_target = noone;
battle_attack_distance = 64;
battle_charging = false;
battle_state = "idle"; // attack, retreat, fatigued
battle_state_tick = 0;

function start_battle(target) {
	battle_target = target;
	battle_state = "attack";
}

function start_wandering() {
	alarm_set(1, 40);
}
