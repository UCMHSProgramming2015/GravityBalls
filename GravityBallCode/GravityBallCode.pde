//declare variables
int count = 30;
float[] x = new float[count];
float[] y = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] g = new float [count];


void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for (int i = 0; i < count; i++) {
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = 80;
    velY[i] = random(0, 5);
    grav[i] = 1;
}

void draw() {
  //draw background to cover previous frame
  background(0);
  int i = 0;
  //draw ball
  for (int i = 0; i < count; i++) {
  ellipse(x[i], y[i], diam[i], diam[i]);

  //add velocity to position and acceleration to velocity
  velY[i] += grav;
  y[i] += velY[i];
 
  
 

  //bounce ball if it hits walls

  if (y + diam/2 >= height) {
    velY = -abs(velY);
    y = height - diam/2;
  } else if (y - diam/2 <= 0) {
    velY = abs(velY);
  }
  i++;
}
}