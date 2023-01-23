
var _lerptargetw = !zoomOut ? global.swidth : global.swidth*2;
var _lerptargeth = !zoomOut ? global.sheight : global.sheight*2;
currentWidth = lerp(currentWidth,_lerptargetw,0.1);
currentHeight = lerp(currentHeight,_lerptargeth,0.1);
follow = (global.state == STATE.FREE);

if(follow && followTarget.obj != noone && instance_exists(followTarget.obj)) // If following is enabled and follow target is not noone
{
	// Set position to target object with x and y offset
	var _targetx = followTarget.obj.x + followTarget.xoff;
	var _targety = followTarget.obj.y + followTarget.yoff;
		
	// Lerp cam pos to target pos, snap if snap enabled
	camX = lerp(camX,_targetx,max(followRateX,followSnap));
	camY = lerp(camY,_targety,max(followRateY,followSnap));
	
}
else if(zoomOut)
{
	// Key controls
	var _hin = keyboard_check(ord("D"))-keyboard_check(ord("A"));
	var _vin = keyboard_check(ord("S"))-keyboard_check(ord("W"));
	
	camX = clamp(camX + 10*_hin,currentWidth/2,room_width-currentWidth/2);
	camY = clamp(camY + 10*_vin,currentHeight/2,room_height-currentHeight/2);
}

// Set camera position
camera_set_view_pos(view_camera[0],camX-currentWidth/2,camY-currentHeight/2);
camera_set_view_size(view_camera[0],currentWidth,currentHeight);