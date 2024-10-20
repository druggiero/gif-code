/*{a,b,c,d,e,f}*/

float[] w1 = {0, 0, 0, 0.16, 0, 0};
float[] w2 = {0.85, 0.04, -0.04, 0.85, 0, -100};
float[] w3 = {0.2, -0.26, 0.23, 0.22, 0, -40};
float[] w4 = {-0.15, 0.28, 0.26, 0.24, 0, -19};

//float[] w1 = {0.5, 0, 0, 0.5, 1, 1};
//float[] w2 = {0.5, 0, 0, 0.5, 1, 200};
//float[] w3 = {0.5, 0, 0, 0.5, 200, 200};

Point[][] space1;
Point[][] space2;

PImage fernImg;

color white;
color black;

int iteration;
Boolean repeat;

void setup() {
  size(1300, 1600);
  white = color(255, 255, 255);
  black = color(0, 0, 0);
  fernImg = loadImage("fern.png");
  iteration = 0;
  repeat = false;

  space1 = new Point[width][height];
  space2 = new Point[width][height];

  for (int x = -width/2; x<width/2; x++) {
    for (int y = -height/2; y<height/2; y++) {
      space1[x+width/2][y+height/2] = new Point(x, y);
      space1[x+width/2][y+height/2].setColor(black);

      space2[x+width/2][y+height/2] = new Point(x, y);
      space2[x+width/2][y+height/2].setColor(black);
    }
  }

  for (int i=-140; i<150; i++) {
    for (int j=-542; j<542; j++) {
      space1[i+width/2][j+height/2].setColor(fernImg.pixels[(j+fernImg.height/2)*fernImg.width + i+fernImg.width/2]);
    }
  }

  for (int x = 0; x<width; x++) {
    for (int y = 0; y<height; y++) {
      set(x, y, space1[x][y].c);
    }
  }
  saveFrame("frames/#####.png");
}

void draw() {
  //background(white);
  println(iteration);


  //good for blowing around...
  //w2[1] = map(mouseY, 0, height, -0.12, 0.12);

  w2[1] = 0.07;

  //widens out, breaks apart
  //w3[4] = map(mouseX,0,width,-60,230);
  //w3[4] = 330;

  //The key size param, for whatever reason 
  //w2[5] = map(mouseX,0,width,-140,40);

  //how high the first frond starts up the rachis:
  //w4[5] = map(mouseY,0,height,-100,40);

  //wide side
  //w3[1] = map(mouseX,0,height,-0.8,0.8);

  //adjusts where the leaves sit
  //w3[5] = map(mouseY,0,height,-100,40);

  //growth?
  //w2[3] = map(mouseX,0,width,-0.1,1.5);

  if (iteration>=18) {
    w2[1] = map(mouseX, 0, width, 0.08, -0.03);
    println("yeah", w2[1]);
  }


  if (iteration>=20 && repeat==true) {
    for (int x = 0; x<width; x++) {
      for (int y = 0; y<height; y++) {
        space1[x][y].setColor(black);
      }
    }

    for (int i=-140; i<150; i++) {
      for (int j=-542; j<542; j++) {
        space1[i+width/2][j+height/2].setColor(fernImg.pixels[(j+fernImg.height/2)*fernImg.width + i+fernImg.width/2]);
      }
    }
    for (int x = 0; x<width; x++) {
      for (int y = 0; y<height; y++) {
        set(x, y, space1[x][y].c);
      }
    }

    iteration = 0;
  } else if ( (iteration>=20 && repeat==false) || iteration <20) {

    for (int x = -width/2; x<width/2; x++) {
      for (int y= -height/2; y<height/2; y++) {
        color currentCol = space1[x+width/2][y+height/2].c;
        if (currentCol != black) {
          float x1 = (w1[0]*x + w1[1]*y + w1[4]);
          float y1 = (w1[2]*x + w1[3]*y + w1[5]);
          float x2 = (w2[0]*x + w2[1]*y + w2[4]);
          float y2 = (w2[2]*x + w2[3]*y + w2[5]);
          float x3 = (w3[0]*x + w3[1]*y + w3[4]);
          float y3 = w3[2]*x + w3[3]*y + w3[5];
          float x4 = (w4[0]*x + w4[1]*y + w4[4]);
          float y4 = w4[2]*x + w4[3]*y + w4[5];
          space2[int(x1+width/2)][int(y1+height/2)].setColor(currentCol+color(0, 57, 0));
          //space2[int(x1+width/2)][int(y1+height/2)].setColor(currentCol);
          space2[int(x2+width/2)][int(y2+height/2)].setColor(currentCol);          
          space2[int(x3+width/2)][int(y3+height/2)].setColor(currentCol);  
          space2[int(x4+width/2)][int(y4+height/2)].setColor(currentCol);


          //silly color experiments
          /*
          space2[int(x2+width/2)][int(y2+height/2)].setColor(currentCol);          
           space2[int(x4+width/2)][int(y4+height/2)].setColor(color(255,100,0));
           //extra
           space2[int(x4+width/2)-100][int(y4+height/2)].setColor(color(0,100,55));
           space2[int(x3+width/2)][int(y3+height/2)].setColor(color(200,25,0));    
           */
        }
      }
    }
    for (int e = 0; e< width; e++) {
      for (int n = 0; n<height; n++) {
        space1[e][n].setColor(space2[e][n].c);
      }
    }

    for (int x = 0; x<width; x++) {
      for (int y = 0; y<height; y++) {
        set(x, y, space1[x][y].c);
      }
    }

    for (int x = 0; x<width; x++) {
      for (int y = 0; y<height; y++) {
        space2[x][y].setColor(black);
      }
    }
  }

  if (iteration<18) {
    //saveFrame("frames/#####.png");
  } else {
    if (frameCount%3==0) {
      //saveFrame("frames/#####.png");
    }
  }

  iteration++;
}
