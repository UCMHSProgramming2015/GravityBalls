int count = 30;



float[] x = new float[count];
float[] y = new float[count];
float[] velx = new float[count];
float[] vely = new float[count];
float[] diam = new float[count];

void setup() {
  size(600, 600);


  for (int i = 0; i < count; i++) {
    x[i] = random(width);
    y[i] = random(height);
    diam[i] = 10 + 10*i;
    velx[i] = random(-5, 5);
    vely[i] = random(-5, 5);
  }
}

void draw() {

  background(0);

  for (int i = 0; i < count; i++) {
    fill(random(255), random(255), random(255));
    ellipse(x[i], y[i], diam[i], diam[i]);
    x[i] += velx[i];
    y[i] += vely[i];


    if (x[i] + diam[i]/2 >= width) {
      velx[i] = -abs(velx[i]);
    } else if (x[i] - diam[i]/2 <= 0) {
      velx[i] = abs(velx[i]);
    }
    if (y[i] + diam[i]/2 >= height) {
      vely[i] = -abs(vely[i]);
    } else if (y[i] - diam[i]/2 <= 0) {
      vely[i] = abs(vely[i]);
    }
  }
}