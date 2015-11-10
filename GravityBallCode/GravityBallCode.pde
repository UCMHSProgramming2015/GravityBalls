//declare variables
float x, y, velX, velY, diam;
float earthg;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  x = width/2;
  y = height/2;
  diam = 80;
  velX = random(-5, 5);
  velY = random(-5, 5);
  earthg = 0.1;
}

void draw() {
  //draw background to cover previous frame
  background(0);
  fill(157, 243, 255);
  //draw ball
  ellipse(x, y, diam, diam);
  fill(255);
  textSize(50);
  text("LEND ME YOUR ENERGY!!!", width/6, height/6);
  text("~Son Goku", width/6, height/3.5);
  //add velocity to position
  x += velX;
  y += velY;
  velY = velY += earthg;

  //bounce ball if it hits walls
  if (x + diam/2 >= width) {
    velX = -abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x - diam/2 <= 0) {
    velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y + diam/2 >= height) {
    velY = -abs(velY);
  } else if (y - diam/2 <= 0) {
    velY = abs(velY);
  }
}