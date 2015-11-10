//declare variables
int count = 30;

float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] gravity = new float[count];

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for (int i=0; i < count; i++) {
    x[i] = 0;
    y[i] = 0;
    diam[i] = 80;
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    gravity[i] = .5;
    i++;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  for (int i=0; i < count; i++) { 
    noStroke();
    fill(x[i], y[i], 900, 80);
    colorMode(HSB, 900);
    ellipse(x[i], y[i], diam[i], diam[i]);


    //add velocity to position

    velY[i] += gravity[i];
    velY[i] *= 0.99;

    x[i] += velX[i];
    y[i] += velY[i];

    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
      y[i] = height - diam[i]/2;
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
    if (y[i] == height - diam[i]/2) {
      velY[i] = -abs(velY[i]);
      ;
    }
    if (dist(x[i], y[i], mouseX, mouseY) <= diam[i]/2) {
      fill(255);
      ellipse(x[i], y[i], 2*diam[i], 2*diam[i]);
      translate (-27, -20);
      fill(235, 235, 0);
      stroke(240, 230, 140);
      ellipse(x[i], y[i], 50, 50);

      fill(235, 235, 0);
      stroke(240, 230, 140);
      arc(x[i]+50, y[i]+20, 70, 75, 0, PI);

      fill(235, 235, 0);
      stroke(0, 0, 0);
      arc(x[i]+50, y[i]+35, 25, 20, 0, PI);

      noStroke();
      fill(255, 162, 0);
      triangle(x[i]-20, y[i]+15, x[i]-35, y[i]+10, x[i]-25, y[i]);

      fill(235, 235, 0);
      stroke(240, 230, 140);
      ellipse(x[i], y[i], 50, 50);

      fill(0, 0, 0);
      noStroke();
      ellipse(x[i]-7, y[i]-3, 5, 5);
      velY[i]=-15;
      resetMatrix();
    }
    
  }
}