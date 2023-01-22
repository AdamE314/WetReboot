draw_sprite_outline(sprite_index,image_index,x,y,2,image_xscale);

var _progress = myHealth/myHealthMax;
draw_sprite_outline(sProgress,0,x,y-32);
draw_sprite_ext(sProgress,1,x-sprite_get_width(sProgress)*(1-_progress)/2,y-32,
				_progress,1,0,c_red,1);