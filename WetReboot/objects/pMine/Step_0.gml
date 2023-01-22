
// Aiming
if(instance_exists(pEnemy))
{
	var _target = instance_nearest(x,y,pEnemy);
	if(distance_to_object(_target) < detectRange)
		detonating = true;
	if(detonating)
		explodeDelay--;
	if(explodeDelay <= 0)
	{
		var _exp = instance_create_layer(x,y,"Instances",oExplosion);
		_exp.range = damageRange;
		_exp.damage = damage;
		instance_destroy();
	}
}



