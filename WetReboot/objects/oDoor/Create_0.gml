event_inherited();

drawxoffset = 16;
myWall = instance_create_layer(x,y,"Walls",pWall);
open = true;
instance_deactivate_object(myWall);

cost = { scrap: 1, compounds: 0 };

reward = { scrap: 0, compounds: 0, progress: 0 };

duration = 200;

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
		if(open)
		{
			instance_activate_object(myWall);
		} else {
			instance_deactivate_object(myWall);
		}
		oPathfindingSetup.recreateGrid();
		open = !open;
	}
}