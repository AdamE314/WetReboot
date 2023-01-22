
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

var _dist = distance_to_object(oPlayer);
if(path_index != -1 && _dist > 300)
{
	path_speed = mySpeed * _dist/300;
}
else path_speed = mySpeed;