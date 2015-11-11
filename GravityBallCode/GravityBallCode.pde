//declare variables
float x, y, velX, velY, diam, aY;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  x = width/2;
  y = height/2;
  aY = 1;
  diam = 80;
  velX = random(-5, 5);
  velY = random(-5, 5);
}

void draw() {
  
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(x, y, diam, diam);

  //add velocity to position
  x = x+velX;
  velY = velY+aY;
  y = y+velY;
  
  //when the ball reaches the bottom of the screen, it stops
  while (y>=height) {
    aY = 0;
    x = x+velX;
  }
  
  //bounce ball if it hits walls
  if (x + diam/2 >= width) {
    velX = -abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x - diam/2 <= 0) {
    velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y + diam/2 >= height) {
    velY = -abs(velY); //if the ball hits the bottom wall, assign y velocity the negative version of itself
  } else if (y - diam/2 <= 0) {
    velY = abs(velY); //if the ball hits the top wall, assign y velocity the negative version of itself
  }
}