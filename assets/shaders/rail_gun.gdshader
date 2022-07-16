shader_type spatial;
render_mode unshaded;

uniform float time;
uniform vec3 color;

void vertex() {
	float scale_factor = time;
	VERTEX.x *= scale_factor;
	VERTEX.z *= scale_factor;
}
void fragment() {
	ALBEDO = color;
}