
if(x < lastx)
{
	image_xscale = -1;
} else {
	image_xscale = 1;
}

if(place_meeting(x,y,oPlayer))
{
	global.health -= damage;
	instance_destroy();
}