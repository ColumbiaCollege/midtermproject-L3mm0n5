//initialize direction changing variables
int dir = 0;

class Frog {
  //initialize position and image variables
  float xPos =0;
  float yPos = 0;     
  float previousXPos =0;
  float previousYPos =0;
  PImage frog;
  PImage frogDown;
  PImage frogLeft;
  PImage frogRight;

  Frog() {
    //load 4 directions of frog images
    frog = loadImage("frogUp.png");
    frogDown = loadImage("frogDown.png");
    frogLeft = loadImage("frogLeft.png");
    frogRight = loadImage("frogRight.png");
    
    //set initial postion
    xPos = width/2;
    yPos = height-100;
    previousXPos = xPos;
    previousYPos = yPos;
  }
  void Move() {
    //Moves frog in a gridlike pattern and switches dir variable, used for setting correct directional image
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
  }

  void Display() {
    //Use the "dir" variable to change frog's image based on what direction it's facing
    imageMode(CENTER);
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
  // When frog dies, change gamestate to 1 (gameover screen)
  void dies() {
    gamestate = 1;
  }
}
