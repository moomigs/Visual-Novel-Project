collins.can_shoot = true;
child.passive = false;

var waitfor = instance_create_depth(0,0,0,Waitfor)
waitfor.waitfor_instance(Move_Shoot);
waitfor.done = function() {
	collins_shoot = true;
	collins.can_shoot = false;
	child.passive = true;
}