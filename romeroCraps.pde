Di A = new Di (100, 250, 100);
Di B = new Di (300, 250, 100);
Player p = new Player (200, 150, 100, A, B);
Button b1 = new Button (25, 325, 100, 50, "Roll");
Button b2 = new Button (275, 325, 100, 50, "Reset");
Button b3 = new Button (400, 200, 100, 50, "$100");
Button b4 = new Button (550, 200, 100, 50, "$200");
Button b5 = new Button (400, 300, 100, 50, "$500");
Button b6 = new Button (550, 300, 100, 50, "All in");
int dice1 = A.getValue();
int dice2 = B.getValue();
int point;
boolean firstRoll = true;
boolean enableRoll = true;
String msg = "         Press Roll to start the game";//text
String reset = "Press Reset to play again";
boolean lost = false;
int startMoney = 1000;
int moneyDisplayed = 1000;
int bet = 0;
boolean betEnabled = true;
String canBet = "Choose your bet";
void setup(){
  size(700,400);
}
void draw(){
  background(128);
  textSize(20);
  text(msg, 300, 100);
  p.drawPlayer();
  b1.drawButton(); //<>//
  b2.drawButton(); //<>//
}
void mouseReleased(){
  if(b1.isInside(mouseX, mouseY) && enableRoll){
    A.roll(); //<>//
    B.roll(); //<>//
    dice1 = A.getValue();
    dice2 = B.getValue();
    betEnabled = false;
    canBet = " ";
    if(!firstRoll){
      if(dice1 + dice2 == point){
        msg = "         You won!  " + reset;
        enableRoll = false;
        moneyDisplayed = moneyDisplayed + bet * 2;
        bet = 0;
        startMoney = moneyDisplayed;
      }else if(dice1 + dice2 == 7){
        msg = "         You lost!  " + reset;
        enableRoll = false;
        lost = true;
        bet = 0;
        startMoney = moneyDisplayed;
      }
      startMoney = moneyDisplayed + bet;
    }else if(firstRoll){
      if(dice1 + dice2 == 2 || dice1 + dice2 == 3 || dice1 + dice2 == 12){
        msg = "         You lost!  " + reset;
        enableRoll = false;
        lost = true;
        bet = 0;
        startMoney = moneyDisplayed;
      }else if(dice1 + dice2 == 7 || dice1 + dice2 == 11){
        msg = "         You won!  " + reset;
        enableRoll = false;
        moneyDisplayed = moneyDisplayed + bet * 2;
        startMoney = moneyDisplayed;
        bet = 0;
      }else{
        point = dice1 + dice2;
        firstRoll = false;
        msg = "         Roll again for " + point;
      }
    }
  }else if(b2.isInside(mouseX, mouseY)){
    firstRoll = true;
    point = 0;
    enableRoll = true;
    msg = "         Press Roll to start the game";
    lost = false;
    moneyDisplayed = startMoney;
    bet = 0;
    betEnabled = true;
    canBet = "Choose your bet";
  }else if(b3.isInside(mouseX, mouseY) && betEnabled){
    if(moneyDisplayed >= 100){
      bet+=100;
      moneyDisplayed-=100;
    }
  }else if(b4.isInside(mouseX, mouseY) && betEnabled){
    if(moneyDisplayed >= 200){
      bet+=200;
      moneyDisplayed-=200;
    }
  }else if(b5.isInside(mouseX, mouseY) && betEnabled){
    if(moneyDisplayed >= 500){
      bet+=500;
      moneyDisplayed-=500;
    }
  }else if(b6.isInside(mouseX, mouseY) && betEnabled){
    bet = moneyDisplayed;
    moneyDisplayed = 0;
  }
}