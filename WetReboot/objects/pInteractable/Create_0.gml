
duration = 60; // in frames

interactionProgress = 0;

cost = { scrap: 0, compounds: 0 };

reward = { scrap: 5, compounds: 1, progress: 0 };

oneTime = true;
used = false;

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
	}
}
