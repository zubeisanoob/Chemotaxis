Bacteria [] bob;
String bias = "0";
boolean err = false;
PFont openSans;

void setup() {     
  size(500, 500);
 	bob = new Bacteria[10];
  for (int i = 0; i < bob.length; i++) {
    bob[i] = new Bacteria(color(randomRGB(), randomRGB(), randomRGB()), Integer.parseInt(bias)*10);
  }
  
  openSans = createFont("OpenSans-Regular.ttf", 20);
}   

void draw() {    
  background(217, 238, 41); 
  for (int i = 0; i < bob.length; i++) {
    bob[i].myBias = Integer.parseInt(bias)*10;
    bob[i].walk();
    bob[i].show();
    
  }
}

void keyPressed() {
  String value = Character.toString(key);
  if (key == '\n') {
    bias = "0";
  }
  else if (value.equals("0") || value.equals("1") || value.equals("2") || value.equals("3") || value.equals("4") || value.equals("5") || value.equals("5") || value.equals("-")) {
    if (value.equals("-") && bias.length() > 1) {
      bias = "-" + bias.substring(1, bias.length());
    } else {
      if (value.equals("-") == false) {
        bias += key;
      }
    }
    
  }
}

int randomRGB() {
  return (int)(Math.random()*255);
}

void mousePressed() {
  for (int i = 0; i < bob.length; i++) {
    bob[i].destX = mouseX;
    bob[i].destY = mouseY;
  }
}

class Bacteria {     
  int myX, myY, myColor, destX, destY, myBias;
  Bacteria(int c, int bias) {
    myBias = bias;
    myX = 250;
    myY = 250;
    destX = myX + (int)(Math.random()*200)-(100+myBias);
    destY = myY + (int)(Math.random()*200)-(100+myBias);
    myColor = c;
  }
  void walk() {
    if (destX > 500 || destX < 0 || destY > 500 || destY < 0) {
      destX = myX + (int)(Math.random()*200)-(100+myBias);
      destY = myY + (int)(Math.random()*200)-(100+myBias);
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
        destX = myX + (int)(Math.random()*200)-(100 +myBias);
        destY = myY + (int)(Math.random()*200)-(100 +myBias);
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
