shader_type canvas_item;

uniform float flash_speed = 0.0;
uniform float intensity = 0.0;

void fragment() {
		
        vec4 c = textureLod(TEXTURE, UV, 0.0);

		c.r += intensity * sin(TIME * flash_speed);
        COLOR = c;
}