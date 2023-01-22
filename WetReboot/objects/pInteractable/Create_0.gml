
duration = 60; // in frames

interactionProgress = 0;

reward = { scrap: 5, compounds: 1 }

giveReward = function()
{
	global.scrap += reward.scrap;
	global.compounds += reward.compounds;
	interactionProgress = 0;
}
