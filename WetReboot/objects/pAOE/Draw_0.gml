
draw_sprite_outline(sprite_index,image_index,x,y,1+(oCamera.zoomOut));

if(active)
{
	draw_sprite(sElectricEffect,animation,x,y);
	animation++;
	if(animation >= sprite_get_number(sElectricEffect)) animation = 0;
}