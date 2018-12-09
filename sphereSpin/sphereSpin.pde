int rotVar;
float camVar;

void setup(){
 size(600,600,P3D);
 //hint(ENABLE_DEPTH_SORT);
 rotVar = 0;
 camVar = 0;
 
 frameRate(30);
}

void draw(){
  background(255);
  noStroke();
  lights();
  
 //camera(map(mouseX,0,width,-1200,1600), mouseY, 400, width/2, height/2, 0, 0, 1, 0);
   camera(700, constrain(cos(camVar)*800, 250, 630), 400, width/2, height/2, 0, 0, 1, 0);
  

  pushMatrix();
  translate(width/2, height/2, 0);
  fill(10,10,190,110);
  //sphere(208);
  popMatrix();
   
  //stroke(0);
  //noFill();
  
  fill(0);
  
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(radians(90));
  fill(0,0,5);
  ellipse(0,0,404,404);
  translate(0,0,120);
  ellipse(0,0,320,320);
  translate(0,0,-240);
  ellipse(0,0,320,320);
  
  popMatrix();
  
  
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(radians(rotVar+90));
  fill(255,150,0);
  ellipse(0,0,402,402);
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2, 0);
  fill(255,0,250);
  rotateY(radians(rotVar));
  ellipse(0,0,402,402);
  fill(0);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2, 0);
  fill(170,255,0);
  rotateY(radians(rotVar +45));
  ellipse(0,0,402,402);
  fill(0);
  popMatrix();
  
    pushMatrix();
  translate(width/2, height/2, 0);
  fill(0,230,255);
  rotateY(radians(rotVar -45));
  ellipse(0,0,402,402);
  fill(0);
  popMatrix();
  
  
  rotVar= rotVar + 3;
  camVar = camVar + 0.01;
  
  /*
  if(frameCount % 2==0){
    saveFrame("#######.jpg");
  }
  */
  
}