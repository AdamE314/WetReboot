var _camx = camera_get_view_x(view_camera[0]);
var _camy = camera_get_view_y(view_camera[0]);
var _camw = camera_get_view_width(view_camera[0]);
var _camh = camera_get_view_height(view_camera[0]);
var _off = 32;
var _stack = (oCamera.zoomOut) ? smallstack : stack;
var _scale = (oCamera.zoomOut) ? 2 : 1;
if(x = clamp(x,_camx-_off,_camx+_camw+_off) && y = clamp(y,_camy-_off,_camy+_camh+_off))
	draw_stack(_stack,x,y,myAngle,1+(oCamera.zoomOut),_scale);