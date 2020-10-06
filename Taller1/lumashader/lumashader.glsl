#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;
varying vec4 vertTexCoord;

void main() {

  vec2 texl = vertTexCoord.st;
  vec4 color = texture(texture, texl);

  float luma = color.r*0.2126 + color.g*0.7152 + color.b*0.0722;
  gl_FragColor = vec4(vec3(luma), 1.0);

}