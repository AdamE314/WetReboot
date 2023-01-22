
// Aiming
if(instance_exists(pEnemy))
{
	var _target = instance_nearest(x,y,pEnemy);
	if(distance_to_object(_target) < range)
	{
		var _targetangle = point_direction(x,y,_target.x,_target.y);
		var _anglediff = _targetangle-myAngle;
		if(abs(_targetangle-myAngle) > turnSpeed)
		{
			if(abs(_anglediff) > 180)
			{
				_anglediff -= sign(_anglediff)*360;
			}
			myAngle += sign(_anglediff)*turnSpeed;
		}
		else 
		{
			myAngle = _targetangle;
		}
		
		if(fireTimer <= 0)
		{
			fireTimer = fireRate;
			var _bullet = instance_create_layer(x,y,"Instances",oBullet);
			audio_listener_position(-oPlayer.x,oPlayer.y,0);
			audio_play_sound_at(sfx_turretshot,-x,y,0,50,100,1,false,1);
			_bullet.damage = damage;
			_bullet.image_angle = myAngle;
		}

	}
	fireTimer--;
}




