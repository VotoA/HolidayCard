class Light
{
  int x;
  int y;
  int size;
  int col;
  color c;
  Light(int x, int y, int size, int col)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    this.col = col;
    if(col == 1){
      c = color(220, 0, 0);
    } else if (col == 2){
      c = color(0, 220, 0);
    } else {
      c = color(0, 0, 220);
    }
  }
  void flash()
  {
    if(col == 1){
      c = color(220, 0, 0);
      col++;
    } else if (col == 2){
      c = color(0, 220, 0);
      col++;
    } else {
      c = color(0, 0, 220);
      col=1;
    }
  }
  void show()
  {
    fill(c);
    ellipse(x, y, size, size);
  }
}
