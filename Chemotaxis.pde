Bacteria [] bob;

void setup() {     
  size(500, 500);
 	bob = new Bacteria[10];
  for (int i = 0; i < bob.length; i++) {
    bob[i] = new Bacteria(color(randomRGB(), randomRGB(), randomRGB()));
  }
}   

void draw() {    
  background(217, 238, 41); 
  for (int i = 0; i < bob.length; i++) {
    bob[i].walk();
    bob[i].show();
  }
}

int randomRGB() {
  return (int)(Math.random()*255);
}

class Bacteria {     
  int myX, myY, myColor, destX, destY;
  Bacteria(int c) {
    myX = 250;
    myY = 250;
    destX = myX + (int)(Math.random()*200)-100;
    destY = myY + (int)(Math.random()*200)-100;
    myColor = c;
  }
  void walk() {
    if (destX > 500 || destX < 0 || destY > 500 || destY < 0) {
      destX = myX + (int)(Math.random()*200)-100;
      destY = myY + (int)(Math.random()*200)-100;
    }
    else if (dist(myX, myY, destX, destY) > 0) {
      if (Math.abs(myX - destX) > 0) {
        if (myX - destX > 0) {
          myX--;
        } else {
          myX++;
        }
      }
      if (Math.abs(myY - destY) > 0) {
        if (myY - destY > 0) {
          myY--;
        } else {
          myY++;
        }
      }
    } else if (dist(myX, myY, destX, destY) == 0) {
        destX = myX + (int)(Math.random()*200)-100;
        destY = myY + (int)(Math.random()*200)-100;
    } 
  }
  void show() {
    fill(myColor);
    ellipse(myX, myY, 25, 25);
    fill(0);
    ellipse(myX-5, myY-5, 5, 5);
    ellipse(myX+5, myY-5, 5, 5);
    arc(myX, myY-1, 50, 10, 1, HALF_PI);
  }
}    
