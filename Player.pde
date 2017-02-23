class Player{
  int x;
  int y;
  int w;
  Di d1;
  Di d2;
  Player(int xi, int yi, int wi, Di d1i, Di d2i){
    x = xi;
    y = yi;
    w = wi;
    d1 = d1i;
    d2 = d2i;
  }
  void drawPlayer(){
    //face
    fill(255, 255, 0);
    ellipse(x, y, w, w);
    fill(0);
    ellipse(x - w / 6, y - w / 6, w / 6, w / 6);
    ellipse(x + w / 6, y - w / 6, w / 6, w / 6);
    if(lost){
      bezier(x - w / 6, y + w / 3, x - w / 6, y + w / 6, x + w / 6, y + w / 6, x + w / 6, y + w / 3);
    }else{
      bezier(x - w / 6, y + w / 6, x - w / 6, y + w / 3, x + w / 6, y + w / 3, x + w / 6, y + w / 6);
    //face
    }
    //dice
    d1.drawDi();
    d2.drawDi();
    //dice
    //money
    text("Money: $" + moneyDisplayed + "    Bet amount:$" + bet + (char)0xA + canBet, 350, 150);
    b3.drawButton();
    b4.drawButton();
    b5.drawButton();
    b6.drawButton();
}
  int rollDice(Di d1, Di d2){
    return d1.getValue() + d2.getValue();
  }
}