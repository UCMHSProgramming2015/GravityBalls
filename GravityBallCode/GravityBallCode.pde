//declare variables
float[] x= new float [30];
float[] y= new float [30];
float[] velX= new float [30];
float[] velY= new float [30] ;
float diam; 
float a;
void setup() {
  //set size of canvas
  size(800, 600);
  for (int i=0; i<30; i++) { 
    //initialize variables
    x[i] = random(450);
    y[i] = random(100);
    diam = 30;
    velX[i] =5;
    velY[i] = 5;
    a=1;
  }
}

void draw() {
  //draw background to cover previous frame
  background(255);
  for (int i=0; i<30; i++) { 

    //draw ball
    fill(255, 204, 255);
    ellipse(x[i], y[i], diam, diam);
    velY[i] += a;
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
      y[i]=height- diam/2;
      velY[i] = -abs(velY[i]);
    } else if (y[i] - diam/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
    if (dist(x[i], y[i], mouseX, mouseY) <= diam/2 && height>= 0) {
      fill(210, 217, 255);
      velX[i]= -abs(velX[i]);
      velY[i]= -abs(velY[i]);
    }
  }
}