shader_type spatial;
render_mode blend_mix,cull_disabled,unshaded,depth_draw_opaque;


// Base color + opacity
uniform vec4 albedo : source_color;
// Brush diameter
uniform float proximity_multiplier = 1.0;
// Distance at which proximity highlight occurs
uniform float proximity_treshold = 0.4;
// Depth texture
uniform sampler2D depth_texture : hint_depth_texture;


void fragment() {
	ALBEDO = albedo.rgb;
	
	// Fancy dithered alpha stuff
	float opacity = albedo.a;
	int x = int(FRAGCOORD.x) % 4;
	int y = int(FRAGCOORD.y) % 4;
	int index = x + y * 4;
	float limit = 0.0;
	
	if (x < 8) {
		if (index == 0) limit = 0.0625;
		if (index == 1) limit = 0.5625;
		if (index == 2) limit = 0.1875;
		if (index == 3) limit = 0.6875;
		if (index == 4) limit = 0.8125;
		if (index == 5) limit = 0.3125;
		if (index == 6) limit = 0.9375;
		if (index == 7) limit = 0.4375;
		if (index == 8) limit = 0.25;
		if (index == 9) limit = 0.75;
		if (index == 10) limit = 0.125;
		if (index == 11) limit = 0.625;
		if (index == 12) limit = 1.0;
		if (index == 13) limit = 0.5;
		if (index == 14) limit = 0.875;
		if (index == 15) limit = 0.375;
	}
	// Skip drawing a pixel below the opacity limit
	if (opacity < limit)
		discard;
	
	// Proximity highlight to make brush bounds more visible in the scene
	float depth_tex = texture(depth_texture, SCREEN_UV).x;
	// fix from https://www.reddit.com/r/godot/comments/wb0jw7/godot_4_alpha_12_depth_texture_not_working/
	// depth texture in 4.0 is automaticaly within neccessary range
	vec3 ndc = vec3(SCREEN_UV * 2.0 - 1.0, texture(depth_texture,SCREEN_UV).x);
	vec4 view = INV_PROJECTION_MATRIX * vec4(SCREEN_UV * 2.0 - 1.0, depth_tex, 1.0);
	view.xyz /= view.w;
	float proximity = 1.0 - clamp(1.0 - smoothstep(view.z + proximity_treshold * proximity_multiplier, view.z, VERTEX.z), 0.0, 1.0);
	
	// Highlight pixels that are close to other geometry
	ALBEDO = clamp(ALBEDO + vec3(proximity * 0.5), 0.0, 1.0);
}
