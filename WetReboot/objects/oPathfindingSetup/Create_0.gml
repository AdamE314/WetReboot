
global.grid = mp_grid_create(0,0,room_width/32,room_height/32,32,32);
mp_grid_add_instances(global.grid, pWall, 0);

recreateGrid = function()
{
	mp_grid_destroy(global.grid);
	global.grid = mp_grid_create(0,0,room_width/32,room_height/32,32,32);
	mp_grid_add_instances(global.grid, pWall, 0);
}