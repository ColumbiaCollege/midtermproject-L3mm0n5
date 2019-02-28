//frogger clone
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;
Frog frog;
void setup() {
  size(500, 1000);
  background(#D2F2C6);
  frog = new Frog();
  imageMode(CENTER);
}

void draw() {
  background(#D2F2C6);
  fill(0);
  rect(0,0,width,20);
  fill(255);
  //Lives Display
  frog.Display();
  frog.Move();

  left = false;
  right = false;
  up = false;
  down = false;
}
void keyReleased() {

  //if the arrow keys aren't pressed the (object) will stop moving
  if (keyCode == LEFT) {
    left = true;
  }
  if (keyCode == RIGHT) {
    right = true;
  }
  if (keyCode == UP) {
    up = true;
  }
  if (keyCode == DOWN) {
    down = true;
  }
}
