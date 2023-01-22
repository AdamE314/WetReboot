
myHealthMax = 3;
myHealth = myHealthMax;
mySpeed = 2;
damage = 1;
lastx = x;

takeDamage = function(_damage, _playsound = true)
{
	myHealth -= _damage;
	if(myHealth <= 0)
	{
		instance_destroy();
	}
	if(_playsound) audio_play_sound(snImpact,1,0);
}


startPathing = function()
{
	path = path_add();
	mp_grid_path(global.grid,path,x,y,oPlayer.x,oPlayer.y,1);
	path_start(path,mySpeed,path_action_stop,1);
}
