
var _canuse = (numUses != 0 || !used);

if(instance_exists(oPlayer) && _canuse)
{
	if(oPlayer.targetInteractable == self)
	{
		var _drawx = x+drawxoffset;
		var _canafford = (global.scrap >= cost.scrap && global.compounds >= cost.compounds);
		
		var _progress = interactionProgress/duration;
		draw_sprite_outline(sprite_index,image_index,x,y);
		shader_set(shWhite);
		draw_sprite_ext(sprite_index,image_index,x,y,
						image_xscale,image_yscale,image_angle,
						c_white,0.5*_progress);
		shader_reset();
		if(keyboard_check(ord("E")) && _canafford && _canuse)
		{
			draw_sprite_outline(sProgress,0,_drawx,y-32);
			draw_sprite_ext(sProgress,1,_drawx-sprite_get_width(sProgress)*(1-_progress)/2,y-32,
							_progress,1,0,c_white,1);
		}
		else 
		{
			if(_canuse)
			{
				align();
				if(cost.scrap > 0) draw_text(_drawx,y-80,"Scrap: "+string(cost.scrap));
				if(cost.compounds > 0) draw_text(_drawx,y-60,"Compounds: "+string(cost.compounds));
				align_reset();
				if(_canafford)
					draw_sprite_outline(sEPrompt,0,_drawx,y-32);
			}
		}
		exit;
	}
}

var _col = (!_canuse) ? c_ltgray : c_white;

draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,_col,image_alpha);
