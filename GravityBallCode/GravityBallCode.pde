float x, y, velX, velY, diam,gravity;

void setup() {
  size(800, 600);

  x = width/2;
  y = height/2;
  diam = 80;
  velX = random(-5, 5);
  velY = random(-5, 5);
  gravity = 0.3;
}

void draw() {
  background(0);

  ellipse(x, y, diam, diam);

  x += velX;
  y += velY;

  if (x + diam/2 >= width) {
    velX = -abs(velX);    
  } else if (x - diam/2 <= 0) {
    velX = abs(velX);   
  }
  if (y + diam/2 >= height) {
    velY = -abs(velY);
  } else if (y - diam/2 <= 0) {
    velY = abs(velY);
  }
  if (y > 0)
  {
    velY = velY + gravity;
  }
  if (y+diam/2 == height)
  {
    velY = 0;
  }
}