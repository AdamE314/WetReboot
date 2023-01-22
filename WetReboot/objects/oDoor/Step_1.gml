
if(!instance_exists(oPlayer)) exit;

switch(global.state)
{
	case STATE.FREE:
		var _dist = distance_to_object(oPlayer);
		if(_dist < oPlayer.targetInteractableRange)
		{
			if(oPlayer.targetInteractable == noone || oPlayer.targetInteractableDistance > _dist)
			{
				oPlayer.targetInteractable = self;
				oPlayer.targetInteractableDistance = _dist;
			}
		}
		break;
	
	case STATE.SLEEP:
		interactionProgress = 0;
		break;
}

if(open)
{
	image_index = 1;
}
else
{
	image_index = 0;
}