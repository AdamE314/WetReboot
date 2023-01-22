
// Inherit the parent event
event_inherited();

cost = { scrap: 0, compounds: 0 };

reward = { scrap: 0, compounds: 0, progress: 1 };

oneTime = true;

targetSprite = sRepairStationRepaired;

giveReward = function()
{
	if(!oneTime || !used)
	{
		global.scrap += reward.scrap;
		global.compounds += reward.compounds;
		global.progress += reward.progress;
		global.scrap -= cost.scrap;
		global.compounds -= cost.compounds;
		interactionProgress = 0;
		used = true;
		if(oneTime && targetSprite != -1) sprite_index = targetSprite;
		
		oStatus.makeProgress();
		if(instance_exists(oReactor))
		{
			instance_nearest(x,y,oReactor).progress();
		}
	}
}
