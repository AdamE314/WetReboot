
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
		var _anim = instance_create_layer(x,y,"Instances",oAnimation);
		_anim.sprite_index = sMineExplode;
		audio_play_sound(snExplode,1,0);
		instance_destroy();
	}
}



