//declare variables
int count = 30;
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float diam, gravity;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  diam = 80;
  gravity = 0.2;
  for(int i = 0; i < count; i++)//for every ball
  {
    x[i] = random(diam / 2, width - diam / 2);
    y[i] = random(diam / 2, height - diam / 2);
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  for(int i = 0; i < count; i++)//for every ball
  {
    //draw ball
    ellipse(x[i], y[i], diam, diam);
  
    //add acceleration to velocity
    velY[i] += gravity;
    
    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];
  
    //bounce ball if it hits walls
    if (x[i] + diam/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam/2 >= height) {
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
  }
}