//declare variables
int count = 10;
float[] x = new float[count];
float[] y = new float[count];
float[] diam = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float g;


void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for (int i = 0; i < count; i++) { 
    x[i] = 0;
    y[i] = 50;
    diam[i] = 50;
    velX[i] = random(10);
    velY[i] = 20;
    g = .5;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  fill(50, 150, 255);

  //draw ball
  for (int i = 0; i < count; i++) { 
    ellipse(x[i], y[i], diam[i], diam[i]);

    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];
    velY[i] = velY[i] + g;

    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i])*.3;
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
    if (y[i] + diam[i]/2 >= height && velY[i] >0) {
      velY[i] = 0;
      g = 0;
      velX[i] = velX[i]*.5;
    }
  }
}