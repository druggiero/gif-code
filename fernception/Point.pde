class Point {
  float x;
  float y;
  color c;

  Point(float xin, float yin) {
    x = xin;
    y = yin;
    c = color(0, 0, 0);
  }

  void setColor(color col) {
    c = col;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
}
