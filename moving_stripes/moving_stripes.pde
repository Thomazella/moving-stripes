/**
 * Width and Height. 
 * 
 * The 'width' and 'height' variables contain the width and height 
 * of the display window as defined in the size() function. 
 */
int i = 0;
float red;
float green;
float blue;
float gray;
int speed;
float noiseScale = 0.02;
float noise = 1;

void updateColors() {
  red = map( mouseX,width, 0,0,1);
  
  //gray = map(mouseY,height,0,0,1) * noise * noiseScale;
  
  blue = red - 0.2;
  if (blue < 0) {
    blue = 0;
  }
  if (blue > 1) {
    blue = 1;
  }
  
  green = red + 0.2;
  if (green < 0) {
    green = 0;
  }
  if (green > 1) {
    green = 1;
  }
}

void updateSpeed() {
  float X = abs(map(mouseX,width ,0,1,-1));
  float Y = abs(map(mouseY,height,0,1,-1));
  if (X > Y) {
    speed = (int) map(Y,0,1,5,65);
  } else {
    speed = (int) map(X,0,1,5,65);
  }
}

void updateAll(){
  updateColors();
  updateSpeed();
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
    updateAll();
    fill(gray*255);
    rect(i, 0, 10, height);
    delay(speed);
    updateAll();
    i += 20;
  } else {
    i = 0;
    gray = map(mouseY,height,0,0,1) * noise(mouseY) * noiseScale;
  }
}
