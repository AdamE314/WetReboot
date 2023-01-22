
walkSpeed = 4;

if(instance_exists(oCamera))
{
	oCamera.setFollowTarget(self,0,-16);
}

targetInteractableRange = 32;
targetInteractable = noone;
targetInteractableDistance = -1;

walkSprite = sPlayerWalk;
standSprite = sPlayerStand;
hibernateSprite = sPlayerHibernate;
image_speed = 1;