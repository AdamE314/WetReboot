
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
			if(burstCount > 0)
			{
				burstTimer--;
				if(burstTimer <= 0){
					var _bullet = instance_create_layer(x,y-12,"Bullets",oBullet);
					var _camx = camera_get_view_x(view_camera[0]);
					var _camw = camera_get_view_width(view_camera[0]);
					audio_listener_position(-(_camx+_camw/2),camera_get_view_y(view_camera[0]),0);
					audio_play_sound_at(sTurretShot,-x,y,0,50,100,1,false,1);
					_bullet.damage = damage;
					_bullet.image_angle = myAngle;
					burstCount--;
					burstTimer = burstDelay
					if(burstCount <= 0)
					{
						burstCount = burstSize;
						fireTimer = fireRate;
					}
				}
				
			}
			
		}

	}
	fireTimer--;
} else {
	myAngle += idleTurnSpeed;
	if(irandom(180) == 1) idleTurnSpeed *= -1;
}




