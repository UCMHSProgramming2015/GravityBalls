//make the array contain 50 components
int count = 20;
//initializes the pieces of the array
float[] x= new float[count];
float[] y = new float[count];
float[] velx= new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] grav = new float[count];
void setup() {
  //set size of canvas
  size(800, 600);
  int i = 0;
  //initialize variables
  while (i < count) {
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = 20;
    velx[i]= random(-5, 5);
    velY[i] = random(-5, 5);
    grav[i] = 0.1;
    i++;
  }
}

  void draw() {
  //draw background to cover previous frame
  background(0);
  int i = 0;
  //draw ball
  while (i < count) {
  ellipse(x[i], y[i], diam[i], diam[i]);

  //add velocity to position
  x[i]+= velx[i];
  y[i] += velY[i];
  velY[i] = velY[i] + grav[i];
  //bounce ball if it hits walls
  if (x[i]+ diam[i]/2 >= width) {
    velx[i]= -abs(velx[i]);    //if the ball hits the right wall, assign x[i]velocity the negative version of itself
  } else if (x[i]- diam[i]/2 <= 0) {
    velx[i]= abs(velx[i]);     //if the ball hits the left wall, assign x[i]velocity the positive version of itself
  }
  if (y[i] + diam[i]/2 >= height) {
    velY[i] = -abs(velY[i]);
  } else if (y[i] - diam[i]/2 <= 0) {
    velY[i] = abs(velY[i]);
  }
  i++;
  }
}