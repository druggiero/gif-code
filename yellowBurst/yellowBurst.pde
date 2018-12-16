float motionVariable;

void setup(){
 size(400,400); 
 motionVariable = 0;
}


void draw(){
 background(255,255,115); 

 stroke(255,255,255);
 noFill();
 for(int j = 0; j<width+200; j=j+30){
   strokeWeight((j+motionVariable)/45);
   ellipse(width/2, height/2, j+motionVariable,j+motionVariable);
 
 }
  fill(255,255,0);
 strokeWeight(2);
 ellipse(width/2, height/2, 50, 50);
 

 
 if(motionVariable<60){
   motionVariable = motionVariable + 0.7;
 }
 
 else{ 
   motionVariable = 0;
 }
 
  //saveFrame("frames/#####.png");
  
 
}