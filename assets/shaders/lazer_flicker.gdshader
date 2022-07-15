shader_type spatial;
render_mode unshaded;

uniform float flicker_speed = 5;
uniform float flicker_amount = 200.0;

void vertex() {
	float scale_factor = (cos(TIME*flicker_speed)/flicker_amount + 1.0);
	VERTEX.x *= scale_factor;
	VERTEX.z *= scale_factor;
}