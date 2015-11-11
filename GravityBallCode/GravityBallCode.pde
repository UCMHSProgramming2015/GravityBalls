int count = 4;




//declare variables, initialize array[i]s
float [] x = new float [count];
float [] y = new float [count]; 
float [] velx = new float [count]; 
float [] vely= new float [count]; 
float [] diam = new float [count]; 
float [] g = new float [count]; 
float [] f = new float [count];

void setup() {
  //set size of canvas
  size(800, 600);

  //make lots of balls
  for (int i = 0; i < count; i++) {
    x[i] = random(width);
    y[i] = random(0, 300);
    diam[i] = random(20, 60);
    velx[i] = random(-20, 20);
    vely[i] = random(-20, 20);
    g[i] = 0.2;
    f[i] = 0.9555;
  }
}

void draw() {
  frameRate(300); 
  //draw backg[i]round to cover previous frame
  background(0);

  for (int i = 0; i < count; i ++) {
    stroke(random(194), random(228), random(240)); //gives ball random stroke
    strokeWeight(3); // makes stroke thicker
    vely[i] +=g[i];


    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);

    //add velocity[i] to position
    x[i] += velx[i];
    y[i] += vely[i];


    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velx[i] = -abs(velx[i]);    //if the ball hits the rig[i]ht wall, assig[i]n x[i] velocity[i] the neg[i]ative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velx[i] = abs(velx[i]);     //if the ball hits the left wall, assig[i]n x[i] velocity[i] the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      vely[i] = -abs(vely[i]) + g[i];
      y[i] = height - diam[i]/2; // prevents ball from going below screen
      if (vely[i] <= 0){
      velx[i] = velx[i]*f[i]; //gives ball friction so it'll roll to a stop
      }
    } else if (y[i] - diam[i]/2 <= 0) {
      vely[i] = abs(vely[i]) + g[i];
    }
  }
}