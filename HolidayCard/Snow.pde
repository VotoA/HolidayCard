class Snow {
  float x;
  float y;
  float fall;
  float diameter;

  Snow(float uhhh) {
    x = random(0,width+1000);
    y = random(-1000,800);
    diameter = 8;
  }

  void display() {
    noStroke();
    fill(230);
    ellipse(x, y, 8, 8);
    y = y + 0.5;
  }
}
