//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixelW;
uniform float pixelH;

void main()
{
	vec2 offsetx;
	offsetx.x = pixelW;
	vec2 offsety;
	offsetx.y = pixelH;
	
	float alpha = texture2D( gm_BaseTexture, v_vTexcoord).a;
	
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.r = ceil(alpha);
	gl_FragColor.g = gl_FragColor.r;
	gl_FragColor.b = gl_FragColor.r;
}
