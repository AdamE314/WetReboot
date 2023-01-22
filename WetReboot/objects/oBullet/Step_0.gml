
x += lengthdir_x(mySpeed,image_angle);
y += lengthdir_y(mySpeed,image_angle);

if(place_meeting(x,y,pEnemy))
{
	var _enm = instance_nearest(x,y,pEnemy);
	_enm.takeDamage(damage);
	instance_destroy();
}
if(place_meeting(x,y,pWall))
{
	instance_destroy();
}