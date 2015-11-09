//declare variables
float x, y, velY, diam, grav;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  x = width/2;
  y = height/2;
  diam = 80;
  velY = random(0, 5);
  grav = 1;
}

void draw() {
  //draw background to cover previous frame
  background(0);
  
  //draw ball
  ellipse(x, y, diam, diam);

  //add velocity to position and acceleration to velocity
  velY += grav;
  y += velY;
 
  
 

  //bounce ball if it hits walls

  if (y + diam/2 >= height) {
    velY = -abs(velY);
    y = height - diam/2;
  } else if (y - diam/2 <= 0) {
    velY = abs(velY);
  }
}