//declare variables
int num = 100;
float [] x = new float[num];
float [] y = new float[num];
float [] velX = new float[num];
float [] velY = new float[num];
float [] diam = new float[num];
color [] c = new color[num];
float g = 1;

void setup() {
  //set size of canvas and background
  size(800, 600);
  background(0);

  //initialize variables
  for(int i = 0; i < num; i++) {
    c[i] = color(random(128,255),128);
    diam[i] = random(20,50);
    x[i] = random(diam[i]/2,width-diam[i]/2);
    y[i] = random(diam[i]/2,height-diam[i]/2);
    velX[i] = -2+round(random(0,1))*random(2, 10);    //make sure velocity is never too small or 0
    velY[i] = -2+round(random(0,1))*random(2, 10);    //make sure velocity is never too small or 0
  }
}

void draw() {
  //draw a translucent rectangle to cover previous frame
  fill(0,100);
  rect(-1,-1,width+2,height+2);
  
  strokeWeight(5);
  stroke(255,0,0);
  line(pmouseX,pmouseY,mouseX,mouseY);      //draw a streak
  
  noStroke();
  for(int i = 0; i < num; i++) {
    if(dist(x[i], round(y[i]), mouseX, mouseY) <= diam[i]/2) {
      c[i] = color(255,0,0);      //color the balls that the mouse touches red
    } else {
      c[i] = color(random(128,255),128);
    }
    
    //draw ball
    fill(c[i]);
    ellipse(x[i], y[i], diam[i], diam[i]);

    //add velocity to position
    x[i] += velX[i];
    y[i] += velY[i];
  
    //bounce ball if it hits walls
    if (x[i] + diam[i]/2 >= width || x[i] - diam[i]/2 <= 0) {
      velX[i] *= -1;    //if the ball hits the side wall, assign x velocity the negative version of itself
    }
    if (y[i] + diam[i]/2 >= height || y[i] - diam[i]/2 <= 0) {
      velY[i] *= -1;    //if the ball hits the top or bottom; assign x velocity the negative version of itself
    } else {
      velY[i] += g;
    }
  }
}