
myHealth = 3;
mySpeed = 2;
damage = 1;
lastx = x;

takeDamage = function(_damage)
{
	myHealth -= _damage;
	if(myHealth <= 0)
	{
		instance_destroy();
	}
}


startPathing = function()
{
	path = path_add();
	mp_grid_path(global.grid,path,x,y,oPlayer.x,oPlayer.y,1);
	path_start(path,mySpeed,path_action_stop,1);
}
