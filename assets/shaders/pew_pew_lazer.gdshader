shader_type spatial;
render_mode unshaded;

/*
	this is an animation shader that exploads the lazer outwords
	inteanded for fireing the lazer
*/
uniform float time;
uniform float bulb_radius = 2.545;
uniform float bulb_len = 0.89;

void vertex() {
		float time_point = (1.0 - VERTEX.y - time);
		float scale_factor = 1.0;
		if (time_point > 0.0 && bulb_len > time_point) {
			scale_factor = time_point * bulb_radius;
		}
		VERTEX.x *= scale_factor;
		VERTEX.z *= scale_factor;
}