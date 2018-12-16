import org.qscript.*;
import org.qscript.editor.*;
import org.qscript.errors.*;
import org.qscript.events.*;
import org.qscript.eventsonfire.*;
import org.qscript.operator.*;


float theta = 0.0;
Turtle turt;
Grammar gram;

int num = 5;


void setup() {
  size(1280, 800);
  background(0);
  strokeWeight(5);
  stroke(255, 100, 20);
}

void draw() {
  background(0);   

  String exhaustAx = "B(90)F+(90)B(90)F+(90)B(90)F+(90)B(90)F";
  String [][]exhaustPro = {{"+(x)", "+(x/2.0)"}, {"B(z)", "B(z/2.0)F+(z/2.0)B(z/2.0)"}};
  gram = new Grammar(exhaustAx, exhaustPro,90, 1/2.0);
 
  strokeWeight(9);
  int iteration = abs(int((sin(theta))*5));
 
  stroke(0,255,255);
  Turtle turt4 = new Turtle(gram, (iteration) %5, 330, width/2-100,  height/2 + 220, 0);
  //turt4.drawGrammar();
  
  
  stroke(0,255,0);
  Turtle turt3 = new Turtle(gram, (iteration) %5, 330, width/2-80,  height/2 + 240, 0);
  turt3.drawGrammar();
  
  stroke(0,120,255);
  Turtle turt2 = new Turtle(gram, (iteration) %5, 330, width/2-60,  height/2 + 260, 0); 
  turt2.drawGrammar();
  
    
  stroke(255,0,255);
  Turtle turt1 = new Turtle(gram, (iteration) %5, 330, width/2-40,  height/2 + 280, 0);
  turt1.drawGrammar();
  
  
  stroke(255,120,0);
  Turtle turt0 = new Turtle(gram, (iteration) %5 , 330, width/2, height/2 + 300, 0);
  turt0.drawGrammar();

  theta = theta + 0.03;
  

 if(frameCount%3==0){
  //saveFrame("frames/#####.jpg");
 }
}