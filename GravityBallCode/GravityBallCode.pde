//declare variables
int count=30;
float []x=new float [count];
float []y=new float [count];
float []velX=new float [count];
float []velY=new float [count];
float []diam= new float [count];
float []grav=new float [count];

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for (int i=0; i<count; i++){
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = random(80);
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    grav[i]=.2;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  for (int i=0; i<count; i++){
   
    velY[i] += grav[i];
    ellipse(x[i], y[i], diam[i], diam[i]);
    fill(random(255),random(255),random(255));
    x[i] += velX[i];
    y[i]+= velY[i];
    

  //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]);
      y[i]=height-diam[i]/2;
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
  }
}