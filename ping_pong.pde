float player1Y;
float player1Yspeed;
float player2Y;
float player2Yspeed;
int playerHight = 40;

float ballX, ballY, ballXspeed, ballYspeed;

boolean gameOver = false;


void setup() {
  fullScreen();
  restatGame();
  ballXspeed = -10;
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(10);

  controll();

  if (gameOver) {
    text("GAME OVER", 100, 100);
  } else {
    line(width/2, 0, width/2, height);

    drawBall();
    drawPlayer();
  }
}

void restatGame() {
  player1Yspeed = 0;
  player2Yspeed = 0;
  player1Y = height/2;
  player2Y = height/2;
  ballX = width/2;
  ballY = random(0, height);
  ballYspeed = random(-5, 5);
  gameOver = false;
}

void drawPlayer() {
  line(width-50, player1Y-playerHight, width-50, player1Y+playerHight);
  line(50, player2Y-playerHight, 50, player2Y+playerHight);
}

void drawBall() {

  // move ball
  ballX += ballXspeed;
  ballY += ballYspeed;

  if (ballX < 50) {
    if (ballY < player2Y+playerHight && ballY > player2Y-playerHight) {
      ballXspeed = -1 * ballXspeed;
      ballYspeed = 10 * (ballY - player2Y) / playerHight;
      ballX = 50;
      
    }
  } else if ( ballX >= width-50) {
    if (ballY < player1Y+playerHight && ballY > player1Y-playerHight) {
      ballXspeed = -1 * ballXspeed;
      ballYspeed = 10 * (ballY - player1Y) / playerHight;
      ballX = width-50;

    }
  }

  if (ballY>height) {
    ballY = height;
    ballYspeed = -1 * ballYspeed;
  } else if (ballY<0) {
    ballY = 0;
    ballYspeed = -1 * ballYspeed;
  }

  if (ballX > width) {
    gameOver = true;
    ballXspeed = -10;
  }else if(ballX<0) {
    gameOver = true;
    ballXspeed = 10;
  }
  // draw ball
  ellipse(ballX, ballY, 10, 10);
}

void controll() {
  player1Y += player1Yspeed;
  player2Y += player2Yspeed;
}
