color col1;
color col2;
float hueVal;
float inc;

void setup(){
 noStroke();
 size(500,500); 
 colorMode(HSB, 360, 100,100);
 
 col1 = color(180, 73.0, 47.8);
 hueVal = 0;
 inc = 0;
}


void draw(){
  
 hueVal = (180* (sin(inc) + 1))/2;  
 //println(hueVal);
 col1 = color(hueVal, 70.0, 50.0);
 col2 = calcComp(col1);

 fill(col1);
 rect(0,0,width/2,height); 
 
 fill(col2);
 rect(width/2,0,width/2,height); 

 float ePath = map(hueVal*2,0,360,30,width-30);
 ellipse(ePath, height/2, 60,60);

 fill(col1);
 ellipse(ePath, height/2 + 60, 60,60);
 ellipse(ePath, height/2 - 60, 60,60);

 fill(col1);
 rect(width/2, 60, width/2,40);
 rect(width/2, height-60-40, width/2,40);
 
 fill(col2);
 rect(0, 60, width/2,40);
 rect(0, height-60-40, width/2,40);
 
 inc = inc + 0.01;
 
 if(frameCount % 1 ==0){
   //saveFrame("frames/######.png");
 }
}

color calcComp(color inputCol){
  float ih = hue(inputCol);
  float is = saturation(inputCol);
  float ib = brightness(inputCol);
  
  return color((ih + 180)%360, is, ib);
}