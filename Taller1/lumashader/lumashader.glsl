#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D texture;
varying vec4 vertTexCoord;

void main() {

  vec2 texl = vertTexCoord.st;
  vec4 pix = texture2D(texture, texl);

  float luma = pix.r*0.2126 + pix.g*0.7152 + pix.b*0.0722;
  gl_FragColor = vec4(luma,luma,luma, 1.0);

}