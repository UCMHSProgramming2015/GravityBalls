int count = 30;
float[] x = new float[count];
float[] y = new float[count];
float[] velX = new float[count];
float[] velY = new float[count];
float[] diam = new float[count];
float g;

void setup() {
  size(800, 600);
  g = .1;
  for (int i = 0; i < count; i++){
  x[i] = random(width);
  y[i] = random(height);
  diam[i] = 40;
  velX[i] = random(-7, 7);
  velY[i] = random(-7, 7);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < count; i++){
  ellipse(x[i], y[i], diam[i], diam[i]);
  velY[i] = velY[i] + g;
  x[i] += velX[i];
  y[i] += velY[i];
  if (x[i] + diam[i]/2 >= width) {
    velX[i] = -abs(velX[i]);
  } else if (x[i] - diam[i]/2 <= 0) {
    velX[i] = abs(velX[i]);
  }
  if (y[i] + diam[i]/2 >= height) {
    velY[i] = -abs(velY[i]);
  } else if (y[i] - diam[i]/2 <= 0){
    velY[i] = abs(velY[i]);
  }
  }
}