
switch(global.state)
{
	case STATE.FREE:
		
		// Building buildings
		if(buildMode == -1)
		{
			var _camx = camera_get_view_x(view_camera[0]);
			var _camy = camera_get_view_y(view_camera[0]);
			var _camw = camera_get_view_width(view_camera[0]);
			var _camh = camera_get_view_height(view_camera[0]);
			var _tilesizew = 48;
			var _tilesizeh = 48;
			var _tilespace = 16;
			for(var i=0;i<array_length(buildings);i++)
			{
				if(buildings[i].enabled)
				{
					var _canafford = (global.scrap >= buildings[i].scrap) && (global.compounds >= buildings[i].compounds)
					var _buttonx = _camx+_camw-(_tilesizew+_tilespace); var _buttony = _camy+48+i*(_tilesizeh+_tilespace);
					if(_canafford && mouse_x == clamp(mouse_x,_buttonx,_buttonx+_tilesizew) && mouse_y == clamp(mouse_y,_buttony,_buttony+_tilesizeh))
					{
						buildings[i].mouse = 1;
						if(mouse_check_button_pressed(mb_left))
						{
							buildMode = i;
						}
						if(mouse_check_button(mb_left)) buildings[i].mouse = 2;
					}
					else
					{
						buildings[i].mouse = 0;
					}
				}
			}
		}
		else
		{
			// Build mode
			if(mouse_check_button_pressed(mb_left))
			{
				var _snapx = mouse_x - (mouse_x%32) + buildings[buildMode].origin[0];
				var _snapy = mouse_y - (mouse_y%32) + buildings[buildMode].origin[1];
				if(buildCheckTile(_snapx,_snapy,sTurretHitbox))
				{
					build(_snapx,_snapy);
				}
				else
				{
					// Something was in the way
				}
			}
			if(mouse_check_button_pressed(mb_right))
			{
				buildMode = -1;
			}
		}
		
		// State transition
		if(!rebooting) global.energy--;
		if(global.energy <= 0 && !rebooting)
		{
			enterSleep();
		}
		
		break;
	
	case STATE.SLEEP:
		if(global.enterFree)
		{
			global.enterFree = false;
			enterFree();
		}
		break;
}


global.energy += energyrefill;
if(global.energy > global.energymax) 
{
	global.energy = global.energymax;
	energyrefill = 0;
}

