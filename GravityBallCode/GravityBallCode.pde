float[] x = new float[30];
float[] y = new float[30];
float[] diam = new float[30];
float[] velX = new float[30];
float[] velY = new float[30];
float[] grav = new float[30];

void setup() {
  //set size of canvas
  size(800, 600);
  textSize(25);

  //initialize variables
    for (int i = 0; i < 30; i++) {
    x[i] = random(0, width);
    y[i] = height * .1;
    diam[i] = 80;
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    grav[i] = .3;
  }
}

void draw() {
  //draw background to cover previous frame
    background(0);
  for (int i = 0; i < 30; i++) {
    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);
    //add velocity to position
    velY[i] += grav[i];
    y[i] += velY[i];
      //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
    if(dist(x[i], y[i], mouseX, mouseY) < (40)){
      fill(random(255), random(255), random(255));
     text("This shouldn't have been as hard as I made it...", 100, 100); 
    }
  }
}