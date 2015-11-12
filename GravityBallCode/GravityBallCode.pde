//make the array contain 50 components
int count = 1050;
//initializes the pieces of the array
float[] x= new float[count];
float[] y = new float[count];
float[] velx= new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float[] grav = new float[count];
void setup() {
  //set size of canvas
  size(1550, 800);
  int i = 0;
  //initialize variables
  while (i < count) {
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = 40;
    velx[i]= random(-5, 5);
    velY[i] = random(-5, 5);
    grav[i] =-.9;
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
   
  fill(random(255),random(255),random(255));} else if (x[i]- diam[i]/2 <= 0) {
      velx[i]= abs(velx[i]);     //if the ball hits the left wall, assign x[i]velocity the positive version of itself
    fill(random(255),random(255),random(255));}
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
      fill(random(255),random(255),random(255));
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
      fill(random(255),random(255),random(255));
    }
    i++;
  }
}