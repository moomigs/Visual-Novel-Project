random_set_seed(current_time);
npc1.start_battle(player);
npc1.on_die = function() { room_restart(); }
player.on_die = function() { room_restart(); }