//frogger clone
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;
PImage vehicle;
int gamestate;
Frog frog;
Car car;
Car [] cars;
void setup() {
  imageMode(CENTER);
  size(500, 1000);
  background(#D2F2C6);
  vehicle = loadImage("car.png");
  frog = new Frog();
  car = new Car(1, 200);

  cars = new Car[100];
  for (int y = 0; y < 100; y++) {
    cars[y] = new Car(y%8, y*58);
  }
  gamestate = 0;
}

void draw() {

  switch(gamestate) {
  case 0:
    background(#D2F2C6);

    frog.Display();
    frog.Move();
    car.Display();
    car.Move();
    for (int y = 0; y < 100; y++) {
      //cars[y] = new Car(1,y);
      cars[y].Display();
      cars[y].Move();
      //collision here
    }

    fill(#D2F2C6);
    noStroke();
    rect(0, 0, width, 20);
    //fill(255);
    //Lives Display
    left = false;
    right = false;
    up = false;
    down = false;

    for (int i = 0; i< 100; i++) {
      checkCollide(cars[i].xPos, cars[i].yPos, frog.xPos, frog.yPos);
    }
    break;
  case 1:
  
    //background(#D2F2C6);
    //replace this with game over
    fill(0);
    textAlign(CENTER);
    textSize(64);
    text("GAME OVER!", 250, 500);
    noLoop();
      break;
  }
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

void checkCollide(float carX, float carY, float frogX, float frogY) {
  if (dist(carX, carY, frogX, frogY) < 40) {
    frog.dies();
  }
}
