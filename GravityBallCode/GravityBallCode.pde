//declare variables
float x, y, velX, velY, diam, g;

void setup() {
  //set size of canvas
  size(600, 600);

  //initialize variables
  x = width/2;
  y = height/2;
  diam = 80;
  g = 1;
  velX = 8;
  velY = 10;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //make the ball suitable for my aesthetic theme
  noFill();
  strokeWeight(15);
  colorMode(HSB, 400);
  stroke(x,y,400);
  
  //draw ball
  ellipse(x, y, diam, diam);

  //add velocity to position
  //x += velX;
  y += velY;
  velY += g;

  //bounce ball if it hits walls
  if (x + diam/2 >= width) {
    velX = -abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x - diam/2 <= 0) {
    velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y + diam/2 >= height) {
    velY = -abs(velY) +2;
  } else if (y - diam/2 <= 0) {
    velY = abs(velY);
  }
  if (y + diam/2 >= height && velY>=0) {
    g=0;
  }
}