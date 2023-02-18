
duration = 60; // in frames

interactionProgress = 0;

cost = { scrap: 0, compounds: 0 };

reward = { scrap: 5, compounds: 1, progress: 0, hp_x5: 0, energy_x5: 0 };

//numUses = -1; -1 means infinite, moved to variable definitions
used = false;
targetSprite = -1;
drawxoffset = 0;

processaudio = sBuildSound;
audio = -1;
giveReward = function()
{
	if(audio != -1) audio_play_sound(audio,1,0);
	if(numUses != 0 || !used)
	{
		global.scrap += reward.scrap;
		global.compounds += reward.compounds;
		global.progress += reward.progress;
		global.health = clamp(global.health + reward.hp_x5*global.healthmax/5,0,global.healthmax);
		global.energy = clamp(global.energy + reward.energy_x5*global.energymax/5,0,global.energymax);
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
		numUses--;
		numUses = clamp(numUses,-1,100);
		if(numUses == 0 && targetSprite != -1) sprite_index = targetSprite;
	}
}
