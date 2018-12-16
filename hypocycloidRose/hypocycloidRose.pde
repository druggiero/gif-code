float theta;
float x;
float y;
float big_radius;
float small_radius;
float spacer;

void setup(){
  size(580,580);

  stroke(50,50,100);
  background(255);
  
  
  
  frameRate(200);
  
  theta = 0;
  
  translate(width/2, height/2);
  x = 0;
  y = 0;
  
  strokeWeight(3);
  noStroke();
  fill(20,20,20);
  ellipse(x, x, 487,487);
  
  strokeWeight(2);
  
  
  //big_radius = 150;  //reduces to 30/19
  //small_radius = 95;


  //big_radius = 150;  //reduces to 30/13
  //small_radius = 65;
  
  
  //big_radius = 282;   //almost sqrt(2)!
  //small_radius = 200;
  
  //big_radius = 282.84;   //pretty darn close to sqrt(2)
  //small_radius = 200;

  big_radius = 141.42;   //pretty darn close to sqrt(2)
  small_radius = 100;
  
  spacer = big_radius/1.4;
}


void draw(){

 translate(width/2, height/2);

 
 x = (big_radius - small_radius)*cos(theta) + small_radius*cos(theta*((big_radius-small_radius)/small_radius));
 y = (big_radius - small_radius)*sin(theta) + small_radius*sin(theta*((big_radius-small_radius)/small_radius));
 
 /*
 stroke(5,5,5);
 point(x+150, y);
 
 stroke(5,5,5);
 point(x-150, y);
  */ 
 

 stroke(203,82,113);
 point(x + spacer*cos(radians(360/5)), y + spacer*sin(radians(360/5)));
 
 stroke(220,100,130);
 point(x + spacer*cos(radians( 2*(360/5))), y + spacer*sin(radians(2*(360/5))));

 
 stroke(180,70,100);
 point(x + spacer*cos(radians( 3*(360/5))), y + spacer*sin(radians(3*(360/5))));
 
 stroke(230,110,140);
 point(x + spacer*cos(radians( 4*(360/5))), y + spacer*sin(radians(4*(360/5))));

 stroke(180,70,100);
 point(x + spacer*cos(radians(5*(360/5))), y + spacer*sin(radians(5*(360/5))));
 

 
//245, 110, 161

 stroke(255,170,200);
 point(x,y);

 theta = theta + 0.02;
 
 if(frameCount%149==0){
  //saveFrame("frames/#######.png"); 
 }
}