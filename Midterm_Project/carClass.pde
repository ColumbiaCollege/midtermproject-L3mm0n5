

class Car {
  
  float xPos;
  int yPos;
  int carNum[];
  float previousXPos;
  //int carY[];

  Car(int tempRow, int tempXpos) {
    vehicle.resize(80, 0);
    yPos = 100*tempRow;
    xPos = random(50,5000);
    //carY[0] = 550;
    //carY[1] = 600;
    //carY[2] = 650;
  }
  void Display() {
    imageMode(CENTER);
    image(vehicle, xPos, yPos);
    
  }
  void Move() {

    xPos--;

 if (xPos < -50)
      //ship went left
    xPos = width+200;
  }
}
