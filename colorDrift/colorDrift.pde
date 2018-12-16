Circle circ0;
Circle circ1;
Circle circ2;

float theta;

void setup() {
  size(860, 840);
  background(255);
  strokeWeight(13);

  circ0 = new Circle(new Point(width/2 - 200, height/2), 185);
  circ1 = new Circle(new Point(width/2 + 200, height/2), 185);
  circ2 = new Circle(new Point(width/2, height/2 + 200), 185);

  theta = PI/2;
}

void draw() {
  background(255);

  noFill();

  noStroke();
  //stroke(80, 185);


  float x = (width/2 - 100) + 100 * cos(theta);
  float y = (height/2) + 100 * sin(-theta);
  /*Convert from Polar coordinates to Cartesian coordinates
   using Parametric Circle Equation:
   x = h + r * cos(theta)
   y = k + r * sin(theta)
   */

  circ0.center.x = x;
  circ0.center.y = y;

  x = (width/2 + 100) + 100 * cos(theta);
  y = (height/2) + 100 * sin(theta);

  circ1.center.x = x;
  circ1.center.y = y;


  x  = (width/2) + 100 * sin(theta);
  y = (height/2 +100) + 100 * cos(theta);

  circ2.center.x = x;
  circ2.center.y = y;

  theta = theta + 0.025;

  color red = color(255, 0, 0);
  color green = color(0, 255, 0);
  color blue = color(0, 0, 255);


  fillIn(circ0, red);
  fillIn(circ1, green); 
  fillIn(circ2, blue);


  intersection(circ0, circ1, red, green);
  intersection(circ0, circ2, red, blue);
  intersection(circ1, circ2, green, blue);
  
  intersection(circ0, circ1, circ2, red, green , blue);

  circ0.plot();
  circ1.plot();
  circ2.plot();
  
  
  if (frameCount % 6==0) {
    //saveFrame("#######.jpg");
  }
}


void fillIn(Circle c, color col) {
  for (float x = c.center.x-c.radius; x <= c.center.x + c.radius; x++) {
    for (float y = c.center.y-c.radius; y<= c.center.y + c.radius; y++) {
      if (dist(x, y, c.center.x, c.center.y)<= c.radius) {
        set(int(x), int(y), col);
      }
    }
  }
}

void intersection(Circle a, Circle b, color col0, color col1) {
  for (float x = a.center.x-a.radius; x <= a.center.x + a.radius; x++) {
    for (float y = a.center.y-a.radius; y<= a.center.y + a.radius; y++) {
      if (dist(x, y, a.center.x, a.center.y)<= a.radius && dist(x, y, b.center.x, b.center.y)<=b.radius) {

        //need to take both colors into account
        color col = color(red(col0)+red(col1), green(col0)+green(col1), blue(col0) + blue(col1));

        set(int(x), int(y), col);
      }
    }
  }
}


void intersection(Circle a, Circle b, Circle c, color col0, color col1, color col2) {
  for (float x = a.center.x-a.radius; x <= a.center.x + a.radius; x++) {
    for (float y = a.center.y-a.radius; y<= a.center.y + a.radius; y++) {
      if (dist(x, y, a.center.x, a.center.y)<= a.radius && dist(x, y, b.center.x, b.center.y)<=b.radius) {
        if (dist(x, y, a.center.x, a.center.y)<= a.radius && dist(x, y, c.center.x, c.center.y)<=c.radius) {
          //need to take both colors into account
          color col = color(red(col0)+red(col1) +red(col2), green(col0)+green(col1) + green(col2), blue(col0) + blue(col1) + blue(col2));

          set(int(x), int(y), col);
        }
      }
    }
  }
}



