shader_type spatial;
render_mode unshaded;

uniform int mode = 0;

uniform float time = 0.0;

uniform float flicker_speed = 20;
uniform float flicker_amount = 0.5;


uniform float bulb_radius = 20;
uniform float bulb_len = 0.89;




uniform vec3 color;

void vertex() {
	if (mode == 0) {
		float scale_factor = (cos(TIME*flicker_speed)*flicker_amount + 1.0 + flicker_amount);
		VERTEX.x *= scale_factor;
		VERTEX.z *= scale_factor;
	}
	else if (mode == 1 ){
		float scale_factor = time;
		VERTEX.x *= scale_factor;
		VERTEX.z *= scale_factor;
	}
	else if (mode == 2) {
		float time_point = (1.0 - VERTEX.y - time);
		float scale_factor = 1.0;
		if (time_point > 0.0 && bulb_len > time_point) {
			scale_factor = time_point * bulb_radius;
		}
		VERTEX.x *= scale_factor;
		VERTEX.z *= scale_factor;
	}
	
}
void fragment() {
	ALBEDO = color;
}