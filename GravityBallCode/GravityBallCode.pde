//declare variables
float g;
int count = 2880;
float []x = new float [count];
float []y= new float [count];
float []velX = new float [count];
float []velY = new float [count];
float []diam = new float [count];
void setup() {
  //set size of canvas

  size(800, 600);
  for (int i=0; i < count; i++) {
    //initialize variables
    x[i] = width/2;
    y[i] = height/2;
    diam[i] = random(8);
    velX[i] = random(-1,1);
    velY[i]= random(5);
    g =.1;
    ellipse(375, 305, 10, 10);
    ellipse(410, 305, 10, 10);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

mouseClicked(); {
  for (int i=0; i < count; i++) { //for statement adding arrays 

    //draw ball
    velY[i]= velY[i] + g; //adding gravity
    fill(255, 0, random(0, 25)); //red
    noStroke();  //no line
    ellipse(x[i], y[i], diam[i], diam[i]); //draw ellipse

    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];



    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]); //if the ball hits the right wall, assign x velocity the negative version of itself
      velY[i] = abs(velY[i])*2;
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]);     //if the ball hits the left wall, assign x velocity the positive version of itself
      velY[i] = abs(velY[i])*2;
    }
    if (y[i] + diam[i]/2 >= height) { //bounce at bottom 
      velY[i] = -abs(velY[i])*.65; // reduce velY
    } else if (y[i] - diam[i]/2 <= 0) { //bounce at top
      velY[i] = abs(velY[i]);
    }
    if (y[i] + diam[i]/2 >= height && velY[i] > 0) { //slowing velY at botom 
      velY[i] = 0;
      g = 0;
    }
    if (y[i] + diam[i]/2 >= height && velY[i] > 0 && velX[i] > 0) { //slowing velX at bottom
      velY[i] = 0;
      g=0;
      velX[i] = velX[i] *.5;
    }
    if (y[i] > height+2) { //keeps balls from going off screen 
      y[i]= height -1;
      velX[i]= velX[i]*.25;
    }
  }
  }
  fill(255);
  ellipse(400, 300, 75, 75);
  ellipse(400, 350, 65, 150);
  fill(0);
  stroke(50);
  strokeWeight(5);
  line(365, 305, 380, 305);
  line(400, 305, 415, 305);
  // ellipse(375, 305, 10, 10);
  // ellipse(410, 305, 10, 10);
  strokeWeight(2);
  ellipse(390, 315, 25, 5);
}