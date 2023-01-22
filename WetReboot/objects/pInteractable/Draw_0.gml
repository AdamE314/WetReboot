
draw_text(x,y-24,string(distance_to_object(oPlayer))+", "+string(oPlayer.targetInteractableDistance));

if(instance_exists(oPlayer))
{
	if(oPlayer.targetInteractable == self)
	{
		var _progress = interactionProgress/duration;
		draw_sprite_outline(sprite_index,image_index,x,y);
		shader_set(shWhite);
		draw_sprite_ext(sprite_index,image_index,x,y,
						image_xscale,image_yscale,image_angle,
						c_white,0.5*_progress);
		shader_reset();
		if(input_check("interact"))
		{
			draw_sprite_outline(sProgress,0,x,y-32);
			draw_sprite_ext(sProgress,1,x-sprite_get_width(sProgress)*(1-_progress)/2,y-32,
							_progress,1,0,c_white,1);
		}
		else 
		{
			draw_sprite_outline(sEPrompt,0,x,y-32);
		}
		exit;
	}
}

draw_self();
