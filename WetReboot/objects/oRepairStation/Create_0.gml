
// Inherit the parent event
event_inherited();

cost = { scrap: 0, compounds: 0 };

reward = { scrap: 0, compounds: 0, progress: 1 };

oneTime = true;

targetSprite = sRepairStationRepaired;

processaudio = sBuildSound;
audio = sJobDone;
giveReward = function()
{
	if(audio != -1) audio_play_sound(audio,1,0);
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
		
		if(instance_exists(oReactor))
		{
			instance_nearest(x,y,oReactor).progress();
		}
	}
}
