//declare variables
int count=30;

float [] x = new float [count];
float [] y = new float [count];
float [] velx = new float [count];
float [] velY = new float [count];
float [] diam = new float [count];
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for (int i=0; i < count; i++) {
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = 50;
    velx[i] = random(-5, 5);
    velY[i] = random(-5, 5);
  }
}
void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  for (int i=0; i <count; i++) {
    ellipse(x[i], y[i], diam[i], diam[i]);
    //add velocity to position
    x[i] += velx[i];
    y[i] += velY[i];


    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velx[i] = -abs(velx[i]);    //if the ball hits the right wall, assign x[0] velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velx[i] = abs(velx[i]);     //if the ball hits the left wall, assign x[0] velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
    if (x[i] + diam[i] >= width) {
      velx[i] = -abs(velx[i]);    //if the ball hits the right wall, assign x[0] velocity the negative version of itself
    } else if (x[i] - diam[i] <= 0) {
      velx[i] = abs(velx[i]);     //if the ball hits the left wall, assign x[0] velocity the positive version of itself
    }
    if (y[i]+ diam[i] >= height) {
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam[i] <= 0) {
      velY[i] = abs(velY[i]);
    }
  }
}