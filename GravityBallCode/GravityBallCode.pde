//declare variables
int count = 30;

float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float [count];
float[] velY = new float [count];
float[] diam = new float [count];
float[] grav = new float [count];

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  
  for (int i = 0; i < count; i++){
  x[i] = width/2;
  y[i] = height/2;
  diam[i] = 80;
  grav[i] = .3;
  velX[i] = 2;
  velY[i] = 0;
  i++;
  }
 
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