//Frogger inspired "game" - Caleb

//initialize variables
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;
PImage vehicle;
int gamestate;

//set memory for frog and cars objects
Frog frog;
Car car;
Car [] cars;

void setup() {
  //set image mode to center, set window size and background color
  imageMode(CENTER);
  size(500, 1000);
  background(#D2F2C6);
  
  //load car image
  vehicle = loadImage("car.png");
 
  //initialize frog and cars
  frog = new Frog();
  car = new Car(1, 200);
  cars = new Car[100];
  for (int y = 0; y < 100; y++) {
    cars[y] = new Car(y%9, y*58);
  }
  //set gamestate to "0," the main gamemode
  gamestate = 0;
}

void draw() {
  //gamestate switch, to switch between main gamemode and gameover gamemode 
  switch(gamestate) {
  //case 0, main gamemode
  case 0:
    background(#D2F2C6);
    
    //instructions
    fill(0);
    textSize(22);
    textAlign(CENTER);
    text("Use the arrow keys to move. Avoid the cars!", width/2, 50);
    
    //frog and car classes
    frog.Display();
    frog.Move();
    car.Display();
    car.Move();
    
    //make multiple cars
    for (int y = 0; y < 100; y++) {
      cars[y].Display();
      cars[y].Move();
    }
    
    //add background colored rectangle at the top of screen to cover cars
    fill(#D2F2C6);
    noStroke();
    rect(0, 0, width, 20);
    
    //make frog stop moving after pressing arrow key
    left = false;
    right = false;
    up = false;
    down = false;
 
    //check whether objects are colliding
    for (int i = 0; i< 100; i++) {
      checkCollide(cars[i].xPos, cars[i].yPos, frog.xPos, frog.yPos);
    }
    break;
  //case 1, gameover gamemode  
  case 1:

    //background colored rectangle to cover instructions
    fill(#D2F2C6);
    rect(0, 0, width, 80);
    fill(0);
    
    //gameover text 
    textAlign(CENTER);
    textSize(64);
    text("GAME OVER!", 250, 500);
    
    //freeze all objects where they are
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

//radius based collision using distance method
void checkCollide(float carX, float carY, float frogX, float frogY) {
  if (dist(carX, carY, frogX, frogY) < 40) {
    //when frog collides with a car, trigger dies method
    frog.dies();
  }
}
