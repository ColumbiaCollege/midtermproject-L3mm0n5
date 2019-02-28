boolean yDir = false;
boolean xDir = false;
int dir = 0;

class Frog {
  float xPos =0;
  float previousXPos =0;
  float previousYPos =0;
  float yPos = 0;      
  PImage frog;
  PImage frogDown;
  PImage frogLeft;
  PImage frogRight;

  Frog() {
    frog = loadImage("frogUp.png");
    frogDown = loadImage("frogDown.png");
    frogLeft = loadImage("frogLeft.png");
    frogRight = loadImage("frogRight.png");
    xPos = width/2;
    yPos = height-100;
    previousXPos = xPos;
    previousYPos = yPos;
  }
  void Move() {
    previousXPos =xPos;
    previousYPos =yPos;    
    if (left) {
      xPos = xPos - 40;
      dir = 3;
    }
    if (right) {
      xPos = xPos + 40;
      dir = 1;
    }
    if (up) {
      yPos = yPos - 40;
      dir = 0;
    }
    if (down) {
      yPos = yPos + 40;
      dir = 2;
    }
    if (yPos - previousYPos >0 && previousYPos!= 0)
      //frog went down, 
      yDir = false;
    if (previousYPos - yPos >0 && previousYPos!= width)
      //frog went up
      yDir = true;
    if (xPos - previousXPos >0 && previousXPos!= 0)
      //frog went down, 
      xDir = false;
    if (previousXPos - xPos >0 && previousXPos!= width)
      //frog went up
      xDir = true;
  }

  void Display() {
    if (dir == 0) {
      image(frog, xPos, yPos);
    }
    if (dir == 1) {
      image(frogRight, xPos, yPos);
    }
    if (dir == 2) {
      image(frogDown, xPos, yPos);
    }
    if (dir == 3) {
      image(frogLeft, xPos, yPos);
    }
  }
  boolean frogY() {
    if (yDir) {
      return true;
    } else {
      return false;
    }
  }
  boolean frogX() {
    if (xDir) {
      return true;
    } else {
      return false;
    }
  }
}
