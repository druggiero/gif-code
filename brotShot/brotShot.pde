int iterationThresh;
float theta;
float inc;

void setup() {
  size(600, 500);
  background(255);

  translate(width/2, height/2);
  strokeWeight(1);

  iterationThresh = 40;
  theta = 0;
  inc = 0.05;
}

void draw() {

  background(255);
  translate(width/2, height/2);

  for (int x = -width/2; x<width/2; x++) {
    for (int y = -height/2; y<height/2; y++) {

      float count = countEscape(map(x, -width/2, width/2, -3, 2.5), map(y, -height/2, height/2, -2.5, 2.5), theta);
      
      
      //println(count);
      //stroke(map(count, 0, 20, 0, 255), map(count, 0, 20, 0, 255), map(count, 0, 20, 0, 255));
      color c = color(map(count, 0, 20, 0, 255), map(count, 0, 20, 0, 255), map(count, 0, 20, 0, 255));
      set(x+width/2,y+height/2,c);
      //point(x, y);
    }
  }
  
  theta = theta + inc;
  if(abs(theta)>2.1){
    inc = -inc;
  }
  //saveFrame("#####.png");
}



float countEscape(float real, float imag, float theta) {

  float z_real =  0;
  float z_imag = theta;

  for (int l = 0; l<iterationThresh; l++) {
    //z_real = abs(z_real);
    //z_imag = abs(z_imag); //burning ship
    
    float z_real_hold = z_real*z_real - z_imag*z_imag;
    float z_imag_hold = 2*z_real*z_imag;

    z_real = z_real_hold + real;
    z_imag = z_imag_hold + imag;

    float size = sqrt(z_real*z_real + z_imag*z_imag);
    if (size >20) {
      return l;
    }
  }
  return 0;
}