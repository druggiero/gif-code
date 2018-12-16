import java.util.Stack; //Java Platform Stack

class Turtle { 
  float len;
  Grammar grammar;
  float x;
  float y;
  float heading;
  TurtleState state;
  Stack<TurtleState> turtleStack;

  //potentially might need this:
  //Stack<PShape> polygonStack;


  Turtle(Grammar gram, int iterations, int size) {
    len = float(size);
    grammar = gram;
    x = width/2;
    y = height/2;
    heading = -PI/2;


    state = new TurtleState(x, y, heading);
    turtleStack = new Stack<TurtleState>();
    turtleStack.push(state);

    for (int i = 0; i<iterations; i++) {
      len = len * grammar.getScaleFactor();
    } 


    for (int i = 0; i<iterations; i++) {
      Grammar newGram = grammar.reWrite();
      grammar = newGram;
    }
  }  


  //Second constructor with specified location, rotation (radians):
  Turtle(Grammar gram, int iterations, int size, float xin, float yin, float rotation) {

    len = float(size);
    grammar = gram;
    x = xin;
    y = yin;
    heading = rotation;

    state = new TurtleState(x, y, heading);
    turtleStack = new Stack<TurtleState>();
    turtleStack.push(state);

    for (int i = 0; i<iterations; i++) {
      len = len * grammar.getScaleFactor();
    } 


    for (int i = 0; i<iterations; i++) {
      Grammar newGram = grammar.reWrite();
      grammar = newGram;
    }
  } 





  void drawGrammar() {
    //pushMatrix(); //not sure if needed, maybe for multiple turtles...

    //Starting location and rotation. 
    //translate(x, y);
    //rotate(heading);

    int thickness = 4;
    PShape shape = null;

   // strokeWeight(thickness); //can add to parameter at some point.

    String str = grammar.getStr();
    //useful for debugging:
    //println(str + " " );


    //Turtle Interpretation of Symbols: 
    for (int j = 0; j<str.length(); j++) {

      if (str.charAt(j)=='F') {
        //THIS LINE WAS CHANGED TO ALLOW NONPARA!!!!! NOV 16!!
        if (j+1<str.length() && str.charAt(j+1)=='(') {
          String parameters = "";
          int k = 2;
          //CHANGED THIS WHOLE THING 
          Boolean endParam=false;
          int lTally = 0;
          while(endParam==false && (j+k)<str.length()){
            if(str.charAt(j+k)=='('){
              lTally = lTally + 1;
            }
            if(str.charAt(j+k)==')'){
              lTally = lTally - 1;
            }
            if(lTally < 0){
              endParam = true;
            }
            //modded this too:
            if(endParam ==false){
              parameters = parameters + str.charAt(j+k);
              k = k+1;
            }
          }
          
       
          float[] parameterList = parseParam(parameters);

          forward(parameterList[0]);
        } else
          forward(1);
      }




      if (str.charAt(j)=='G') {
        if (j+1<str.length() && str.charAt(j+1)=='(') {
          String parameters = "";
          int k = 2;
          Boolean endParam=false;
          int lTally = 0;
          while(endParam==false && (j+k)<str.length()){
            if(str.charAt(j+k)=='('){
              lTally = lTally + 1;
            }
            if(str.charAt(j+k)==')'){
              lTally = lTally - 1;
            }
            if(lTally < 0){
              endParam = true;
            }
            if(endParam ==false){
              parameters = parameters + str.charAt(j+k);
              k = k+1;
            }
          }
          float[] parameterList = parseParam(parameters);
          forward(parameterList[0]);
        } else
          forward(1);
      }



      if (str.charAt(j)=='T') {

        strokeWeight(thickness+2);
        forward(1);
        strokeWeight(thickness);
      }

      if (str.charAt(j)=='H') {

        strokeWeight(thickness-2);
        forward(1);
        strokeWeight(thickness);
      }


      if (str.charAt(j) =='!') {
        if (j+1<str.length() && str.charAt(j+1)=='(') {
          String parameters = "";
          int k = 2;
          Boolean endParam=false;
          int lTally = 0;
          while(endParam==false && (j+k)<str.length()){
            if(str.charAt(j+k)=='('){
              lTally = lTally + 1;
            }
            if(str.charAt(j+k)==')'){
              lTally = lTally - 1;
            }
            if(lTally < 0){
              endParam = true;
            }
            if(endParam ==false){
              parameters = parameters + str.charAt(j+k);
              k = k+1;
            }
          }
          float[] parameterList = parseParam(parameters);
          strokeWeight(parameterList[0]);
        } else
          strokeWeight(thickness-1);
      }




      if (str.charAt(j)=='[') {
        //push
        turtleStack.push(state);
      }

      if (str.charAt(j)==']') {
        //pop
        state = turtleStack.pop();
      }


      if (str.charAt(j)=='{') {

        shape = createShape();      
        shape.beginShape();
        shape.fill(0, 131, 23, 150);
      }


      if (str.charAt(j)=='}') {
        shape.endShape(CLOSE);
        //controls shape outline
        noStroke();
        shape(shape, 0, 0);
      }

      if (str.charAt(j)=='.' && !Character.isDigit(str.charAt(j+1))) { 
        shape.vertex(state.getX(), state.getY());
        //ellipse(state.getX(),state.getY(),30,30);
      }


      if (str.charAt(j)=='+') {
        //turn left
        float angle;

        if (j+1<str.length() && str.charAt(j+1)=='(') {
          String parameters = "";
          int k = 2;
          Boolean endParam=false;
          int lTally = 0;
          while(endParam==false && (j+k)<str.length()){
            if(str.charAt(j+k)=='('){
              lTally = lTally + 1;
            }
            if(str.charAt(j+k)==')'){
              lTally = lTally - 1;
            }
            if(lTally < 0){
              endParam = true;
            }
            if(endParam ==false){
              parameters = parameters + str.charAt(j+k);
              k = k+1;
            }
          }
          float[] parameterList = parseParam(parameters);
          angle = parameterList[0];
        } else {

          //println(" state get heading: "+ state.getHeading());        
          angle = grammar.getAng();
        }

        heading = state.getHeading() - radians(angle);
        //print(" radians of gramm ang: " + radians(grammar.getAng()));
       //print(" new heading: " + heading);
        x = state.getX();
        y = state.getY();
        state = new TurtleState(x, y, heading);
      }

      if (str.charAt(j)=='-') {
        //turn right 
        float angle;

        if (j+1<str.length() && str.charAt(j+1)=='(') {
          String parameters = "";
          int k = 2;
          Boolean endParam=false;
          int lTally = 0;
          while(endParam==false && (j+k)<str.length()){
            if(str.charAt(j+k)=='('){
              lTally = lTally + 1;
            }
            if(str.charAt(j+k)==')'){
              lTally = lTally - 1;
            }
            if(lTally < 0){
              endParam = true;
            }
            if(endParam ==false){
              parameters = parameters + str.charAt(j+k);
              k = k+1;
            }
          }
         // println("\n"+parameters);
          float[] parameterList = parseParam(parameters);

          angle = parameterList[0];
        } else {

          angle = grammar.getAng();
        }

        heading = state.getHeading() + radians(angle);
        x = state.getX();
        y = state.getY();
        state = new TurtleState(x, y, heading);
      }
    }

    turtleStack.pop();
  }

  void forward(float sc) {
    float scale = sc;
   // stroke(0, 40, 16);

    //computing turtle movement using heading angle.

    float nx = state.getX() + (scale*len)*cos(state.getHeading());
    float ny = state.getY() + (scale*len)*sin(state.getHeading());
    line(state.getX(), state.getY(), nx, ny);
    //curve(state.getX(), state.getY(), nx, ny);
    heading = state.getHeading();
    x = nx;
    y = ny;

    state = new TurtleState(x, y, heading);
  }

  float[] parseParam(String parString) {
    //println(parString);
    String[] split = parString.split(",");
    float[] paramFloats = new float[split.length];
    for (int i = 0; i<paramFloats.length; i++) {
      Result parsed = Solver.evaluate(split[i]+ " + 0");
      //print(split[i]+" + 0");
      //print(parsed.answer);
      paramFloats[i] = parsed.answer.toFloat();
    }
    return paramFloats;
  }
}