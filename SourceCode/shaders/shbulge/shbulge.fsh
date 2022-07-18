//
// Magnifying Glass fragment shader
//
/*-----------------------------------------------------------------------------
Magnifying Glass fragment shader: simulates a magnifying glass
Fragment Shader: Distort & Colourize
-------------------------------------------------------------------------------
_______________________________________________________________________________
INFO:
-------------------------------------------------------------------------------
Applies a magnifying glass effect to a surface.
Has to be used after everything you want to magnify is drawn already.
So i.e. in draw ened event.

- draw something to the surface (i.e. a part of the application surface
- draw that surface by this shader
- draw the magnifying glass sprite
- draw focus and specular in bm_add

_______________________________________________________________________________
UNIFORMS:
-------------------------------------------------------------------------------
uniform float zoom1			Changes the zoom effect
uniform float zoom2			Changes the zoom effect
uniform float radius		Changes the zoom effect
uniform float aberration	Chromatic Aberation strength
uniform float contrast		
uniform float saturation	
uniform float gamma			

See the constants inside the shader for reasonable settings of all uniforms.
	
_______________________________________________________________________________
EXAMPLE:
-------------------------------------------------------------------------------
check demo
*/


varying vec2 v_vTexcoord;
//varying vec4 v_vColour;

// if these settings don't need to be dynamic: remove the uniforms and use constants or macros instead:
/*uniform float zoom1;
uniform float zoom2;
uniform float zoom3;
uniform float aberration;
uniform float contrast;
uniform float saturation;
uniform float gamma;*/

//	const float zoom1		= 0.4;
//	const float zoom2		= 0.2;
//	const float zoom3		= 0.6;
//	const float aberration	= 0.05;
//	const float contrast	= 1.7;
//	const float saturation	= 0.75;
//	const float gamma		= 1.4;

#define zoom1		0.88
#define zoom2		0.2
#define zoom3		1.0
#define aberration	0.005
#define contrast	1.0
#define saturation	0.75
#define gamma		1.0

void main() {	
	// GET MAGNIFY SAMPLE OFFSET FROM THE CENTRE:
	float dist				= length(v_vTexcoord - 0.5);						// distance to the center
	float offset			= dist * ((zoom2 * dist / zoom3) + zoom1);			// offset as if it wasn't a circle
	//float angle				= atan(v_vTexcoord.y - 0.5, v_vTexcoord.x - 0.5);	// either: get angle from the center ...
	//vec2 sample				= vec2(cos(angle), sin(angle)) * offset + 0.5;		// ... and rotated offset
	vec2 sample				= normalize(v_vTexcoord - 0.5) * offset + 0.5;		// or: normalize vector to get the offset
	
	// SAMPlE COLOUR:
	vec4 base_col			= texture2D(gm_BaseTexture, sample);
	
	//CIRCULAR STENCIL:
	//base_col.a				= mix(base_col.a, 0.0, step(0.5, dist));					// if outside the circle: alpha = 0
	
	// CHROMATIC ABERRATION (optional, can be deleted without changing anything else):
	vec2 abr_dist			= (v_vTexcoord - 0.5) * (v_vTexcoord - 0.5) * aberration;	// square curve so there's no aberration at the center
	base_col.rgb			= base_col.rgb										* vec3(1.0, 0.0, 0.0) + 
							  texture2D(gm_BaseTexture, sample + abr_dist).rgb	* vec3(0.0, 0.0, 1.0) +
							  texture2D(gm_BaseTexture, sample - abr_dist).rgb	* vec3(0.0, 1.0, 0.0);
																					//+--------------
																					//=1.0, 1.0, 1.0
	
	// ADJUST COLOURS (optional, each of these adjustments can be removed without changing anything else):
	// gamma, contrast & saturation:
	base_col.rgb = pow(base_col.rgb, vec3(1.0 / gamma));
	base_col.rgb			= (base_col.rgb - 0.5) * contrast + 0.5;
	float gray				= dot(base_col.rgb, vec3(0.33,0.33,00.33));
	base_col.rgb			= mix(vec3(gray), base_col.rgb, saturation);
	
	
	// OUTPUT:
	gl_FragColor			= base_col;
}
