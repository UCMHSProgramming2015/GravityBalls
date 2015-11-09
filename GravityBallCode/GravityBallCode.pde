//declare variables
float diam, g;
float [] x = new float [40];
float [] y = new float [40];
float [] velx = new float [40];
float [] vely = new float [40];


void setup() {
  //set size of canvas
  size(600, 600);

  //initialize variables
  for (int i=0; i<40; i++){
    x[i] = random(width);
    y[i] = random(height/2);
    diam = 40;
    g = 1;
    velx[i] = 8;
    vely[i] = 10;
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  for (int i=0; i<40; i++){
    //make the ball suitable for my[i] aesthetic theme
    noFill();
    strokeWeight(10);
    colorMode(HSB, 400);
    stroke(x[i],y[i],400);
    
    //draw ball
    ellipse(x[i], y[i], diam, diam);
  
    //add velocity[i] to position
    x[i] += velx[i];
    y[i] += vely[i];
    vely[i] += g;
    
    //bounce ball if it hits walls
    if (x[i] + diam/2 >= width) {
      velx[i] = -abs(velx[i]);    //if the ball hits the right wall, assign x[i] velocity[i] the negative version of itself
    } else if (x[i] - diam/2 <= 0) {
      velx[i] = abs(velx[i]);     //if the ball hits the left wall, assign x[i] velocity[i] the positive version of itself
    }
    if (y[i] + diam/2 >= height) {
      vely[i] = -abs(vely[i]) +2;
    } else if (y[i] - diam/2 <= 0) {
      vely[i] = abs(vely[i]);
    }
  }
}