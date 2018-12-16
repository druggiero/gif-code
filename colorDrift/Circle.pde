class Circle {

  Point center;
  int radius;
  ArrayList<Point> points;

  Circle(Point cen, int rad) {
    center = cen;
    radius = rad;
    points = new ArrayList<Point>();


  }

  void plot() {

    //Processing ellipse stuff:
    ellipseMode(RADIUS);
    ellipse(center.x, center.y, radius,radius);
     

  }
}