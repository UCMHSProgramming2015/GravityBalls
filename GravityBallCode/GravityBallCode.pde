//declare variables
int num = 1;
int i = 0;
float[] x = new float[num];
float[] y = new float[num];
float[] velX = new float[num];
float[] velY = new float[num];
float[] diam = new float [num];
float grav;

void setup() {
  //set size of canvas
  size(800, 600);
while(i < num){
  //initialize variables
  x[i] = random(80,720);
  y[i] = height/2;
  diam[i] = 80;
  velX[i] = random(-5,5);
  velY[i] = random(-4,4);
  grav = .1;
  i++;
}
}

void draw() {
  //draw background to cover previous frame
  background(0);
  
for(int i = 0; i < num; i++){

  //draw ball
  ellipse(x[i], y[i], diam[i], diam[i]);
  fill(random(255),random(255),random(255));

  //add velocity to position
  x[i] += 0;
  y[i] += velY[i];
  velY[i] += grav;

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
}
}