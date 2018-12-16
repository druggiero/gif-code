float motionVar;

void setup() {
  size(400, 400); 
  motionVar = 0;
}

void draw() {
  background(50, 100, 200); 

  noStroke();
  for (int i =-420; i<width+420; i=i+12) {
    for (int j = -420; j<height+420; j = j + 42) {
      fill(255, 255, 255);
      rect(i+motionVar, j+(i/2), 20, 22);
      fill(55, 255, 255);
      rect(i+motionVar, j+(i/2), 8, 14);
      fill(170, 255, 200);
      rect(i+motionVar+2, j+(i/2)+4, 4, 4);
    }
    //println(i + motionVar);
  }


  motionVar = motionVar + 1;
  
  if (motionVar>83) {
    motionVar = 0;
  }



 // saveFrame("frames/#####.png");
}