//declare variables
float x, y, velX, velY, diam, grav;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  x = width/2;
  y = height/2;
  diam = 80;
  grav = .3;
  velX = 2;
  velY = 0;
 
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(x, y, diam, diam);
  
  velY += grav;  //acceleration: velY = velY + grav ... velocity slightly increases over time = acceleration 
  x += velX;  //add velocity to position
  y += velY;  //add velocity to position
  
  //bounce ball if it hits walls
  if(y + diam/2 >= height){
    velY = -abs(velY);
  }
  
  if (x + diam/2 >= width) {
    velX = -abs(velX);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x - diam/2 <= 0) {
    velX = abs(velX);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  
}