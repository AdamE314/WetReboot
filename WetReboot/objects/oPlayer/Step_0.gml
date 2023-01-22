
switch(global.state)
{
	case STATE.FREE:
		
		if(!wakeup) exit;
		
		if(sprite_index == hibernateSprite)
		{
			image_speed = -1;
			if(image_index < 1)
			{
				sprite_index = standSprite;
			}
			exit;
		}
		// Movement
		var _hin = input_check("right")-input_check("left");
		var _vin = input_check("down")-input_check("up");

		var _hmov = walkSpeed * _hin; var _vmov = walkSpeed * _vin;
		
		image_speed = 1;
		sprite_index = (_hmov == 0 && _vmov == 0) ? standSprite : walkSprite;
		image_xscale = (_hmov != 0) ? sign(_hmov) : image_xscale;

		move_perfect(_hmov,_vmov,pWall);
		
		// Interaction
		var _iin = input_check("interact");
		
		if(targetInteractable != noone)
		{
			var _dist = distance_to_object(targetInteractable);
			targetInteractableDistance = _dist;
			if(_dist > targetInteractableRange)
			{
				targetInteractable = noone;
				targetInteractableDistance = -1;
			}
			else
			{
				if(_iin)
				{
					with(targetInteractable)
					{
						interactionProgress++;
						if(interactionProgress > duration)
						{
							giveReward();
						}
					}
				}
				else
				{
					targetInteractable.interactionProgress = 0;
				}
			}
		}
			
		break;
		
	case STATE.SLEEP:
	
		if(sprite_index != hibernateSprite)
		{
			sprite_index = hibernateSprite;
			image_index = 0;
		}
		else
		{
			if(image_index == 3)
			{
				image_speed = 0;
				image_index = 3;
			}
		}
		targetInteractable = noone;
		targetInteractableDistance = -1;
}
