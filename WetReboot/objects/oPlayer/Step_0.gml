
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
				image_index = 0;
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
		
		var _playsound = false;
		if(targetInteractable != noone)
		{
			var _dist = distance_to_object(targetInteractable);
			targetInteractableDistance = _dist;
			if(_dist > targetInteractableRange || place_meeting(x,y,oDoor))
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
						if(global.scrap >= cost.scrap && global.compounds >= cost.compounds && (!oneTime || !used))
						{
							_playsound = true;
							if(!audio_is_playing(sBuildSound))
							{
								audio_play_sound(sBuildSound,1,1);
							}
							interactionProgress++;
							if(interactionProgress > duration)
							{
								giveReward();
							}
						}
					}
				}
				else
				{
					targetInteractable.interactionProgress = 0;
				}
			}
		}
		
		if(!_playsound && audio_is_playing(sBuildSound))
		{
			audio_stop_sound(sBuildSound);
		}
		if(sprite_index == sPlayerWalk && image_index % 2 == 1)
		{
			audio_play_sound(sMetalFootstep,1,0);
		}
			
		break;
		
	case STATE.SLEEP:
		
		if(audio_is_playing(sBuildSound))
		{
			audio_stop_sound(sBuildSound);
		}
		
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
