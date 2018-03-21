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
boolean loop = true;
boolean tut = true;

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
  green = pow(red_alwaysPositive * 1.4,0.3)  + random_green;
}

void updateSpeed() {
  int speed_min = 5;
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

void keyPressed() {
  if (tut) {
   tut = false;
   background(27);
   return;
  }
  if (key == 'r' || key == 'R') {
    randomizeRed();
    return;
  }
  if (key == 'g' || key == 'G') {
    randomizeGreen();
    return;
  }
  if (key == 'b' || key == 'B') {
    randomizeBlue();
    return;
  }
  if (key == 'w' || key == 'W') {
    randomizeGray();
    return;
  }
  if (key == 'c' || key == 'C') {
    background(gray*255);
    return;
  }
   if (keyCode == 32) {
     if (loop) {
      loop = false;
      noLoop();
      return;
     } else {
      loop();
      loop = true;
      return;
     }
  }
}

void mousePressed() {
  if (tut) {
   tut = false;
   background(27);
   return;
  }
  if (mouseButton == LEFT) {
    randomizeAll();
  }
}

void updateAll(){
  updateColors();
  debug();
  updateSpeed();
}

void debug() {
  println(" - - - ");
  println("red "+red);
  println("green "+green);
  println("blue "+blue);
  println("gray "+gray);
  println("speed "+speed);
}

void tutorial() {
 int lineHeight = 38;
 background(255);
 fill(50, 152, 223);
 textSize(lineHeight - 10);
 text("r", 200,200 + lineHeight * 0); text("randomize red", 270,200 + lineHeight * 0);
 text("g", 200,200 + lineHeight * 1); text("randomize green", 270,200 + lineHeight * 1);
 text("b", 200,200 + lineHeight * 2); text("randomize blue", 270,200 + lineHeight * 2);
 text("w", 200,200 + lineHeight * 3); text("randomize gray", 270,200 + lineHeight * 3);
 text("c", 200,200 + lineHeight * 4); text("clear drawing", 270,200 + lineHeight * 4);
 text("space", 140,200 + lineHeight * 5); text("pause drawing", 270,200 + lineHeight * 5);
 text("mouse left", 70,200 + lineHeight * 6); text("randomize all", 270,200 + lineHeight * 6);
 fill(0, 50, 75);
 text(">move the mouse to change color/speed", 70,200 + lineHeight * 8);
 text(">press any key to start<", 140,200 + lineHeight * 10);
}

void setup() {
  size(700, 700);
  background(27);
  noStroke();
  updateAll();
}

void draw() {
  if (tut) {
   tutorial();
  } else {
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
}
