#version 120


#define WORLD_SPACE		//Implements the deformation in World Space. Uses Screen Space if not enabled.


uniform mat4 gbufferModelView;
uniform mat4 gbufferModelViewInverse;

uniform float frameTimeCounter;

varying vec4 color;

attribute vec4 mc_Entity;

float lerp(float a, float b, float t)
{
	return a + (b - a) * t;
}


void main()
{
	vec4 position = gl_ModelViewMatrix * gl_Vertex;
	
	float glidemajor = max(sin(frameTimeCounter / 132.), 0);
	glidemajor = glidemajor * glidemajor * glidemajor;
	
	float glide = sin(frameTimeCounter / 20.0) * sin(frameTimeCounter / 20.0) * glidemajor;
	float glide2 = sin(frameTimeCounter / 24.0 - acos(-1.0) / 3.0) * sin(frameTimeCounter / 24.0 - acos(-1.0) / 3.0) * 0.5 * glidemajor;
	float glide3 = sin(frameTimeCounter / 34.0 - acos(-1.0) / 7.0) * sin(frameTimeCounter / 34.0 - acos(-1.0) / 7.0) * glidemajor;
	float glide4 = sin(frameTimeCounter / 19.0 - acos(-1.0) / 6.0) * glidemajor;
	float glide5 = sin(frameTimeCounter / 26.0 - acos(-1.0) /+ 4.0) * sin(frameTimeCounter / 26.0 - acos(-1.0) / 4.0) * 0.5 * glidemajor;
	float glide6 = sin(frameTimeCounter / 21.0) * sin(frameTimeCounter / 21.0) * glidemajor;
	
	float distance2Ds = sqrt(position.x * position.x + position.y * position.y) / 200.;
	
	float px = position.x;
	float py = position.y;
	
	float angle = (glide4*distance2Ds*1.0)*(acos(-1.0)/20.0);
	angle += (((sin((abs(px)/40.)+frameTimeCounter/2.0)*sqrt(abs(position.z))) * (acos(-1.0)/180.))/ 10.)*glide4;
	position.x = px * cos(angle) - py * sin(angle);
	position.y = px * sin(angle) + py * cos(angle);
	
	position.z = lerp(position.z, position.z * (1 - (sin(frameTimeCounter / 11.)/2.+0.5)*.13) - 0.5*(sin(frameTimeCounter / 11.)/2.+0.5), glide6);
	
	#ifdef WORLD_SPACE
		position = gbufferModelViewInverse * position;
	#endif
	
	float distance2D = sqrt(position.x * position.x + position.z * position.z);
	float distance3D = sqrt(position.x * position.x + position.y * position.y + position.z * position.z);
	
	position.x = lerp(position.x, position.x*position.x*position.x, glide3 / 90000.0);
	position.y = lerp(position.y, position.y*position.y*position.y, glide3 / 90000.0);
	position.z = lerp(position.z, position.z*position.z*position.z, glide3 / 90000.0);
	
	float x = position.x + (sin(frameTimeCounter + distance3D) * 0.1 * (distance3D/8.0) * max(0, sin(distance3D - frameTimeCounter)-0.5)) * glide;
	float y = position.y + (cos(frameTimeCounter + distance3D) * 0.1 * (distance3D/8.0) * max(0, sin(distance3D - frameTimeCounter)-0.5)) * glide;
	float z = position.z + (cos(frameTimeCounter + distance3D + acos(-1.0) / 2.0) * 0.1 * (distance3D/8.0) * max(0, sin(distance3D - frameTimeCounter)-0.5)) * glide;
	
	position.x = x;
	position.y = y;
	position.z = z;
	
	#ifdef WORLD_SPACE
		position = gbufferModelView * position;
	#endif
	
	gl_Position = gl_ProjectionMatrix * position;
	
	
	gl_FogFragCoord = sqrt(position.x * position.x + position.y * position.y + position.z * position.z);
	
	color = gl_Color;
	color.r = color.r + (cos(frameTimeCounter / 6.5) / 5.0)*glide2;
	color.g = color.g + (cos(frameTimeCounter / 6.8) / 4.0)*glide2;
	color.b = color.b + (cos(frameTimeCounter / 6.0) / 5.5)*glide2;
	
	color.r = lerp(color.r, color.r + sin(frameTimeCounter / 2.0)/5.0, glide5);
	color.g = lerp(color.g, color.g + sin(frameTimeCounter / 2.1)/4.7, glide5);
	color.b = lerp(color.b, color.b + sin(frameTimeCounter / 1.9)/5.1, glide5);
}