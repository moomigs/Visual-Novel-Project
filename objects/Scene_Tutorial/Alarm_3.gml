collins.can_stab = true;

var waitfor = instance_create_depth(0,0,0,Waitfor)
waitfor.waitfor_instance(Move_Stab);
waitfor.done = function() {
	collins_stab = true;
}