/// @description Insert description here
// You can write your code in this editor





// Inherit the parent event
event_inherited();

var _dist = distance_to_object(oPlayer);
if(path_index != -1 && _dist > 300)
{
	path_speed = mySpeed * _dist/300;
}
else path_speed = mySpeed;