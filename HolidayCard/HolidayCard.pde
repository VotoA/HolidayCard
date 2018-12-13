Snow[] flakes = new Snow[200];
Light[] lights = new Light[60];
PImage photo;
int time;
int resetTime = 1000;
void setup()
{
  size(800, 800);
  background(0);
  //photo = loadImage("Desktop/hat.png");
  //photo.resize(125,125);
  for (int i=0; i<flakes.length; i++) {
    flakes[i] = new Snow(random(1, 20));
  }
  int tempX = 25;
  int tempY = 25;
  int tempColor = 1;
  for(int i = 0; i<60; i++)
  {
    lights[i]=(new Light(tempX, tempY, 40, tempColor));
    if(tempColor == 3){
      tempColor = 1;
    } else {
      tempColor++;
    }
    if(i < 15){
      tempX+=50;
    }else if (i < 30){
      tempY+=50;
    }else if (i < 45){
      tempX-=50;
    }else{
      tempY-=50;
    }
  }
  time = millis();
}
void draw()
{
  background (0);
  fill(255, 255, 255);
  rect (0, 700, 800, 100);
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
  rect(450,530,8,100);
  rect(420,528,8,100);
  rect(390,528,8,100);
  rect(370,528,8,100);
  rect(350,528,8,100);
  rect(330,528,8,100);
  fill(0,255,0);
  ellipse(258,550,15,15);
  ellipse(293,550,15,15);
  for (int i=0; i<flakes.length; i++) { 
    flakes[i].display();
  }
  //image(photo, 225, 410);
  int tempTime = millis() - time;
    if (tempTime > resetTime) {
      for(int i = 0; i < lights.length; i++)
      {
        lights[i].flash();
      }
      time = millis();
    }
  for(int i = 0; i < lights.length; i++)
    {
      lights[i].show();
    }
}
