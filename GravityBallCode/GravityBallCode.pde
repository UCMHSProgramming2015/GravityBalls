//declare variables
float gravity, diam;
int count = 300;
//create arrays
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] colors = new float[count];

void setup() {
  //set size of canvas
  size(800, 600);
  gravity = 1;
  //initialize variables
  //create values in arrays
  for (int i = 0; i<count; i++) {
    x[i] = width/2;
    y[i] = 100;
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    colors[i]= random(0,255);
  }
  diam = 50;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball for each array
  for (int i = 0; i<count; i++) {
    noStroke();
    //different colors
    fill(colors[i]);
    ellipse(x[i], y[i], diam, diam);
    //add gravity
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
      y[i] = height-diam/2;
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
  }
}