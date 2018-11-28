Snow[] flakes=new Snow[10000];
PImage photo;

void setup() {
  size(800, 800);
  photo = loadImage("data/hat.png");
   photo.resize(125,125);
  for (int i=0; i<flakes.length; i++) {
    flakes[i] = new Snow(random(1, 20));
  }
}

void draw() {
  background (0);
  rect (0, 700, 800, 100);
  fill(235,160,70);
  ellipse(400,600,300,100);
  ellipse(275,550,100,100);
  rect(300,600,20,100);
  rect(500,600,20,100);
  rect(450,600,20,100);
  rect(350,600,20,100);
  rect(540,600,6,85);
  fill(0);
  rect(480,558,8,100);
  rect(450,558,8,100);
  rect(420,558,8,100);
  rect(390,558,8,100);
  rect(370,558,8,100);
  rect(350,558,8,100);
  rect(330,558,8,100);
  fill(0,255,0);
  ellipse(500,500,50,50);
  for (int i=0; i<flakes.length; i++) { 
    flakes[i].display();
  }
   image(photo, 225, 410);
}

class Snow {
  float x;
  float y;
  float fall;
  float diameter;

  Snow(float uhhh) {
    x = random(0,width+1000);
    y = random(-10000,800);
    diameter = 8;
  }

  void display() {
    noStroke();
    fill(230);
    ellipse(x, y, 8, 8);
    y = y + 0.5;
  }
}
