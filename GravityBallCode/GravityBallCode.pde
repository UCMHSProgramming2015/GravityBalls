//declare variables
float diam, g;
float [] x = new float [30];
float [] y = new float [30];
float [] velx = new float [30];
float [] vely = new float [30];
int colorSet = 0;

void setup() {
  //set size of canvas
  size(600, 600);
  frameRate(30);

  //initialize variables
  for (int i=0; i<30; i++){
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

  for (int i=0; i<30; i++){
    //make the ball suitable for my aesthetic theme
    noFill();
    strokeWeight(12);
    colorMode(HSB, 700);
    if(colorSet == 0) {
      stroke(x[i],y[i],800,400);
    } else if(colorSet == 1){
      stroke(y[i],x[i],800,400);
    }
    
    //make balls jump when you poke them
    if (dist(x[i],y[i], mouseX, mouseY) < diam/2) {
      vely[i] = -20;
    } 
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
      vely[i] = -abs(vely[i]) +4;
      y[i] = height-diam/2;
    } else if (y[i] - diam/2 <= 0) {
      vely[i] = abs(vely[i]);
    }
  }
}

void mousePressed() {
  //change colors when mouse is pressed
   if (colorSet == 0) {
     colorSet = 1;
   }
   else if (colorSet == 1) {
     colorSet = 0;
   }
}

void keyPressed(){
  for (int i=0; i<30; i++){
    if (key == ' ') {
      y[i] = 0;
    }
  }
}