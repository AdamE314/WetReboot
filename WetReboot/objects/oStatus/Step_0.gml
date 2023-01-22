
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


if(spawning)
{
	var _list = enemySpawnLists[global.progress];
	if(spawnIndex < array_length(_list))
	{
		spawningTimer--;
		if(spawningTimer <= 0)
		{
			for(var i=0;i<_list[spawnIndex].count;i++)
			{
				var _sp = _list[spawnIndex].spawnpoint;
				var _spawndir = i*360/_list[spawnIndex].count;
				var _xoff = lengthdir_x(32,_spawndir); var _yoff = lengthdir_y(32,_spawndir);
				instance_create_layer(spawnPoints[_sp].spawnX+_xoff,spawnPoints[_sp].spawnY+_yoff,"Instances",_list[spawnIndex].enemy);
			}
			spawningTimer = spawningDelay;
			spawnIndex++;
		}
	}
	else
	{
		if(!instance_exists(pEnemy))
		{
			global.enterFree = true;
			spawnIndex = 0;
			spawning = false;
		}
	}
}


