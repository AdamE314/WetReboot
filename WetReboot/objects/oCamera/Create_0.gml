
// Global info about the view/viewport
global.swidth = 640;
global.sheight = 360;
global.portscale = 2;
// Setting window size
setWindow = function()
{
	window_set_size(global.swidth * global.portscale, global.sheight * global.portscale);
}
setWindow();

// Zoomed out
zoomOut = false;
hibernationWidth = global.swidth*2;
hibernationHeight = global.sheight*2;
currentWidth = global.swidth;
currentHeight = global.sheight;

// Following variables
follow = true; // Whether or not to follow an object
followSnap = false; // If true, automatically snap to target
followRateX = 0.1; // Lerp rate of camera to target position - 1 = snap, 0 = don't move, 0.5 = follow
followRateY = 0.4;
followTarget =  { obj: noone, xoff: 0, yoff: -16 } // Target of camera, obj position with x,y offset

// Camera and view position variables
camX = room_width/2;
camY = room_height/2;
// Set camera position
camera_set_view_pos(view_camera[0],camX-global.swidth/2,camY-global.sheight/2);
viewX = camX; viewY = camY; // To be used for screenshake
setPosition = function(_x, _y)
	{ camX = _x; camY = _y; }
setFollowTarget = function(_obj, _xoff = 0, _yoff = 0)
	{ followTarget.obj = _obj; followTarget.xoff = _xoff; followTarget.yoff = _yoff; }
setFollowOffset = function(_xoff, _yoff = followTarget.yoff)
	{ followTarget.xoff = _xoff; followTarget.yoff = _yoff; }
setFollowRate = function(_x, _y = -1)
	{ followRateX = _x; followRateY = (_y == -1) ? _x : _y; }
getFollowObject = function() { return followTarget.obj; }

