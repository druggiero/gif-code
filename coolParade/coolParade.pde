float motionVar;

void setup() {
  size(400, 400, P3D);
  motionVar = 0;
}

void draw() {
  background(255);
  
  for(int x = 0; x<width; x++){
    for(int y = 0; y<height; y++){
   set(x,y, color(75,abs(width/2-x),abs(height/2-y))); 
    }
  }
  
  
  
  
  noStroke();
  lights();

  camera(width/2, height/2, 600, width/2, height/2, 0, 0, 1, 0);

  for (int i = -560; i <width+400; i=i +121) {

    pushMatrix();
    translate(0+i+motionVar, height/2, (motionVar+i)/2);
    if (i%2 ==0) {
      fill(20, 30, 130);
    } else {
      fill(20,230, 30);
    } 


    sphere(66);
    popMatrix();

    
    

    pushMatrix();
    translate(0+i+motionVar, height/2 + 80, (motionVar+i)/2);

    sphere(66);
    popMatrix();
    
    
    pushMatrix();
    translate(0+i+motionVar, height/2 + 160 , (motionVar+i)/2);
    
    sphere(38);
    popMatrix();
    
    pushMatrix();
    translate(0+i+motionVar, height/2 + 200, (motionVar+i)/2);
    
    sphere(18);
    popMatrix();
    
    pushMatrix();
    translate(0+i+motionVar, height/2 + 220, (motionVar+i)/2);
    
    sphere(8);
    popMatrix();
    
    pushMatrix();
    translate(0+i+motionVar, height/2 + 240, (motionVar+i)/2);
    
    sphere(4);
    popMatrix();
            
    
    pushMatrix();
    fill(255,255,255);
    translate(0+i+motionVar-25, height/2, (motionVar+i)/2 + 62);
    sphere(14);
    //fill(200,4,56);
    //sphere(14);
    
    translate(65, 0, -20);

    sphere(16);
    popMatrix();
  }


  motionVar = motionVar + 3.8;

  if (motionVar >243) {
    motionVar = 0;
  }
  
  //saveFrame("frames/####.png");
}