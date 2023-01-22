
duration = 60; // in frames

interactionProgress = 0;

cost = { scrap: 0, compounds: 0 };

reward = { scrap: 5, compounds: 1, progress: 0 };

oneTime = false;
used = false;
targetSprite = -1;
drawxoffset = 0;

processaudio = sBuildSound;
audio = -1;
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
		if(reward.scrap > 0 || reward.compounds > 0)
		{
			var _collect = instance_create_layer(x,y,"System",oCollect);
			_collect.scrap = reward.scrap;
			_collect.compounds = reward.compounds;
		}
		interactionProgress = 0;
		used = true;
		if(oneTime && targetSprite != -1) sprite_index = targetSprite;
	}
}
