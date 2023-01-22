x = lerp(x,goalx,0.05+0.05*collecting);
y = lerp(y,goaly,0.05+0.05*collecting);
if(point_distance(x,y,goalx,goaly) < 4)
{
	if(!collecting)
	{
		goalx = oPlayer.x;
		goaly = oPlayer.y;
		collecting = true;
	}
}

if(collecting)
{
	goalx = oPlayer.x;
	goaly = oPlayer.y;
	image_xscale = lerp(image_xscale,0,0.1);
	if(image_xscale <= 0.1) instance_destroy();
}