//Frogger inspired "game" - Caleb

//initialize variables
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;
PImage vehicle;
int gamestate;
//initialize frog and cars
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
    cars[y] = new Car(y%9, y*58);
  }
  gamestate = 0;
}

void draw() {

  switch(gamestate) {
  case 0:
    background(#D2F2C6);
    //add instructions
    fill(0);
    textSize(22);
    textAlign(CENTER);
    text("Use the arrow keys to move. Avoid the cars!", width/2, 50);
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
    fill(#D2F2C6);
    rect(0, 0, width, 80);
    fill(0);
    textAlign(CENTER);
    textSize(64);
    text("GAME OVER!", 250, 500);
    noLoop();
    break;
  }
}
void keyReleased() {

  //if the arrow keys are pressed, the frog will move
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
