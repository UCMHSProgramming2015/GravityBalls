//declare variables

int count = 30; // sets count
float [] x  = new float[count];
float [] y = new float[count];
float [] velx = new float[count];
float [] vely = new float[count];
float [] diam = new float[count];
float [] gravity = new float[count]; //defines variables 
void setup() {
 
  size(800, 600);  //set size of canvas

  for (int i = 0; i < count; i++) { 
    //initialize variables
    x [i]  = width/2;
    y [i] = height/2;
    diam [i] = 50;
    velx [i] = random(3, 7);
    vely [i] = random(3, 7);
    gravity [i] = .5; //sets speed of acceleration
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i = 0; i < count; i++) {
    vely [i] += gravity [i]; //adds gravity to accelaration

    //draw ball
    x [i] += velx [i] ;
    y [i] += vely [i] ;
    ellipse(x [i], y [i], diam [i], diam [i]);

    //bounce ball if it hits walls
    if (x [i] + diam [i]/2 >= width) {
      velx [i] = -abs(velx [i]);    //if the ball hits the right wall, assign x [i] velocity [i] the negative version of itself
    } else if (x [i] - diam [i]/2 <= 0) {
      velx [i] = abs(velx [i]);     //if the ball hits the left wall, assign x [i] velocity [i] the positive version of itself
    }
    if (y [i] + diam [i]/2 >= height) { //if ball hits bottom wall, reverse
      vely [i] = -abs(vely [i]);
      y [i] = height - diam[i]/2 ;
    }
  }
}