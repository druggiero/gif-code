float test;
float transp;
float oss;

void setup(){
 size(400,400); 
 test = 0;
 transp = 1;
 oss = 0.4;
}

void draw(){
  background(80, 10, 60);
  //background(255);
  transp = 255* sin(oss);
  //println(transp);
  oss = oss + 0.02;
  
  //fill(255, transp);
  strokeWeight(8);
  for(float i = -76; i<height+42; i= i +14){
    strokeWeight(8);
    fill((i+test)/3 +30, (i+test), i+test, (i+test)/2);
    stroke(i+test,(i+test)/2,(i+test));
    ellipse(width/2,i+test,80,30);
    ellipse(i+test, height/2, 30, 80);
    strokeWeight((i+test+76)/6);  //this is cool!
    ellipse(i+test, i+test,10,10);
    ellipse(i+test, height-(i+test), 10,10);
  }
  test = test + 1;
  if(test>41){
    test = 0;
  }
  
  stroke(0);
  strokeWeight(8);
  line(0,0,width, 0);
  line(0,0,0,height);
  line(width,0,width, height);
  line(0,height,width, height);
  
  // if(frameCount%2==0){
   // saveFrame("frames/#####.png");
  // }
}