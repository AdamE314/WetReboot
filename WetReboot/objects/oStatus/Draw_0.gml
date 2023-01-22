
var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _camw = camera_get_view_width(view_camera[0]);
var _camh = camera_get_view_height(view_camera[0]);

draw_sprite_outline(spr_scrap_icon,0,_camx+16,_camy+16);
draw_text_outline(_camx + 40, _camy + 18, string(global.scrap));
draw_sprite_outline(spr_compound_icon,0,_camx+20,_camy+34);
draw_text_outline(_camx + 40, _camy + 36, string(global.compounds));

draw_sprite_outline(sEnergyBar,0,_camx+24,_camy+192);
draw_sprite_ext(sEnergyBar,1,_camx+24,_camy+192,1,global.energy/global.energymax,0,merge_color(c_yellow,c_ltgray,0.5),1);

draw_sprite_outline(sEnergyBar,0,_camx+24,_camy+320);
draw_sprite_ext(sEnergyBar,1,_camx+24,_camy+320,1,max(0,global.health/global.healthmax),0,merge_color(c_lime,c_ltgray,0.5),1);

for(var i=0;i<array_length(buildings);i++)
{
	if(buildings[i].enabled)
	{
		var _buttonx = _camx+_camw-(tilesizew+tilespace); var _buttony = _camy+48+i*(tilesizeh+tilespace);
		switch(buildings[i].mouse)
		{
			case 0:
				draw_rectangle_color(_buttonx,_buttony, _buttonx+tilesizew,_buttony+tilesizeh,c_gray,c_gray,c_gray,c_gray, 0);
				break;
			case 1:
				draw_rectangle_color(_buttonx,_buttony, _buttonx+tilesizew,_buttony+tilesizeh,c_ltgray,c_ltgray,c_ltgray,c_ltgray, 0);
				break;
			case 2:
				draw_rectangle_color(_buttonx,_buttony, _buttonx+tilesizew,_buttony+tilesizeh,c_white,c_white,c_white,c_white, 0);
				break;
		}
		draw_text_color(_buttonx+8,_buttony+8,buildings[i].name,c_black,c_black,c_black,c_black,1);
		
		// Drawing building
		var _building = buildings[i]
		// Draw build mode
		var _snapx = _buttonx+tilesizew*3/4;
		var _snapy = _buttony+tilesizeh*3/4;
		if(_building.stack)
		{
			draw_stack(_building.sprite,_snapx,_snapy,buildAngle,1+(oCamera.zoomOut),1);
			buildAngle += buildTurnSpeed;
		}
		else draw_sprite_outline(buildings[i].sprite,0,_snapx,_snapy,1,1,1,0,c_white,1);
		
		draw_sprite(spr_scrap_icon,0,_buttonx+8,_buttony+tilesizeh/2-4);
		draw_text_outline(_buttonx+24,_buttony+tilesizeh/2-2,buildings[i].scrap);
		draw_sprite(spr_compound_icon,0,_buttonx+8,_buttony+tilesizeh*3/4-4);
		draw_text_outline(_buttonx+24,_buttony+tilesizeh*3/4-2,buildings[i].compounds);
	}
}

if(buildMode != -1)
{
	var _building = buildings[buildMode]
	// Draw build mode
	var _snapx = mouse_x - (mouse_x%32) + _building.origin[0];
	var _snapy = mouse_y - (mouse_y%32) + _building.origin[1];
	var _col = buildCheckTile(_snapx,_snapy,sTurretHitbox) ? merge_color(c_lime,c_white,0.5) : merge_color(c_red,c_white,0.5);
	if(_building.stack)
	{
		draw_set_color(_col);
		draw_stack(_building.sprite,_snapx,_snapy,buildAngle,1+(oCamera.zoomOut),1);
		buildAngle += buildTurnSpeed;
		draw_set_color(c_white);
	}
	else draw_sprite_ext(buildings[buildMode].sprite,0,_snapx,_snapy,1,1,0,_col,1);
}