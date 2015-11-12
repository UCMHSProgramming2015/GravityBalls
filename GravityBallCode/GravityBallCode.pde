//declare variables
int c = 1000;
float x[] = new float[c];
float y[] = new float[c];
float velX[] = new float[c];
float velY[] = new float[c];
float red[] = new float [c];
float green[] = new float [c];
float blue[] = new float [c];
float b[] = new float [c];
float diam;
float g;

void setup() {
  //set size of canvas
  size(800, 600);
  diam = 5;
  g = .0981;

  //initialize variables
  for(int i = 0; i < c; i++){
    x[i] = random(0, width);
    y[i] = random(0, height/2);
    velX[i] = random(-2, 3);
    velY[i] = random(-2, 3);
    red[i] = random(255);
    green[i] = random(255);
    blue[i] = random(255);
    b[i] = 0;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  for(int i =0; i < c; i++){
  fill(red[i], green[i], blue[i]);
  ellipse(x[i], y[i], diam, diam);
  //add velocity to position
  x[i] += velX[i];
  y[i] += velY[i];
  velY[i] += g;

  //bounce ball if it hits walls
  if (x[i] + diam/2 >= width) {
    velX[i] *= -0.9;    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (x[i] - diam/2 <= 0) {
    velX[i] *= -0.9;     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (y[i] + diam/2 >= height) {
    y[i] = height;
    velY[i] *= -0.88;
    b[i] += 1;
  } else if (y[i] - diam/2 <= 0) {
    velY[i] += -0.88;
  }
  if(b[i] >=25){
    y[i] = height;
    velY[i] = 0;
    velX[i] -= .005;
    if(velX[i] <= 0){
      velX[i] = 0;
    }
  }

  }
}