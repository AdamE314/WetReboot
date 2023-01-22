
// Setting and resetting alignment
function align(_h = fa_center, _v = fa_middle)
{
	draw_set_halign(_h);
	draw_set_halign(_v);
}
function align_reset()
{
	draw_set_halign(fa_left);
	draw_set_halign(fa_top);
}


// Draw sprite stack
function draw_stack(_spr, _x, _y, _rot = 0, _scale = 1, _alpha = 0, _subimgscale = 1, _topscale = 0.5, _rot2D = 0, _startimg = 0, _size = -1)
{
	// Getting values
	if(_size == -1) _size = sprite_get_number(_spr);
	_size *= _subimgscale;
	var _sw = sprite_get_width(_spr)*1.5; var _sh = sprite_get_height(_spr)*1.5;
	var _sox = sprite_get_xoffset(_spr)*1.5; var _soy = sprite_get_yoffset(_spr)*1.5;
	// Creating surface to render subimgs onto
	var _surfw = round_pow2(_sw*_size);
	var _surfh = round_pow2(_sh);
	var _surf = surface_create(_surfw,_surfh);
	surface_set_target(_surf);
	draw_clear_alpha(c_black,0);
	// Drawing subimgs to surface
	for(var i=0;i<_size;i++)
	{
		draw_sprite_ext(_spr,_startimg+i,_sw*i+_sox,_soy,1,1,_rot,c_white,1);
	}
	surface_reset_target();
	
	// Create surface to rotate when drawing 2D projection at an angle bc for some reason you have to do that
	var _rsw = round_pow2(_sw*_scale); var _rsh = round_pow2(_size+_sh*_scale*_topscale+_size);
	var _rotsurf = surface_create(_rsw, _rsh);
	surface_set_target(_rotsurf);
	draw_clear_alpha(c_white,0);
	
	// Drawing subimgs to surface to create 2D projection
	for(var i=0;i<_size;i += min(1,_topscale))
	{
		draw_surface_part_ext(_surf,floor(i/_subimgscale)*_sw,0,_sw,_sh,0,(_size-i)*_scale,_scale,_scale*_topscale,c_white,1);
	}
	surface_free(_surf);
	surface_reset_target();
	
	// Getting appropriate x and y offsets based on origin, scale, and rotation
	var _xoff = -_sox*_scale;
	var _yoff = -_soy*_scale*_topscale-_size*_scale;
	// Drawing the actual surface to the screen with rotation
	draw_surface_ext(_rotsurf,
					_x+dcos(_rot2D)*_xoff+dsin(_rot2D)*_yoff,
					_y+dcos(_rot2D)*_yoff-dsin(_rot2D)*_xoff,
					1,1,_rot2D,c_white,_alpha);
	surface_free(_rotsurf);
	
	/* Rendering from before adding the step with the _rotsurf surface
	// Getting appropriate x and y offsets based on origin, scale, and rotation
	var _xoff = -_sox*_scale;
	var _yoff = -_soy*_scale*_topscale;
	// Drawing subimgs to screen
	for(var i=0;i<_size;i += _topscale)
	{
		draw_surface_part_ext(_surf,floor(i)*_sw,0,_sw,_sh,_x+_xoff,_y+_yoff-i*_scale,_scale,_scale*_topscale,c_white,1);
	}
	*/
}


//  Draw outline functions

/// @desc Draw sprite with outline
/// @param {Asset.GMSprite} _spr Description
/// @param {real} _subimg Description
/// @param {real} _x Description
/// @param {real} _y Description
/// @param {real} [_olwidth]=1 Description
/// @param {real} [_xscale]=1 Description
/// @param {real} [_yscale]=1 Description
/// @param {real} [_rot]=0 Description
/// @param {constant.color} [_col]=c_white Description
function draw_sprite_outline(_spr, _subimg, _x, _y, _olwidth = 1, _xscale = 1, _yscale = 1, _rot = 0, _col = c_white)
{
	draw_sprite_ext(_spr,_subimg,_x-_olwidth,_y,_xscale,_yscale,_rot,c_black,1);
	draw_sprite_ext(_spr,_subimg,_x+_olwidth,_y,_xscale,_yscale,_rot,c_black,1);
	draw_sprite_ext(_spr,_subimg,_x,_y-_olwidth,_xscale,_yscale,_rot,c_black,1);
	draw_sprite_ext(_spr,_subimg,_x,_y+_olwidth,_xscale,_yscale,_rot,c_black,1);
	draw_sprite_ext(_spr,_subimg,_x,_y,_xscale,_yscale,_rot,_col,1);
}
// Draw surface with outline
function draw_surface_outline(_myid, _x, _y, _olwidth = 1, _xscale = 1, _yscale = 1, _rot = 0, _col = c_white)
{
	draw_surface_ext(_myid,_x-_olwidth,_y,_xscale,_yscale,_rot,c_black,1);
	draw_surface_ext(_myid,_x+_olwidth,_y,_xscale,_yscale,_rot,c_black,1);
	draw_surface_ext(_myid,_x,_y-_olwidth,_xscale,_yscale,_rot,c_black,1);
	draw_surface_ext(_myid,_x,_y+_olwidth,_xscale,_yscale,_rot,c_black,1);
	draw_surface_ext(_myid,_x,_y,_xscale,_yscale,_rot,_col,1);
}
// Draw text with outline
function draw_text_outline(_x,_y,_str, _olwidth = 1, _xscale = 1, _yscale = 1, _angle = 0, _c1 = c_white, _c2 = _c1, _c3 = _c1, _c4 = _c1, _sep = -1, _w = room_width)
{
	var _cb = c_black;
	draw_text_ext_transformed_color(_x-_olwidth,_y,_str,_sep,_w,_xscale,_yscale,_angle,_cb,_cb,_cb,_cb,1);
	draw_text_ext_transformed_color(_x+_olwidth,_y,_str,_sep,_w,_xscale,_yscale,_angle,_cb,_cb,_cb,_cb,1);
	draw_text_ext_transformed_color(_x,_y-_olwidth,_str,_sep,_w,_xscale,_yscale,_angle,_cb,_cb,_cb,_cb,1);
	draw_text_ext_transformed_color(_x,_y+_olwidth,_str,_sep,_w,_xscale,_yscale,_angle,_cb,_cb,_cb,_cb,1);
	draw_text_ext_transformed_color(_x,_y,_str,_sep,_w,_xscale,_yscale,_angle,_c1,_c2,_c3,_c4,1);
}