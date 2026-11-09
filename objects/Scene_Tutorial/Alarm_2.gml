collins.can_defend = true;

var waitfor = instance_create_depth(0,0,0,Waitfor)
waitfor.waitfor(collins, "defending", true);
waitfor.done = function() {
	collins_defend = true;
}