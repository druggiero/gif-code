float up = 0;
int tog = 1; 

void setup(){
 size(400,400);
}

void draw(){
 background(10,178,90); 
 for (int x = 0; x <width; x=x+5){
   for(int y = 0; y <height; y=y+2){
     set(x, y, color(22,random(150,230),60)); 
   }
 }
 
 
 stroke(30, 100,200);
 strokeWeight(4);
 noFill();
 for(int i = -110; i<width+110; i= i+17){

   if(i % 2 == 0){
     stroke(30, 100,200);
   }
   else if (i %3 ==0){
     stroke(33,200,200);
   }
   else if (i %5 ==0){
    stroke(200,0,255); 
   }
   else{
     stroke(100,0,255); 
   }
    triangle(width/2, height/2, i+up,0, i+up,120);
   //triangle(width/2, height/2, i+up,height, i+up,height-120);
 }
 
  for(int i = width+110; i>-110; i= i-17){
     if(i % 2 == 0){
     stroke(30, 100,200);
   }
   else if (i %3 ==0){
     stroke(33,200,200);
   }
   else if (i %5 ==0){
    stroke(200,0,255); 
   }
   else{
     stroke(100,0,255); 
   }
   
   triangle(width/2, height/2, i+up,height, i+up,height-120);
 }
 up = up + tog*1.2;
 if(up>110){
  tog = -1;
 }
 if(up<-110){
  tog = 1;
 }
 
  
  stroke(0);
  strokeWeight(8);
  line(0,0,width, 0);
  line(0,0,0,height);
  line(width,0,width, height);
  line(0,height,width, height);
  
   if(frameCount%2==0){
  // saveFrame("frames/#####.png");
   }
}