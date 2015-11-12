//declare variables
int screen; //variable that changes canvas
int count = 30; //number of variables or the number of ellipses
int i = 0; //intitailize all the variables needed
float grav;
float[] x = new float [count];
float[] y = new float [count];
float[] velX = new float [count];
float[] velY = new float [count];
float[] diam = new float [count];
void setup() {
  //set size of canvas
  size(800, 600);
  //give each variables values
  while (i < count) {
    x[i] = width/2+random(-10, 10); 
    y[i] = height/2+random(-10, 10);
    diam[i] = 50; 
    velX[i] = random(-4, 4); 
    velY[i] = random(-5, 5);
    i++; //variable increases until reaches count
  }
  screen = 0; //the intital screen of the program
  grav = 0.1; //value for gravity that affects the ellipses
}

void draw() {
  if (screen ==0) { //when the screen is 0 it displays text
    background(0);
    fill(random(255), random(255), random(255)); //changes textfill
    textSize(32); //changes text size
    text("Click to bounce balls!", width/2-160, height/2);
  }
  if (mousePressed == true) { //when mouse is pressed it changes the value of the screen
    screen = 1;
  }
  if (screen == 1) { //when screen is one it displays ellipses
    circle();
  }
}
void circle() {
  //draw background to cover previous frame
  background(0);
  for (int i = 0; i < count; i++) { //using for loop variable is created and increased
    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]); //draw the ellipses in relation to the i variable
    //add velocity to position
    velY[i] = velY[i] + grav; //adds the value of velocity to gravity
    x[i] += velX[i]; //increase x speed of ellipse
    y[i] += velY[i];  //increase y speed of ellipse
    //bounce ball if it hits walls of the canvas
    if (x[i] + diam[i]/2 >= width) {
      velX[i] = -abs(velX[i]); //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velX[i] = abs(velX[i]); //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      velY[i] = -abs(velY[i]); //if the ball hits the bottom wall, assign y velocity the negative version of itself
    } else if (y[i] - diam[i]/2 <= 0) {
      velY[i] = abs(velY[i]); //if the ball hits the top wall, assign x velocity the positive version of itself
    }
  }
}
void mousePressed(){
      if (mousePressed) {
      fill(random(255), random(255), random(255)); //changes the fill of the ellipses
    }
}