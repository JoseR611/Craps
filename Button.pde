class Button{
  int x;
  int y;
  int w;
  int h;
  String words;
  Button(int buttonX, int buttonY, int buttonW, int buttonH, String message){
    x = buttonX;
    y = buttonY; //<>//
    w = buttonW;
    h = buttonH;
    words = message;
  }
  void drawButton(){
    rectMode(CORNER);
    fill(100);
    rect(x, y, w, h);
    fill(0);
    textSize(14);
    text(words, x + w / 3, y + h / 1.5);
  }
  boolean isInside(float xTest, float yTest){ //<>//
    if(xTest > x && xTest < x + w && yTest > y && yTest < y + h){ //<>//
      rect(x,y,w,h);
      return true;
    }
    return false;
  }
}