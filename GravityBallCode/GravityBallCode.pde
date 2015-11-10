//declare variables
int count = 30;
float[] x = new float[count];
float[] y = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] grav = new float [count];


void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for (int i = 0; i < count; i++) {
    x[i] = random(width);
    y[i] = random(height);
    diam[i] = 80;
    velY[i] = random(0, 5);
    grav[i] = 1;
}
}

void draw() {
  //draw background to cover previous frame
  background(0);
  //draw ball
  for (int i = 0; i < count; i++) {
   if (dist(x[i], y[i], mouseX, mouseY) < diam[i]/2) {
    fill(0, 0, 255, 125);
    stroke(random(255));
   }
  ellipse(x[i], y[i], diam[i], diam[i]);
  fill(255, 0, 0, 255);
  stroke(0);

  //add velocity to position and acceleration to velocity
  velY[i] += grav[i];
  y[i] += velY[i];
 
  
 

  //bounce ball if it hits walls

  if (y[i] + diam[i]/2 >= height) {
    velY[i] = -abs(velY[i]);
    y[i] = height - diam[i]/2;
  } else if (y[i] - diam[i]/2 <= 0) {
    velY[i] = abs(velY[i]);
  }
  i++;
  }
  }