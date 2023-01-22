
if(scrap > 0)
{
	for(var i=0;i<scrap;i++)
	{
		draw_sprite_ext(spr_scrap_icon,0,x+(-scrap*8+i*16)*image_xscale,y-24,image_xscale,image_xscale,0,c_white,1);
	}
}

if(compounds > 0)
{
	for(var i=0;i<compounds;i++)
	{
		draw_sprite_ext(spr_compound_icon,0,x-compounds*8+i*16,y-8,image_xscale,image_xscale,0,c_white,1);
	}
}