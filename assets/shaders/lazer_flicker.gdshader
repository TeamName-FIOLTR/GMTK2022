shader_type spatial;
render_mode unshaded;

uniform float flicker_speed = 20;
uniform float flicker_amount = 0.5;
uniform vec3 color;

void vertex() {
	float scale_factor = (cos(TIME*flicker_speed)*flicker_amount + 1.0 + flicker_amount);
	VERTEX.x *= scale_factor;
	VERTEX.z *= scale_factor;
}
void fragment() {
	ALBEDO = color;
}