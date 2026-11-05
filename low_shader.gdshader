
shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

// PD Card VFX - rarity shine: a bright band sweeps across the card every few seconds.
uniform float period = 3.3;
uniform float width = 0.1;
uniform float strength = 1.3;
uniform vec4 shine_color : source_color = vec4(1.0, 0.92, 0.7, 1.0);

void fragment() {
	vec4 b = texture(TEXTURE, UV);
	float t = fract(TIME / period) * 2.2 - 0.6;
	float d = (UV.x + (1.0 - UV.y) * 0.6) / 1.6;
	float band = 1.0 - smoothstep(0.0, width, abs(d - t));
	float core = 1.0 - smoothstep(0.0, width * 0.25, abs(d - t));
	COLOR = vec4(b.rgb + shine_color.rgb * (band * 0.6 + core * 0.8) * strength * b.a, b.a);
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
