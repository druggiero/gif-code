
class TurtleState{
  
  float x;
  float y;
  float heading;
  
  
  TurtleState(float xin, float yin, float headin){
  x = xin;
  y = yin;
  heading = headin;
  
  }
  
  
  
  float getX(){
   return x; 
  }
  
  float getY(){
   return y; 
  }
  
  float getHeading(){
   return heading; 
  }
  
  String toString(){
   return x +" "+ y + " " + heading; 
  }
  
  
}