//declare variables
int q = 500;
float[] y = new float [q];
float[] velX = new float [q];
float[] velY = new float [q];
float[] diam = new float [q];
float[] x = new float [q];
float gravity = .5;
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables

  for (int i = 0; i < q; i++) {
    x[i] = random(width);
    y[i] = random(height);
    diam[i] = random(10, 20);
    velX[i] = random(-5, 6);
    velY[i] = random(-5, 6);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  for (int i = 0; i < q; i++) {
    fill(random(255), random(255), 0);
    x[i] += velX[i];
    velY[i] = velY[i] + gravity;
    y[i] += velY[i];
    ellipse(x[i], y[i], diam[i], diam[i]);
    if (x[i] + diam[i] >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i] <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i] >= height) {
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam[i] <= 0) {
      velY[i] = abs(velY[i]);
    }
  }
}