//declare array variables
int i=0;
int count=30; 
float []x=new float[count];
float []y=new float[count];
float []velX=new float[count];
float []velY=new float[count]; 
float []grav=new float[count];
float []diam=new float[count];

void setup() {
  //set size of canvas
  size(800, 600);

  //while i<count, initialize variable, add 1 to i for until i gets to couny
  while (i<count) {
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = random(15, 30);
    velX[i] = random(-5, 5);
    velY[i] = random(-5, 5);
    grav[i]=random(.1, .3);
    i++;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0, 255, 0);

  //for int i is equal 0, and i is less than count, add 1 to i
  //draw sphere
  for (int i=0; i<count; i++) {
    
    fill(i*random(9), i*random(9), i*random(9));

    ellipse(x[i], y[i], diam[i], diam[i]);

    //add velocity and gravity to position
    velY[i]+=grav[i];
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
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]);
    }
  }
}