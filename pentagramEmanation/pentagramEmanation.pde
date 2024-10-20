float r = 540;
float s= 14;

void setup(){
 size(600,600);
 noFill();
 strokeWeight(s);
}

void draw(){
  background(15,15,15);
  strokeCap(ROUND);
  
  translate(width/2, height/2);
  float theta = -90;
  r = 540;

  for(int j=0; j<9; j++){
    //scale(0.96);
    //diagonals
      
     for(int i =0; i<5; i++){  
        stroke(220,220,230);
        line(r*cos(radians(theta))*s,r*sin(radians(theta))*s, r*cos(radians(theta+144))*s,r*sin(radians(theta+144))*s);
        fill(220,220,230);
        ellipse(r*cos(radians(theta))*s,r*sin(radians(theta))*s, 13, 13);
        theta = theta + 144;       
     }

    r = r/2.618;
    theta = theta*-1;
  }
  //println(r);
  s = s*1.01;
  //println(s);
  if(s>34.0){
    s = 5;
    r =540;
  }
  
  if(frameCount % 2 ==0){
   //saveFrame("frames/######.png");
 }
}
