collins.can_slash = true;

var waitfor = instance_create_depth(0,0,0,Waitfor)
waitfor.waitfor_instance(Move_Slash, "discharge", true);
waitfor.done = function() {
	collins_slash = true;
}