
// Aiming
if(instance_exists(pEnemy))
{
	global.currentaoe = self;
	var _target = instance_nearest(x,y,pEnemy);
	if(distance_to_object(_target) < range)
	{
		with(pEnemy)
		{
			if(distance_to_object(global.currentaoe) < global.currentaoe.range)
			{
				takeDamage(global.currentaoe.damage);
			}
		}
	}
}




