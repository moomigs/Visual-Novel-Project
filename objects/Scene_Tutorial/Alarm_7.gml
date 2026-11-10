collins.can_heavy = true;

var waitfor = instance_create_depth(0,0,0,Waitfor)
waitfor.waitfor_instance(Move_Heavy, "discharge", true);
waitfor.done = function() {
	collins_heavy = true;
}