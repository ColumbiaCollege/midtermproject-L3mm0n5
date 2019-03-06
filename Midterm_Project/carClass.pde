class Car {
  //initialize varibles
  float xPos;
  int yPos;
  int carNum[];
  float previousXPos;

  Car(int tempRow) {
    //resize car image and set position variables
    vehicle.resize(80, 0);
    yPos = 100*tempRow;
    xPos = random(50,5000);
  }
  void Display() {
    //center and then display image
    imageMode(CENTER);
    image(vehicle, xPos, yPos);    
  }
  void Move() {
    //moves car contantly to the left and loop around screen
    xPos--;
 if (xPos < -50)
    xPos = width+200;
  }
}
