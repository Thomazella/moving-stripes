int i = 0;
float red;
float green;
float blue;
float gray;
int speed;
float random = 0;
float random_red = random;
float random_green = random;
float random_blue = random;
float random_gray = random;

void updateColors() {
  float red_alwaysPositive;
  red = map( mouseX,width, 0,0,1) + random_red;

  gray = map(mouseY,height,0,0,1) + random_gray;

  blue = 1 - pow(red,2) + random_blue;

  if (red < 0) {
    red_alwaysPositive = 0.05;
  } else {
    red_alwaysPositive = red;
  }
  green = pow(red_alwaysPositive * 1.4,0.3) - 0.32  + random_green;
}

void updateSpeed() {
  int speed_min = 10;
  int speed_max = 145;
  float X = abs(map(mouseX,width ,0,1,-1));
  float Y = abs(map(mouseY,height,0,1,-1));
  if (X > Y) {
    speed = (int) map(Y,0,1,speed_min,speed_max);
  } else {
    speed = (int) map(X,0,1,speed_min,speed_max);
  }
}

float getRandom() {
  return map(randomGaussian(),-3.7,3.7,-2,2);
}

void randomizeAll() {
  random = getRandom();
  random_red = random;
  random_green = random;
  random_blue = random;
  random_gray = random;
}

void randomizeRed() {
  random_red = getRandom();
}

void randomizeGreen() {
  random_green = getRandom();
}

void randomizeBlue() {
  random_blue = getRandom();
}

void randomizeGray() {
  random_gray = getRandom();
}

void updateKeyboard() {
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      randomizeRed();
    }
    if (key == 'g' || key == 'G') {
      randomizeGreen();
    }
    if (key == 'b' || key == 'B') {
      randomizeBlue();
    }
    if (key == 'w' || key == 'W') {
      randomizeGray();
    }
  }
  if (mousePressed) {
    if (mouseButton == LEFT) {
      randomizeAll();
    }
  }
}

void updateAll(){
  updateColors();
  debug();
  updateSpeed();
  updateKeyboard();
}

void debug() {
  println(" - - - ");
  println("red "+red);
  println("green "+green);
  println("blue "+blue);
  println("gray "+gray);
  println("random "+random);
  println("speed "+speed);
}

void setup() {
  size(700, 700);
  background(27);
  noStroke();
  updateAll();
}

void draw() {
  if  (i < width) {
    fill(red*255, green*255, blue*255);
    rect(0, i, width, 10);
    delay(speed);
    fill(gray*255);
    rect(i, 0, 10, height);
    delay(speed);
    updateAll();
    i += 20;
  } else {
    i = 0;
  }
}
