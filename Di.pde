class Di {
  int x; 
  int y; 
  int w; 
  int val; 
  
  Di(int xi, int yi, int wi) {
    x = xi; 
    y = yi; 
    w = wi; 
    val = floor(random(1, 7));
  }
  
  void drawDi() {
    stroke(0); 
    fill(255); 
    rectMode(CENTER); 
    rect(x, y, w, w); 
    fill(0); 
    if (val == 6 || val == 4 || val == 5) {
      ellipse(x-w/4, y-w/4, w/6, w/6);
    }
    if (val == 6) {
      ellipse(x-w/4, y, w/6, w/6);
    }
    if (val == 6 || val == 4 || val == 5 ||  val == 2 || val == 3) {
      ellipse(x-w/4, y+w/4, w/6, w/6);
    }
    if (val == 1 || val == 3 || val == 5) {
      ellipse(x, y, w/6, w/6);
    }
    if (val == 6 || val == 4 || val == 5 ||  val == 2 || val == 3) {
      ellipse(x+w/4, y-w/4, w/6, w/6);
    }
    if (val == 6) {
      ellipse(x+w/4, y, w/6, w/6);
    }
    if (val == 6 || val == 4 || val == 5) {
      ellipse(x+w/4, y+w/4, w/6, w/6);
    }
  }
  void roll() {
    val = floor(random(1, 7));
  }
  int getValue() {
    return val;
  }
}