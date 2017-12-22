import websockets.*;

WebsocketServer ws;
int now;
float x, y, xOld, yOld;

float ballX = 0;
float ballY = 0;

float player1Y = 0;
float player2Y = 0;

int playerHight = 40;

void setup() {
  size(600, 400);
//fullScreen();
  ws= new WebsocketServer(this, 8025, "/john");
  now=millis();
  x=0;
  y=0;
  stroke(255);
  strokeWeight(5);
}

void draw() {
  background(0);
  x=mouseX;
  y=mouseY;
  
  line(width/2,0,width/2,height);
  ellipse(x, y, 10, 10);
  if (xOld != x || yOld != y) {
    String meess = x + " " + y; 
    xOld = x;
    yOld = y;
    player2Y = y;
    ws.sendMessage(meess);
  }
  ellipse(ballX,ballY,10,10);
  line(width-50,player1Y-playerHight, width-50,player1Y+playerHight);
  line(50,player2Y-playerHight, 50,player2Y+playerHight);
}

void webSocketServerEvent(String msg) {
  println(msg);
  float[] SerialDataArr;
  SerialDataArr = float(split(msg, " "));
  player1Y = SerialDataArr[0];
  ballX = SerialDataArr[1];
  ballY= SerialDataArr[2];
  
  
}
