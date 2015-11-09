float x, y, velX, velY, diam, grav;
void setup() {
  size (800,600);

x= width/2;
y= height/2;
diam = 80;
velX = 0;
velY = 0;
grav = .8;
}
void draw() {
//  background(0);
  ellipse (x,y, diam, diam);
  velY+= grav;
  x+=velX;
  y+=velY;
  if (y+ diam/2 >= height) {
   velY= -abs(velY);
  }
}