
myHealth = 3;

takeDamage = function(_damage)
{
	myHealth -= _damage;
	if(myHealth <= 0)
	{
		instance_destroy();
	}
}





path = path_add();

mp_grid_path(global.grid,path,x,y,oPlayer.x,oPlayer.y,1);

path_start(path,1,path_action_stop,1);

