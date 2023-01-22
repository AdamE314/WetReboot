
if(!instance_exists(pEnemy)) exit;

with(pEnemy)
{
	if(distance_to_object(oExplosion) < oExplosion.range)
	{
		takeDamage(oExplosion.damage);
	}
}

instance_destroy();
