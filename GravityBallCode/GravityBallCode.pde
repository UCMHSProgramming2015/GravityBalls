//declare variables
int quantity = 30;
float g = 0.3;
float[] x = new float[quantity];
float[] y = new float[quantity];
float[] velX = new float[quantity];
float[] velY = new float[quantity];
float[] diam = new float[quantity];

void setup() {
  //set size of canvas
  size(800, 600);
  colorMode(HSB, width);
  noStroke();
  smooth();

  //initialize variables
  for (int i = 0; i < quantity; i++) {
    x[i] = width/2;
    y[i] = height;
    diam[i] = random(50);
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i = 0; i < quantity; i++) {
    //draw ball
    fill(x[i], y[i], 1000);
    ellipse(x[i], y[i], diam[i], diam[i]);

    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];
    //add acceleration to velocity... upside down for no reason
    velY[i] -= g;

    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
      velX[i] *= .9;
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
      velX[i] *= .9;
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
      velY[i] *= .9;
    }
  }
}