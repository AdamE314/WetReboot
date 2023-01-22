/// @desc Move with pixel perfect collision and clamping
/// @param {real} hmov Horizontal movement
/// @param {real} vmov Vertical movement
/// @param {Asset.GMObject} [collideobj]=noone Object to collide with
/// @param {real} [clampleft]=-1 Left boundary of clamp
/// @param {real} [clamptop]=-1 Top boundary of clamp
/// @param {real} [clampright]=-1 Right boundary of clamp
/// @param {real} [clampbottom]=-1 Bottom boundary of clamp
/// @returns {Array<Real>} Collision along each axis
function move_perfect(_hmov, _vmov, _collobj = noone, _clampleft = -1, _clamptop = -1, _clampright = -1, _clampbottom = -1) {

	// Getting variables
	var _doclamp = !(_clampleft == -1 && _clamptop == -1 && _clampright == -1 && _clampbottom == -1)
	
	// Initialize array to return
	// index 0 and 1 correspond to x and y respectively
	// return value of each index is 0/1 for no collision/collision on that axis
	// return value is 2 for clamp on that axis
	var _returnarray = array_create(2,0);

	// Moving
	var _realhmov = _hmov;
	var _realvmov = _vmov;

	// If there is an object to collide with
	if(_collobj != noone)
	{
		// Moving horizontally
		if(place_meeting(x+_hmov,y,_collobj))
		{
			// Pixel perfect movement
			_realhmov = 0;
			for(var i = 0;i<abs(_hmov);i++)
			{
				if(!place_meeting(x + _realhmov + sign(_hmov),y,_collobj))
				{
					_realhmov += sign(_hmov);
				}
			}
			// Return collided on x
			_returnarray[0] = 1;
		}
		// Movement vert
		if(place_meeting(x+_realhmov,y+_vmov,_collobj))
		{
			// Pixel perfect movement
			_realvmov = 0;
			for(var i = 0;i<abs(_vmov);i++)
			{
				if(!place_meeting(x + _realhmov, y + _realvmov + sign(_vmov),_collobj))
				{
					_realvmov += sign(_vmov);
				}
			}
			// Return collided on y
			_returnarray[1] = 1;
		}
	}

	// Actually moving
	x += _realhmov;
	y += _realvmov;

	// Clamping if appropriate
	if(_doclamp)
	{
		// Getting clamped position
		var _newx = clamp(x,_clampleft,_clampright);
		var _newy = clamp(y,_clamptop,_clampbottom);
		// Return clamped on either axis
		if (x != _newx)
		{
			_returnarray[0] = 2;
		}
		if (y != _newy)
		{
			_returnarray[1] = 2;
		}
		// Setting to clamped position
		x = _newx;
		y = _newy;
	}

	// Returning false if no collision/clamp
	return _returnarray;

}